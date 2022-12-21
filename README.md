# Neovim setup

## How to install neovim in Ubuntu 20.04 LTS (Using currently).

execute the next commands in the terminal:
* `sudo apt update && sudo apt upgrade`
* `sudo apt install neovim`

## How to apply the configuration to ***Neovim***

Create `~/.config/nvim/lua/user/init.lua` and paste the content of [`user/init.lua`](user/init.lua).

## Extra tools for correct functioning

* Install [ripgrep](https://github.com/BurntSushi/ripgrep) to gain the ability of fuzzy finding words in files.
* Install a clipboard tool for connecting nvim clipboard with the system clipboard: 
  ```
  sudo apt-get update
  sudo apt-get install xclip
  ```

### And that's it!.
