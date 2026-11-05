local terminal = "com.superlogical.terminal"

local function in_jj_repo(dir)
  while dir and dir ~= "" do
    local f = io.open(dir .. "/.jj", "r")
    if f then f:close() return true end
    dir = dir:match("^(.*)/[^/]*$")
  end
  return false
end

local bounds = { 0.05, 0.05, 0.9, 0.9 }
local floats = { vcs = true, btop = true }

local function open_float(block_id)
  local view = rex.session.view{}
  for _, window in ipairs(view.windows or {}) do
    for _, layer in ipairs(window.layers or {}) do
      for _, block in ipairs(layer.blocks or {}) do
        if layer.kind == "floating" and floats[block.label] and block.block_id == block_id then
          return layer.layer_id, block.label
        end
      end
    end
  end
end

local function minimised_block(label)
  local listing = rex.session.list_blocks{}
  for _, block in ipairs(listing.blocks or {}) do
    if block.label == label and block.placement == "detached" then
      return block.block_id
    end
  end
end

local function restore_float(block_id, anchor)
  rex.session.move_block{ block_id = block_id, anchor_block_id = anchor, direction = "vertical" }
  rex.session.float_block{ block_id = block_id, bounds = bounds }
  rex.session.focus_block{ block_id = block_id }
end

local function toggle_float(ctx, label, pick_command, minimise)
  local layer, open_label = open_float(ctx.block_id)
  if layer then
    if minimise and open_label == label then
      rex.session.detach_block{ block_id = ctx.block_id }
    else
      rex.session.close_layer{ layer_id = layer }
    end
    return
  end

  local hidden = minimise and minimised_block(label)
  if hidden then
    restore_float(hidden, ctx.block_id)
    return
  end

  local pwd = rex.block.call(terminal, "pwd", { block_id = ctx.block_id })
  local proc = rex.block.call(terminal, "process", { block_id = ctx.block_id })
  local cwd = (pwd and pwd.pwd) or (proc and proc.foreground and proc.foreground.cwd)
  local _, err = rex.session.new_layer{
    bounds = bounds,
    focus  = true,
    layout = rex.layout.block{
      flavor  = terminal .. ".shell",
      label   = label,
      options = { command = { pick_command(cwd) }, cwd = cwd },
    },
  }
  if err ~= nil then error(err, 0) end
end

rex.action{
  name  = "vcs_float",
  title = "Toggle jjui or lazygit",
  run   = function(ctx, args)
    toggle_float(ctx, "vcs", function(cwd) return in_jj_repo(cwd) and "jjui" or "lazygit" end)
  end,
}

rex.action{
  name  = "btop_float",
  title = "Toggle btop",
  run   = function(ctx, args)
    toggle_float(ctx, "btop", function() return "btop" end, true)
  end,
}

rex.action{
  name  = "fork_claude",
  title = "Fork Claude",
  run   = function(ctx, args)
    local proc = rex.block.call(terminal, "process", { block_id = ctx.block_id })
    local fg = proc and proc.foreground
    if not fg or fg.name ~= "claude" then error("focused pane isn't running claude", 0) end
    local f = io.open(os.getenv("HOME") .. "/.claude/sessions/" .. fg.pid .. ".json")
    if not f then error("no claude session file for pid " .. fg.pid, 0) end
    local id = rex.json.decode(f:read("*a")).sessionId
    f:close()
    local _, err = rex.session.new_window{
      window_label = "claude fork",
      layout       = rex.layout.block{
        flavor  = terminal .. ".shell",
        options = { command = { "claude", "--resume", id, "--fork-session" }, cwd = fg.cwd },
      },
    }
    if err ~= nil then error(err, 0) end
  end,
}

rex.bind("ctrl+alt+shift+f", "fork_claude")
rex.bind("ctrl+alt+shift+l", "vcs_float")
rex.bind("ctrl+alt+shift+b", "btop_float")
