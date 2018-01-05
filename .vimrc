" Settings from Arch Linux global vimrc
set backspace=indent,eol,start  " more powerful backspacing
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" User settings

" Turn backup off
set nowritebackup
set noswapfile

" Show @@@ in the last line if it is truncated.
"set display=truncate

" Move to the previous/next line after reaching first/last character in the line
"set whichwrap=b,s,<,>,[,]

" Use Ctrl+d to switch between Vim and bash
"noremap <C-d> :sh<cr>

" netrw (open with :E)
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Show possible completions with preview
set completeopt=menuone,preview

" --- Confirmed needed things below
filetype plugin indent on
set autoindent
set number relativenumber
syntax enable
set belloff=all
set mouse=a
set showcmd
colorscheme ron

" Make tab bar, statusline and vertical split screen divider dark
:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLine cterm=none ctermbg=0
":hi StatusLine ctermbg=White ctermfg=0
":hi StatusLineNC ctermbg=White ctermfg=0
:hi VertSplit ctermbg=0 ctermfg=0

set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore cases in Wild menu
set wildignorecase

" Disable continuation of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2

" Auto insert closing quotes etc.
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
"ino {;<CR> {<CR>};<ESC>O

"set list
"set listchars=tab:>-,nbsp:·,trail:·

" Remove octal numbers for Ctrl-A and Ctrl-X, it's confusing
set nrformats-=octal

" Ignore case when searching, except when search string has capitalisation
set ignorecase smartcase

" Jump to search results while typing
set incsearch
