#!/bin/sh

# Credit: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize internal script variables:
pkg_path="."
verbose=0

show_help(){
    echo "
A description of the program

Usage:
    program -ohv FROM TO

Options:
    FROM  Regex to replace.

    TO    Replacement.

    -p    Package path [default: "."].

    -v    Verbose.

    -h    Help.
"
}

while getopts "hvp:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)
        verbose=1
        ;;
    p )
      pkg_path=$OPTARG
      ;;
    esac
done

shift $((OPTIND -1))

if [ "$#" -lt 2 ]; then
    echo "Illegal number of parameters"
    echo "Use '$(basename $0) -h' for help"
    exit 1
fi

replace_from=$1
replace_to=$2

if [ ${verbose} == 1 ]
then
    echo "[DEBUG]"
    echo "- pkg_path: $pkg_path"
    echo "- replace_from: $replace_from"
    echo "- replace_to: $replace_to"
fi

cmd="sed -i '' -e 's/${replace_from}/${replace_to}/g' ${pkg_path}/R/*"
echo "$cmd"
eval "$cmd"

cmd="sed -i '' -e 's/${replace_from}/${replace_to}/g' ${pkg_path}/vignettes/*"
echo "$cmd"
eval "$cmd"

cmd="sed -i '' -e 's/${replace_from}/${replace_to}/g' ${pkg_path}/tests/testthat/*"
echo "$cmd"
eval "$cmd"