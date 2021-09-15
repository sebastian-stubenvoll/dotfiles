#!/bin/bash

arguments="$*"
[ "${arguments:0:1}" == "/" ] || filename_prefix="$PWD"

zathura $filename_prefix/$*
