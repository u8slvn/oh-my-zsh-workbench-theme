# prompt builder function inspired from the agnoster theme

# zsh git info theme
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$FG[197]%}⎇ %{$FG[123]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[214]%}±"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[154]%}✔"
# zsh git status theme
ZSH_THEME_GIT_PROMPT_ADDED="✚ "
ZSH_THEME_GIT_PROMPT_DELETED="✖ "
ZSH_THEME_GIT_PROMPT_MODIFIED="✸ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="✻ "
ZSH_THEME_GIT_PROMPT_RENAMED="➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="⤔ "

# working directory
function get_pwd() {
  echo -ne "⚒ %{$FG[033]%}${PWD/$HOME/~}%{$reset_color%}"
}

# add a line break
function end_line() {
	echo ""
}

# check the prompt status
function prompt_status() {
	if [ $RETURN -ne 0 ]; then
		echo -ne "%{$FG[160]%}✘ "
	fi
	if [ $(jobs -l | wc -l) -gt 0 ]; then
		echo -ne "%{$FG[105]%}⚙ "
	fi
}

# display git informations
function git_prompt() {
	echo -ne "$(git_prompt_info) %{$FG[192]%}$(git_prompt_status)%{$reset_color%}"
}

# input line
function prompt_input() {
	echo -ne "%{$FG[154]%}▷%{$reset_color%} "
}

# prompt builder
function display_prompt() {
	RETURN=$?
	end_line
	get_pwd
	git_prompt
	end_line
	prompt_status
	prompt_input
}

PROMPT='$(display_prompt)'