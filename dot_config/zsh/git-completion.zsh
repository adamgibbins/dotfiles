# Complete modified files and recent commits
. /opt/homebrew/share/zsh/site-functions/git-completion.bash

functions[_git_diff_refs]=$functions[_git_diff]
_git_diff () {
	case "$cur" in
	-*) _git_diff_refs ;;
	*) __git_complete_index_file "--modified" ;;
	esac
}

functions[_git_show_refs]=$functions[_git_show]
_git_show () {
	emulate -L zsh
	[[ $cur == -* ]] && { emulate ksh -c _git_show_refs; return }
	local -a commits=(${(f)"$(git log -50 --format='%h:%s' 2>/dev/null)"})
	_describe -t commits 'recent commits' commits && _ret=0
	emulate ksh -c _git_show_refs
}
