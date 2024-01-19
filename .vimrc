syntax on
let mapleader = " "
set number
set relativenumber

set path+=**
set wildmenu
set wildignore+=**/node_modules/**

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set incsearch
set hlsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nowrap
set hidden
set scrolloff=8
set signcolumn=yes
set cursorline
set smartcase
set ignorecase
set updatetime=50

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-utils/vim-man'
"Plug 'git@github.com:kien/ctrlp.vim.git'
"Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'editorconfig/editorconfig-vim'
"Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-react-snippets'
" Initialize plugin system
call plug#end()

colorscheme gruvbox
set background=dark

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:user_emmet_leader_key='<C-Z>'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:ackprg = 'ag --nogroup --nocolor --column'
let $FZF_DEFAULT_OPTS='--reverse'
"let g:prettier#autoformat = 0
"let g:prettier#autoformat_require_pragma = 1
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :-tabnext<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"inoremap (; (<CR>);<C-c>O
"inoremap (, (<CR>),<C-c>O
"inoremap {; {<CR>};<C-c>O
"inoremap {, {<CR>},<C-c>O
"inoremap [; [<CR>];<C-c>O
"inoremap [, [<CR>],<C-c>O
"inoremap ' ''<left>
"inoremap " ""<left>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
"nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR
"nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

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

nnoremap <C-p> :GFiles --exclude-standard<CR>

"NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"let g:UltiSnipsExpandTrigger="c-s"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Remaps for node REPL
" Run current file
"nnoremap <Leader>rr :!node %<CR>
"" Run current line
"nnoremap <Leader>rl :exec '!node' '-e'  shellescape(getline('.'))<CR>
"" Run current line, print it below it, and comment it
"nnoremap <Leader>rp :exec ':r' '!node' '-e'  shellescape(getline('.'))<CR> :Commentary<CR>

" Copy current window's path
":nmap cp :let @" = expand("%")<cr>
