# About #

This repository holds all my personal configuration files. Though it is a work
in progress, I am hoping to eventually automate the setup process as much as possible.
Hence I am gradually building a setup script that can be run to install all
necessary software.

## Features ##

This section is a work in progress.
There's a good chance this is outdated 🙃

**bu**ild **n**ew **t**hemes using the *bunt* script. This calls pywal and
updates all themes on applications that use pywal colours.

![example gif](https://github.com/sebastian-stubenvoll/dotfiles/blob/main/themes_example.gif?raw=true)

![example gif](https://github.com/sebastian-stubenvoll/dotfiles/blob/main/wal_example.gif?raw=true)

A fair amount of configuration is also dedicated to comfortable
writing/note-taking in vim. Some (not all) of the features include:

+ Compiling, forwards/backwards search, table of contents etc. through Vimtex
+ Spell- and grammarchecking within neovim (and correcting mistakes on the fly)
+ Only compile once with pdfTeX
+ Snippets for all sorts of things
+ More snippets, some of which are context aware
  + For example typing `pi` will only correct to `\pi` inside of math
        environments
+ Compiling a texfile opens the pdf in zathura which (aside from being themed to
    wal colours) also supports automatic refreshes.
+ Autocompletion through coc on many things – including citation references
+ ...and a bunch of other things!

This setup intends for citation management to be done through JabRef. It is also
installed via brew.

![example_png](https://github.com/sebastian-stubenvoll/dotfiles/blob/main/tex_example.png?raw=true)
A fair amount of tex features/mappings also translate to markdown files,
specifically intended for the creation of presentations in Deckset or *slides*. This even
allows you to use your math related tex snippets in MathJax environments!

Hotkeys with skhd: This includes a fair amount of yabai mappings but also other
things such as bindings for some spotify functions. This setup also introduces a
script called `skhs` that allows you switch between different skhd
configurations on the fly. Personally, I use this to hotswap between a hotkey
layout for my desktop and my laptop keyboard respectively so the motions for the
respective keypresses remain (somewhat) consistent.
Simply run the shell command `skhs PROFILENAME` and skhs will attempt to update
your profile symlink to the targeted config in the `~/.config/skhd/profiles`
directory.
As a neat little bonus this also pushes an applescript notification.

## ❗Disclamer❗ ##

This script is currently **untested** and a work in progress. Proceed at your
own risk.

Also some features require SIP to be disabled.

## Installation process ##

The script will attempt to back up any existing configuration files into a
backup folder named `DATE_TIME_dofiles_backup`. If this directory already
exists or otherwise fails to create, the script will exit. No files will be
deleted or moved.

The installation process is split into the following segments:

0. Backup
1. Install brew
2. Install rtx
3. Install python and node using rtx
4. Install brew packages
5. Install python packages
6. Install miscellaneous other bits
7. Copy over the files from this repository
8. Create necessary symlinks
9. Take post-installation actions

## What gets installed? ##

| package name             | installation method |
|:-------------------------|:--------------------|
| brew                     | curl + script       |
| zsh                      | brew                |
| rtx                      | brew                |
| tmux                     | brew                |
| neovim                   | brew                |
| skhd                     | brew                |
| yabai                    | brew                |
| neofetch                 | brew                |
| gotop                    | brew                |
| imgcat                   | brew                |
| various fonts            | brew                |
| zathura                  | brew                |
| firefox                  | brew                |
| spotify                  | brew                |
| discord                  | brew                |
| spicetify-cli            | brew                |
| xodotool                 | brew                |
| dbus                     | brew                |
| fzf                      | brew                |
| pstree                   | brew                |
| übersicht                | brew                |
| ctags                    | brew                |
| ripgrep                  | brew                |
| bat                      | brew                |
| exa                      | brew                |
| nushell                  | brew                |
| karabiner                | brew                |
| hammerspoon              | brew                |
| python (latest)          | rtx                 |
| node (latest)            | rtx                 |
| rust (latest)            | rtx                 |
| pynvim                   | python / pip        |
| neovim remote            | python / pip        |
| rope                     | python / pip        |
| spotify-cli              | python / pip        |
| inkscape-figures         | python / pip        |
| unidecode                | python / pip        |
| clipboard                | python / pip        |
| oh-my-zsh                | curl + script       |
| rust                     | curl + script       |
| cargo-update             | cargo               |
| starship                 | cargo               |
| fast-syntax-highlighting | git                 |
| betterdiscord            | git                 |
| pywal-discord            | git                 |
| simple-bar               | git                 |
| neovim (node)            | node                |

If you're wanting to run this script, feel free to open it up and comment out
the applications you don't wish to install.
