# Utilities to work with python venv

envs_dir=~/.venvs/
env_file=.venv

## Autocompletion

_envs() {
    local envs cur
    envs=$(ls ${envs_dir})
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$envs" -- ${cur}) )
    return 0
}

## Create env

env_create() {
    mkdir -p $envs_dir
    cd $envs_dir
    python3 -m venv $1
    cd - > /dev/null
}

## Activate env

env_activate() {
    source ${envs_dir}/$1/bin/activate
}

complete -F _envs env_activate

## Deactivate env

alias env_deactivate=deactivate

## Install env for auto activation

env_install() {
    local env=$1
    echo $env > $env_file
}

complete -F _envs env_install

## Activate when entering a directory with .venv file

PROMPT_COMMAND='prompt'

prompt() {
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e $env_file && env_activate $(cat $env_file)
    fi
}