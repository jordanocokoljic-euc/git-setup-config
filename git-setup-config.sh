#!/usr/bin/env sh

set -eu

prompt() {
  printf '%s ' "$1"
  if [ -r /dev/tty ]; then
    IFS= read -r "$2" < /dev/tty
  else
    IFS= read -r "$2" || true
  fi
}

git_name="$(id -F)"
git_email="$(id -un)@eucalyptus.vc"

echo "Press enter to use to the value in brackets" 
prompt "Please enter your name [$git_name]:" set_name 
prompt "Please enter your email [$git_email]:" set_email

if [ -n "$set_name" ]; then git_name="$set_name"; fi
if [ -n "$set_email" ]; then git_email="$set_email"; fi

git config --global user.name "$git_name"
git config --global user.email "$git_email"
