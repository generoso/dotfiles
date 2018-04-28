# README

Create a link to the reniced configuration file:

```
sudo ln -fs `readlink -e ~/.dotfiles/modules/reniced/reniced.conf`
```

Set up the crontab:

```
sudo crontab -e
```

then add the line

```
* * * * * /usr/sbin/service reniced start
```
