syntax on

set noerrorbells
set sw=4
set expandtab
set smartindent
set number
set relativenumber
set numberwidth=1
set nowrap
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=UTF-8
set cursorline
set termguicolors
set tabstop=4 softtabstop=4
set showmatch
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set splitright
set splitbelow
set showcmd
set noshowmode

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/plugged')

"Themes
Plug 'ayu-theme/ayu-vim'

"Visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Functionality
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/vCoolor.vim'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'eslint/eslint'

"Code completion
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let mapleader=" "

"Theme
let ayucolor="dark"
colorscheme ayu

nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Comment code as in vscode
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Leader>s <Plug>(easymotion-s2)
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <S-l> :vertical resize +5<CR>
nnoremap <silent> <S-h> :vertical resize -5<CR>
nnoremap <silent> <S-k> :resize +5<CR>
nnoremap <silent> <S-j> :resize -5<CR>
nnoremap <leader>t :split<CR>:ter<CR>:resize 10<CR>
nnoremap <leader>ru :resize 30<CR>
nnoremap <leader>rd :resize 10<CR>
nnoremap <Leader>f :Prettier<CR>

inoremap <C-h> <C-W>
inoremap kj <ESC>
tnoremap kj <C-\><C-n>
"Configs

"Signify
let g:signify_sign_add="+"
let g:signify_sign_delete="_"
let g:signify_sign_delete_first_line="-"
let g:signify_sign_change="~"
let g:signify_sign_show_count=0
let g:signify_sign_show_text=1

"VCoolor
let g:vcoolor_lowercase = 1

"NERDTree
let NERDTreeQuitOnOpen=0
let g:NERDTreeIgnore = ['\.git$']
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'A',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'U',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let NERDTreeShowHidden=1

"Closetag
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'

"COC

"You have to remap <cr> to make it confirms completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-git', 'coc-css', 'coc-cssmodules', 'coc-emmet', 'coc-html', 'coc-html-css-support', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-stylelintplus', 'coc-pairs']

command! -nargs=0 Prettier :CocCommand prettier.formatFile
