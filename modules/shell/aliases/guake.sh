GUAKE_CONFIG_DUMP="$DOTFILES/modules/guake/guake.conf"

alias qguake-config-show="dconf dump /apps/guake/"

alias qguake-config-dump="dconf dump /apps/guake/ > $GUAKE_CONFIG_DUMP"

alias qguake-config-load="dconf load /apps/guake/ < $GUAKE_CONFIG_DUMP"
