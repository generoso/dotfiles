# Remapping modifier keys

Left Shift Key => Control
Caps Lock  Key => Shift

# keycodes

You can find them with:

```
xev | grep keycode
```

- ctrl: 37, Control_L
- shift: 50, Shift_L
- capslock: 66, Caps_Lock

# Remapping with input remapper (UI)

Remapping works well, but for Shift there is a small delay, so usage is annoying.

# Remapping with xmodmap 

https://wiki.archlinux.org/title/Xmodmap#Keymap_table

Original modifiers mapping:

```
$ xmodmap -pm
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock        Caps_Lock (0x42)
control     Control_L (0x25),  Control_R (0x69)
mod1        Alt_L (0x40),  Meta_L (0xcd)
mod2        Num_Lock (0x4d)
mod3      
mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)
```

~/.Xmodmap used to remap:

```
! First clear ALL the modifiers involved in the remapping
clear shift
clear lock
clear control

! map shift key (50) to Control_L 
keycode 50 = Control_L NoSymbol NoSymbol
! map caps lock key (66) to Control_L 
keycode 66 = Shift_L NoSymbol NoSymbol

! Add back the modifiers
add shift = Caps_Lock Shift_R
add control = Shift_L Control_L Control_R
```

New modifiers mapping:

```
xmodmap -pm
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_R (0x3e)
lock      
control     Control_L (0x25),  Control_L (0x32),  Shift_L (0x42),  Control_R (0x69)
mod1        Alt_L (0x40),  Meta_L (0xcd)
mod2        Num_Lock (0x4d)
mod3      
mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)
```

Notes:
- 0x32 before was a shift, now it's a control