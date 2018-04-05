# README

## Install Style

1. Copy the provided `keymaps/*.xml` into `$HOME/.IdeaXXX/config/keymaps/`
2. Restart Intellij.

## Use reniced

This app lets set up the `nice` number and `ionice` number automatically for IntelliJ related processes.

```
# apt-get install reniced
# cat reniced/reniced.conf >> /etc/reniced.conf
# service reniced start

```

Then add to CronTab via `crontab -e` the following:

```
* * * * * /usr/sbin/service reniced start
```
