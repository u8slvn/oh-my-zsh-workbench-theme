# Workbench ⚒ Theme for Oh My ZSH

A personal Oh My ZSH theme with Git status.

## Preview
![Short prompt](https://docs.google.com/uc?id=0B30nOrEpfS9zR3BndmtQUUtuS00)

## Installation

1. Download the `workbench.zsh-theme` into `~/.oh-my-zsh/themes`

2. Open your `.zshrc` file and set `ZSH_THEME` to `workbench`

3. Reload ZSH

4. Watch for [customization options](#customization)

## Prompt status

* **⚙** : background job(s) working
* **✘** : previous command failed

## Git legend

####Informations

* **±** : dirty working directory
* **✔** : clean working directory

####Status
* **✚** : added file(s)
* **✖** : deleted file(s)
* **✸** : modified file(s)
* **✻** : untracked file(s)
* **➜** : renamed file(s)
* **⤔** : unmerged file(s)

## Customization

Workbench theme provides you some customization options.

#### Use

Add this to your `.zshrc` file :
```
# Workbench theme customization
OMZSH_WORKBENCH_PROMPT_INLINE="false"
OMZSH_WORKBENCH_PROMPT_STATUS="true"
OMZSH_WORKBENCH_SHORT_PWD="false"
```

#### Details

* `OMZSH_WORKBENCH_PROMPT_INLINE` allow you to display the prompt line on one line
* `OMZSH_WORKBENCH_PROMPT_STATUS` allow you to hide the prompt status part
* `OMZSH_WORKBENCH_SHORT_PWD` allow you to display only the working directory in the path 

#### Customization example

1. `OMZSH_WORKBENCH_SHORT_PWD="true"`
	
	![Short prompt](https://docs.google.com/uc?id=0B30nOrEpfS9zeHhGVGFNQjNnT2c)

2. `OMZSH_WORKBENCH_PROMPT_INLINE="true"`
	
	![Inline prompt](https://docs.google.com/uc?id=0B30nOrEpfS9zTWN4dGgzYUx3eDg)
