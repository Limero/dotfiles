" Settings from Arch Linux global vimrc
set backspace=indent,eol,start  " more powerful backspacing
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" User settings

" Turn backup off
set nowritebackup
set noswapfile

" Show @@@ in the last line if it is truncated.
"set display=truncate

" Use Ctrl+d to switch between Vim and bash
"noremap <C-d> :sh<cr>

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
set encoding=utf-8

" Disable intro message
set shortmess+=I

" Use system clipboard
set clipboard=unnamedplus

" Make tab bar, statusline and vertical split screen divider dark
:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLine cterm=none ctermbg=0
":hi StatusLine ctermbg=White ctermfg=0
":hi StatusLineNC ctermbg=White ctermfg=0
:hi VertSplit ctermbg=0 ctermfg=0

set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.class,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore cases in Wild menu
set wildignorecase

" Disable continuation of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 1 tab == 2 spaces
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

" Close curly brackets
ino {<CR> {<CR>}<ESC>O

set list
set listchars=tab:>-,nbsp:%,trail:·

set scrolloff=15 " Show rows above/below cursor

" Remove octal numbers for Ctrl-A and Ctrl-X, it's confusing
set nrformats-=octal

" Ignore case when searching, except when search string has capitalisation
set ignorecase smartcase

" Jump to search results while typing
set incsearch

" Prevent std:: from jumping to beginning of line
set cinoptions+=L0

" Open new splits on opposite side
set splitbelow
set splitright

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" noesckeys will disable cursor/func keys in insert mode,
" so set delay instead
set ttimeoutlen=0
