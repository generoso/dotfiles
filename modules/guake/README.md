# guake config

## dump

dconf dump /apps/guake/ > guake.conf

## load

dconf load /apps/guake/ < guake.conf

# guake shortcut

Issue: guake toggle (F12) does not work anymore.
Workaround: 
- Open the keyboard shortcuts for your environment (for Gnome, that's Settings::Keyboard::Shortcuts)
- Add a new shortcut named "Toggle Guake", with the command "guake -t", and set the hotkey for it

