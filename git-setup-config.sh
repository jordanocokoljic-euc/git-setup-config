#!/usr/bin/env sh

set -eu

git_name="$(id -F)"
git_email="$(id -un)@eucalyptus.vc"

echo "No input will fallback to the value in brackets" 
read -p "Please enter your name [$git_name]: " set_name
read -p "Please enter your email [$git_email]: " set_email

if [ -n "$set_name" ]; then git_name="$set_name"; fi
if [ -n "$set_email" ]; then git_email="$set_email"; fi

git config --global user.name "$git_name"
git config --global user.email "$git_email"
