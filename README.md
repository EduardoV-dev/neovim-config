# Neovim setup

## How to install neovim in Ubuntu 20.04 LTS (Using currently).

execute the next commands in the terminal:
* `sudo apt update && sudo apt upgrade`
* `sudo apt install neovim`

## How to apply the configuration to ***Neovim***

First of all, **Vim Plug** has to be installed already, for getting started with **Vim Plug**, go to the [Vim Plug](https://github.com/junegunn/vim-plug) repo for more information in order to set it up. 

After installing **Vim Plug**,  ***Neovim*** it's ready for plugins installations.
* Go to the next location: `~/.config/nvim/` and paste the `init.vim` file located in this repo [neovim-config](https://github.com/EduardoV-dev/neovim-config).
* Open `init.vim` by typing in the terminal `nvim ~/.config/nvim/init.vim`.
* Open the `Vim's Command Mode` by typing `:` while in `Normal Mode`, then type `source %`.
* For installing the plugins, execute the next command while in `Vim's Command Mode`: `PlugInstall`.
* Install a Nerd Font, so that icons for NerdTreePlugin can be displayed properly (set terminal with the same Nerd Font for aesthetic purposes): Current nerd font: SpaceMono Nerd Font

## Prettier global config

When setting up the neovim environment, prettier won't have rules and won't format on save, do the next for solving this issue: 

* Enter vim and command mode, type `:CocConfig` and hit enter to enter the config file for coc.
* Copy the content of `prettier.json` file in this repo and paste it into the `coc-settings.json` file.

### And that's it!.
