if executable('fzf')
  nnoremap \ :call fzf#run({'source': 'git ls-files --exclude-standard --cached --others', 'sink': 'tabedit', 'down': '40%'})<CR>
else
  nnoremap \ :tabfind *
endif

" Native VIM below
" ---

set ruler " show the cursor position all the time

" Turn backup off
set nowritebackup
set noswapfile

" Use Ctrl+d to switch between Vim and bash
"noremap <C-d> :sh<cr>

" Show possible completions with preview
set completeopt=menuone,preview

" netrw (open with :E or :Ve)
" https://shapeshed.com/vim-netrw/
"let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

set path=$PWD/** " http://vim.wikia.com/wiki/Project_browsing_using_find

" possible to autocorrect with things in current file?
" :help command-completion
command -nargs=? Grep vimgrep /<args>/j **/* | copen 25
nnoremap \| :Grep 

" https://stackoverflow.com/questions/33051496/custom-script-for-git-blame-from-vim
" todo: set filetype dynamically
command! -nargs=* Blame call s:GitBlame()
function! s:GitBlame()
   let cmdline = "git blame -w " . bufname("%")
   let nline = line(".") + 1
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap cursorline
   execute "$read !" . cmdline
   setlocal nomodifiable
   execute "normal " . nline . "gg"
   execute "set filetype=php"
endfunction

let mapleader = ","

" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
xnoremap p "_dP

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

" Ignore cAsEs in Wild menu
set wildignorecase
" Ignore compiled files
set wildignore=*.o,*~,*.class,*.pyc
" Random filetypes
set wildignore+=*.png,*.jpg,*.svg,*.pdf,*.graphml,*.eot,*.woff,*.log,*.sqlite
" Directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/vendor/*,*/cache/*,*/bin/*,*/.DS_Store

" Close curly brackets
ino {<CR> {<CR>}<ESC>O

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

set list
set listchars=tab:>-,nbsp:%,trail:·

set scrolloff=15 " Show rows above/below cursor

" Remove octal numbers for Ctrl-A and Ctrl-X, it's confusing
set nrformats-=octal

" Ignore case when searching, except when search string has capitalisation
set ignorecase smartcase

" Jump to search results while typing
set incsearch

" Open new splits on opposite side
set splitbelow splitright

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" noesckeys will disable cursor/func keys in insert mode,
" so set delay instead
set ttimeoutlen=0

" 1 tab == 2 spaces
set smarttab
set expandtab
set shiftwidth=2 tabstop=2

" 1 tab == 4 spaces in specific languages
autocmd Filetype php setlocal shiftwidth=4 tabstop=4

autocmd FileType php set indentkeys-==*/ " Prevent */ in multiline comment to be indented

" Disable continuation of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Prevent std:: from jumping to beginning of line
autocmd FileType cpp set cinoptions+=L0

autocmd FileType help wincmd T " Open help in new tab
