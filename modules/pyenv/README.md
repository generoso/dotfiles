# pyenv

https://github.com/pyenv/pyenv

Pre-requisites:

```
sudo apt-get install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev
```

Installation (it comes with virtualenv plugin)

```
curl https://pyenv.run | bash
```

Then you can add these to .bashrc:

```
# pyenv config from .dotfiles
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Note: on MacOS the above lines make the shell very slow. So I dropped them from .bashrc
and created an alias in `./shell/aliases/pyenv.sh` to activate pyenv in a shell.

Test:
```
pyenv install 3.10.6
pyenv virtualenv 3.10.6 sandbox-3.10.6
pyenv activate sandbox-3.10.6
```
