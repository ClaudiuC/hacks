#!/bin/bash

# Terminal color profiles
GREEN_NO_BG=$(tput setaf 2)
RED_NO_BG=$(tput setaf 1)

GREEN=$(tput setaf 7)$(tput setab 2)
RED=$(tput setaf 7)$(tput setab 1)
RESET=$(tput sgr0)

# This is where Xcode reads custom themes from
THEMES_PATH="/Users/$(whoami)/Library/Developer/Xcode/UserData/FontAndColorThemes/"

# Create directory, if necessary
if [ ! -d "$THEMES_PATH" ]; then
  mkdir "$THEMES_PATH"
fi

# Get all themes in this directory
declare -a themes=()

shopt -s nullglob
for f in *; do
  if [ ! -f "$THEMES_PATH$f" ]; then
    if [ ! "$f" = "install.sh" ]; then
      echo "$RED_NO_BG Not Found $RESET $f"
      themes=("${themes[@]}" "$f")
    fi
  else
    echo "$GREEN_NO_BG Found $RESET $f"
  fi
done

echo

# Copy themes that aren't already installed
for file in "${themes[@]}" 
do
  cp "$file" "$THEMES_PATH$file"
  echo "$GREEN Installed $RESET $file"
done

# Go home
echo "$GREEN_NO_BG Done! $RESET"
