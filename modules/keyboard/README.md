# Keyboard customizations backup

## Backup

```
## Backup GNOME shortcuts (window manager)
dconf dump /org/gnome/desktop/wm/keybindings/ > gnome-keybindings-backup.conf

## Backup input source options (Ctrl/Alt swap, Compose key, etc.)
dconf dump /org/gnome/desktop/input-sources/ > gnome-inputsources-backup.conf
```

# Restore

```
dconf load /org/gnome/desktop/wm/keybindings/ < gnome-keybindings-backup.conf
dconf load /org/gnome/desktop/input-sources/ < gnome-inputsources-backup.conf
```

