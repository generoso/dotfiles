# Utilities to work with python venv

envs_dir=~/envs/
env_file=.venv

## Create env

create_env() {
    cd $envs_dir
    python3 -m venv $1
    cd - > /dev/null
}

## Activate env

activate_env() {
    source ${envs_dir}/$1/bin/activate
}

## Autocompletion

_envs() {
    local envs cur
    envs=$(ls ${envs_dir})
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$envs" -- ${cur}) )
    return 0
}

complete -F _envs activate_env

## Activate when entering a directory with .venv file

PROMPT_COMMAND='prompt'

prompt() {
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e $env_file && activate_env $(cat $env_file)
    fi
}

## Install env for auto activation

install_env() {
    local env=$1
    echo $env > $env_file
}

complete -F _envs install_env
