# 'typical dirs' are considered $PWD and $TOPICS
export _HISTORY_MAX_LINES_LIGHT=80000
export _FILE_CONTENT_MAX_FZF=300

export _FZF_HIGHLIGHT="--color='hl:#44CC44,fg:#D9D9D9,header:#719872,fg+:#D9D9D9' --color='pointer:#E12672,marker:#E17899,header:#98BEDE,hl+:#22FF22'"
alias _fzf="fzf -m $_FZF_HIGHLIGHT --border=sharp"
find_args=""
egrep_filter=".*\.md$|.*\.sh"

function _typical_dirs() {
  local pref="$1"
  local output="$pref $TOPICS"
  if [ "$(pwd)" != "$HOME" ] 
  then
    output="$pref $(pwd) $output"
  else
    output="$output"
  fi
  echo "$output"
}

function qfzf_cd_with() {
  cd "$(find $pwd -maxdepth 3 -type d $find_args 2>/dev/null | _fzf --header="CD TO..." --preview="tree -L 2 {}" --bind="left:toggle-preview")"
}

# Search on typical dirs by filename (not by content) and stdout vim command on choice
function qfzf_code_with() {
  echo code "$(find $(_typical_dirs) -type f $find_args 2>/dev/null | egrep $egrep_filter | sort -r -u | _fzf --header="EDIT..." --preview="head -100 {}" --bind="left:toggle-preview")"
}

function qfzf_history_with() {
  # echo "Useful expression: 'fullword fuzzy 'fullword2" >&2
  cat "$CUSTOM_HISTORY_FILE" | _fzf --header="HISTORY..." --tac --no-sort --tiebreak=end,length | sed -E 's/###.*//g'
}

function qfzf_history_light_with() {
  tail -$_HISTORY_MAX_LINES_LIGHT $CUSTOM_HISTORY_FILE | awk -F' ### ' '{print $1}' | tac | awk '!($0 in S) {print; S[$0]}' | tac | _fzf --header="HISTORY($_HISTORY_MAX_LINES_LIGHT)..." --tac --no-sort --tiebreak=end,length
}

function qfzf_file_path_egrepargs_X_by_filenamecontent() {
  local from="$1"
  local find_extra_args="$2"
  local header="$3"
  f="$(find $from -type f $find_args $find_extra_args -printf "%T@:%p\n" | egrep $egrep_filter | sort -n -r -u | awk -F: '{print $2}' | while IFS= read -r f ; do echo "$f: $(head -$_FILE_CONTENT_MAX_FZF "$f" | tr -d '\n' | tr -d '\0')"; done | _fzf --header="$header" --tiebreak=index | awk -F: '{print $1}')"
  if [ "$f" != "" ]
  then
    echo "code $f"
  else
    echo ""
  fi
}

# Edit an alias that matches a given pattern
function qfzf_alias() {
  qfzf_file_path_egrepargs_X_by_filenamecontent "$DOTFILES/modules/shell/aliases/" "" "OPEN ALIAS..."
}

# Search on typical dirs and copy selected line into the clipboard
function qfzf_typical_line_on_clipboard() {
  local header="$1"
  qfzf_content_egrepargs_X_by_filenamecontent "$(_typical_dirs -r)" "$header" | tr -d '\n' | xclip -selection clipboard
  echo "Pasted into clipboard: '$(xclip -selection clipboard -o)'"
}

# Search on typical dirs by content (and by filename) and stdout vim command on choice
function qfzf_typical_filename_stdout() {
  local header="$1"
  qfzf_file_path_egrepargs_X_by_filenamecontent "$(_typical_dirs "")" "-maxdepth 1" "$header"
}

