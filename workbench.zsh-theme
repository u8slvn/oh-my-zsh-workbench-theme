# prompt builder function ans status function inspired from the agnoster theme

# check if workbench theme custom vars are defined
if [ -z $OMZSH_WORKBENCH_PROMPT_INLINE ]; then OMZSH_WORKBENCH_PROMPT_INLINE="false"; fi
if [ -z $OMZSH_WORKBENCH_PROMPT_STATUS ]; then OMZSH_WORKBENCH_PROMPT_STATUS="true"; fi
if [ -z $OMZSH_WORKBENCH_SHORT_PWD ]; then OMZSH_WORKBENCH_SHORT_PWD="false"; fi

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
    [[ $OMZSH_WORKBENCH_SHORT_PWD = "true" ]] && workbench_pwd="${PWD##*/}" || workbench_pwd="${PWD/$HOME/~}"
    echo -ne "⚒ %{$FG[033]%}$workbench_pwd%{$reset_color%}"
}

# add a line break
function end_line() {
    if [ $OMZSH_WORKBENCH_PROMPT_INLINE = "false" ]; then
        echo ""
    fi
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
    [[ $OMZSH_WORKBENCH_PROMPT_STATUS = "true" ]] && prompt_status
    prompt_input
}

PROMPT='$(display_prompt)'