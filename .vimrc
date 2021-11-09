call plug#begin('~/.vim/plugged')
   " Make sure you use single quotes

   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
   Plug 'junegunn/vim-easy-align'

   " Any valid git URL is allowed
   Plug 'https://github.com/junegunn/vim-github-dashboard.git'

   " On-demand loading
   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

   " Plugin outside ~/.vim/plugged with post-update hook
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

   Plug 'projekt0n/github-nvim-theme'

   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

   Plug 'philrunninger/nerdtree-visual-selection'

   " Use release branch (recommend)
   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   Plug 'tomasr/molokai'

   Plug 'vim-ctrlspace/vim-ctrlspace'

   Plug 'jeffkreeftmeijer/vim-numbertoggle'

   Plug 'github/copilot.vim'

   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   Plug 'tpope/vim-commentary'

   Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }

   Plug 'ryanoasis/vim-devicons'

   " Initialize plugin system
call plug#end()

let mapleader = ","

colorscheme github_*

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-p> :FZF<CR>

" Vertical resize vim
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

set autoread

let g:airline_theme='molokai'

let $HOME=$USERPROFILE
autocmd vimenter * NERDTree $USERPROFILE
" autocmd vimenter GuiFont "JetbrainsMono Nerd Font M"

let g:Guifont="TerminessTTF Nerd Font Mono:18"

autocmd! bufwritepost init.vim source %

set shell=cmd

set background=dark
colorscheme molokai

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2

set nocompatible
set hidden
set encoding=utf-8

let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" coc.nvim configuration
" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-j> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
endif


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Prettier
nmap <leader>p :PrettierAsync<CR>

" Vim tab
nmap <leader>tn :tabnext<CR>
nmap <leader>tN :tabnew<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>tT :tabfirst<CR>

" Show line number
set number
Copilot
