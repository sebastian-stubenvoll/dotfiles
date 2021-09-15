#!/usr/bin/env bash
#Usage: mktex FILENAME
#Opens a TeX file in nvim on space 5 and creates an empty PDF that is then opened in Skim
#When calling this script automatically it makes sense to employ another script that
#executes this one from a notes directory and provides date and time for filename
#requires iterm2 to open with a default configuration of no windows

CFILE=$(ls *.tex | choose)

if [[ $CFILE ]]; then
    ~/.config/scripts/mktex.sh "${CFILE: : -4}"
fi
