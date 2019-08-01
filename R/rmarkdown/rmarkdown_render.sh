#!/bin/bash

show_help() {
  cat << EOF

  Usage: ${0##*/} [-v] [-h] file.rmd

  Shorthand to compile an R markdown file.

  Requires:
  - 'Rscript' on the PATH
  - 'rmarkdown' R package package installed.
  - Other R packages relevant to the notebook installed.

  -v                          Verbose.
  -h                          Print this help.
EOF
}

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
verbose=0

while getopts "h?vf:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  verbose=1
        ;;
    esac
done

shift $((OPTIND-1))

# echo "${1:-}" = "--" # what is this for?

[ "${1:-}" = "--" ] && shift # see https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

if [ "$#" -lt 1 ]; then
    echo "Illegal number of parameters"
fi
rmdfile=$1
shift

# echo "verbose=$verbose, rmdfile='$rmdfile', Leftovers: $@" # DEBUG

cmd="Rscript -e \"rmarkdown::render('$rmdfile')\""

if [ verbose ]; then
    echo $cmd
fi

eval $cmd
