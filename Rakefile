def symlink(target, link)
  puts "Linking #{link} => #{target}"

  if File.symlink?(link)
    unlink(link)
  elsif File.exist?(link)
    puts "File exists: #{link}"
    exit 0
  end
  File.symlink(target, link)
end

def delete_symlink(link)
  unlink(link) if File.symlink?(link)
end

def unlink(link)
  if File.exist?(link)
    descriptor = File.symlink?(link) ? "symlink" : "file"
    puts "Deleting #{descriptor} #{link}"
    File.unlink(link)
  end
end

def pwd; File.dirname(__FILE__); end

def target_path(file)
  File.join(ENV["HOME"], ".#{file}")
end

files = File.new(File.join(pwd, "files"), "r").read.split("\n")

task :install => [:init_submodules] do
  files.each do |file|
    symlink(File.join(pwd, file), target_path(file))
  end
end

task :uninstall do
  files.each do |file|
    unlink(target_path(file))
  end
end

task :init_submodules do
  puts "Installing submodules"
  `git submodule update --init --recursive`
end

task :default => [:uninstall, :install]
