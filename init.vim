syntax on

set noerrorbells
set sw=4
set nohlsearch
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
set splitright
set splitbelow
set showcmd
set noshowmode
set hidden
set colorcolumn=120

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/plugged')

let g:ackprg = 'ag --nogroup --nocolor --column'

"Themes
Plug 'ayu-theme/ayu-vim'

"Visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bagrat/vim-buffet'
Plug 'styled-components/vim-styled-components'

"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Functionality
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync' " Follows open file in nerdtree
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/vCoolor.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'

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
nnoremap <leader>qw :q<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <S-l> :vertical resize +5<CR>
nnoremap <silent> <S-h> :vertical resize -5<CR>
nnoremap <silent> <S-k> :resize +5<CR>
nnoremap <silent> <S-j> :resize -5<CR>
nnoremap <leader>t :split<CR>:ter<CR>:resize 10<CR>
nnoremap <leader>f :Prettier<CR>
nnoremap <leader>sf :Rg<CR>
nnoremap <C-p> :Files<CR>

inoremap <C-h> <C-W>
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

" M is ALT key
noremap <M-l> :bn<CR>
noremap <M-h> :bp<CR>
noremap <leader>q :Bw<CR>

nnoremap <leader>vs :vsp<CR>
nnoremap <M-left> <C-w>H 
nnoremap <M-right> <C-w>L 

"Config

" Fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name .next -o -name build \) -prune -o -print'

" Airline
let g:airline_theme = "ayu_mirage"

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
let g:nerdtree_sync_cursorline = 1
let g:NERDSpaceDelims = 1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Vim Buffet
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_new_buffer_name = "+"
let g:buffet_modified_icon = ' *'

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#555555 guifg=#f2f2f2
  hi! BuffetActiveBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#333333 guifg=#f2f2f2
  hi! BuffetBuffer ctermbg=5 ctermfg=8 guibg=#252525 guifg=#ffffff 
  hi! BuffetTab cterm=NONE ctermbg=5 ctermfg=5 guibg=#333333 guifg=#f2f2f2
endfunction

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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use Z to show documentation in preview window.
nnoremap <silent> Z :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('Z', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

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

let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-git', 'coc-css', 'coc-cssmodules', 'coc-emmet', 'coc-html', 'coc-html-css-support', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-stylelintplus', 'coc-pairs', 'coc-styled-components']

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
