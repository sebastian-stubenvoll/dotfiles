# Regarding the setup script #

## ❗Disclamer❗ ##

This script is currently **untested** and a work in progress. Proceed at your
own risk.

## About ##

This repository holds all my personal configuration files. Though it is a work
in progress, I am hoping to eventually automate the setup process as much as possible.
Hence I am gradually building a setup script that can be run to install all
necessary software.

## Installation process ##

The script will attempt to back up any existing configuration files into a
backup folder named `DATE_TIME_dofiles_backup`. If this directory already
exists or otherwise fails to create, the script will exit. No files will be
deleted or moved.

The installation process is split into the following segments:

0. Backup
1. Install brew
2. Install brew packages
3. Install python
4. Install python packages
5. Install miscellaneous other bits
6. Copy over the files from this repository
7. Create necessary symlinks
8. Take post-installation actions

## What gets installed? ##

| package name             | installation method |
|:-------------------------|:--------------------|
| brew                     | curl + script       |
| zsh                      | brew                |
| python                   | brew                |
| node                     | brew                |
| tmux                     | brew                |
| neovim                   | brew                |
| skhd                     | brew                |
| yabai                    | brew                |
| neofetch                 | brew                |
| gotop                    | brew                |
| imgcat                   | brew                |
| various fonts            | brew                |
| zathura                  | brew                |
| pynvim                   | python / pip        |
| oh-my-zsh                | curl + script       |
| fast-syntax-highlighting | git                 |
| p10k                     | git                 |

If you're wanting to run this script, feel free to open it up and comment out
the applications you don't wish to install.
