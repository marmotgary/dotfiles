syntax on
set number
set relativenumber

set path+=**
set wildmenu
set wildignore+=**/node_modules/**

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
let mapleader = " "
set nowrap

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" Initialize plugin system
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>


nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
"nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR
"nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

"NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
