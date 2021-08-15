syntax on

set noerrorbells
set sw=2
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
set encoding=utf-8
set cursorline
set termguicolors
set tabstop=2 softtabstop=2
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

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Leader>s <Plug>(easymotion-s2)
nnoremap <Leader>e :NERDTreeFind<CR>
vnoremap ++ <Plug>NERDCommenterToggle
nnoremap ++ <Plug>NERDCommenterToggle
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize +5<CR>
nnoremap <leader>t :split<CR>:ter<CR>:resize 10<CR>
nnoremap <leader>ru :resize 30<CR>
nnoremap <leader>rd :resize 10<CR>
vmap ++ <Plug>NERDCommenterToggle
nnoremap <Leader>f :Prettier<CR>

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
let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=['node_modules', '.git', '.next']
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<s-TAB>'
let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-git', 'coc-css', 'coc-cssmodules', 'coc-emmet', 'coc-html', 'coc-html-css-support', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-stylelintplus', 'coc-pairs']

command! -nargs=0 Prettier :CocCommand prettier.formatFile
