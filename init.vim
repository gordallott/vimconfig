augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

call plug#begin('~/.vim/plugged')

" Plugins go here
Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go'
Plug 'chriskempson/base16-vim'        
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'uarun/vim-protobuf'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/Smart-Tabs'
Plug 'garyburd/go-explorer'
"Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'mklabs/split-term.vim'


" Completion 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()

set mouse-=a

let g:deoplete#enable_at_startup = 1

" air/Powerline stuff
"let g:airline_powerline_fonts = 1

autocmd VimEnter * AirlineTheme base16
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline_left_sep = '▙'
let g:airline_right_sep = '▜'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

" Color themes
syntax enable
set background=dark
"let base16colorspace=256
"colorscheme base16-railscasts

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" vim-go 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1

let g:go_fmt_command = "goimports"

set wildmode=longest,list,full
filetype plugin on
filetype indent on

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*
set wildignore+=node_modules\*",dash/static/* 
set wildignore+=vendor\*
set wildignore+=pkg\*
set wildignore+=test-profiles\*
set wildignore+=testbin\*
set wildignore+=bin\*
set wildignore+=local\*

set ruler
set cmdheight=2
set hid

set whichwrap+=<,>h,l

set lazyredraw

set ignorecase
set smartcase
set magic

set showmatch
set mat=2

set foldcolumn=1

set encoding=utf8
set ffs=unix,dos,mac

set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

set laststatus=2

"syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'gofmt', 'goconst', 'gometalinter']
"let g:syntastic_go_govet_args = "-printf"
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_exe = './gometalinter.sh'
"let g:syntastic_go_gometalinter_args = '--deadline=15s --disable-all --enable="staticcheck"'

" paste mode key comb
" not needed for neovim
" nnoremap <F2> :set invpaste paste?<CR>
" set pastetoggle=<F2>
" set showmode


nnoremap <F7> :set invspell<CR>
set spelllang=en_gb

" reuses buffers with go-def
let g:go_def_reuse_buffer = 1

" vim-go keymaps
let mapleader=","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

"map <silent> <PageUp> 1000<C-U>
"map <silent> <PageDown> 1000<C-D>
"imap <silent> <PageUp> <C-O>1000<C-U>
"imap <silent> <PageDown> <C-O>1000<C-D>

autocmd FileType go nmap <F5> :GoBuild<CR>
autocmd FileType go nmap <F6> :GoTest<CR>
autocmd FileType go nmap <S-F6> :GoTest -c<CR>
autocmd FileType go nmap <C-F6> :GoTest -c<CR>
autocmd FileType go nmap <F8> :GoCoverageToggle<CR>
autocmd FileType go nmap <F2> <Plug>(go-def-split)
autocmd FileType go nmap <F3> :GoAlternate!<CR>
autocmd FileType go nmap <F4> <Plug>(go-callers)


" vim md 
let g:vim_markdown_folding_disabled = 1

" ctrlp for watchly
let g:ctrlp_root_markers = ['src']

" Disable cursor keys
" I know you are frustrated gord and you are here to turn them off, but just
" power through it, do it for *us*

inoremap <UP>       <NOP>
inoremap <DOWN>     <NOP>
inoremap <LEFT>     <NOP>
inoremap <RIGHT>    <NOP>
noremap <UP>        <NOP>
noremap <DOWN>      <NOP>
noremap <LEFT>      <NOP>
noremap <RIGHT>     <NOP>

"autocmd vimenter * NERDTree
