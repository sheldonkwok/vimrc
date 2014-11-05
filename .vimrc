set t_Co=256

set background=dark
colorscheme peachpuff

call pathogen#infect()
au VimEnter * RainbowParenthesesToggle

syntax enable
filetype on
filetype plugin indent on

vnoremap <leader>p "_dP
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
nnoremap ; :
nnoremap : ;

set ai
" set number

set expandtab
set tabstop=2
retab
set shiftwidth=2
set autoindent
set smarttab
au FileType python setl sw=4 sts=4 et

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap
set incsearch

set ttyfast
set lazyredraw

set backspace=indent,eol,start

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

vnoremap <silent> <expr> p <sid>Repl()

" tabs
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

" set rtp+=/Users/sheldon/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" Always show statusline
set laststatus=2
"
" Autofix whitespace
:autocmd BufWritePost * :FixWhitespace

highlight SignColumn ctermbg=none

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tabular
noremap ta :Tab /=<CR>
noremap ts :Tab/:\zs /l0<CR>

" Ctrl P

