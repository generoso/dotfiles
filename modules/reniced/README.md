# README

Create a link to the reniced configuration file:

```
sudo ln -fs `realpath ~/.dotfiles/modules/reniced/reniced.conf`
```

Set up the crontab:

```
sudo crontab -e
```

then add the line

```
* * * * * /usr/sbin/service reniced start
```
