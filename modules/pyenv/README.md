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

Then add these to .bashrc (should be already there if using dotfiles):

```
# pyenv config from .dotfiles
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```


Test:
```
pyenv install 3.10.6
pyenv virtualenv 3.10.6 sandbox-3.10.6
pyenv activate sandbox-3.10.6
```
