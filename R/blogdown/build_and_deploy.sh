#!/bin/bash

original_path=$(pwd)

source_path="/Users/kevin/git/kevinrue.github.io-academic"
site_path="/Users/kevin/git/kevinrue.github.io"

echo_eval () {
  echo "> $1"
  eval "$1"
}

echo "Building $source_path"

cmd="cd $source_path"
echo_eval "$cmd"

cmd='Rscript -e "blogdown::build_site()"'
echo_eval "$cmd"

cmd="cp -r $source_path/public/* $site_path/"
echo_eval "$cmd"

cmd="cd $site_path"
echo_eval "$cmd"

cmd="git add ."
echo_eval "$cmd"

cmd="git commit -m 'Update'"
echo_eval "$cmd"

cmd="git push origin master"
echo_eval "$cmd"

cd "$original_path"
