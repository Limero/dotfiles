if executable('fzf')
  if has('nvim')
      nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "edit", "options": "--reverse --preview 'cat {}'"})<CR><CR>
    autocmd! FileType fzf
    autocmd  FileType fzf set norelativenumber noshowmode noruler
      \| autocmd BufLeave <buffer> set showmode ruler
  else
      nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "tabedit", "down": "100%", "options": "--reverse --preview 'cat {} \|\| head -100 {}'"})<CR>
  endif
else
 nnoremap <C-P> :tabfind *
endif

"nnoremap <C-P> :FZF<CR>

nnoremap <C-B> :Buffers<CR>

set updatetime=300 " Update ALEHover faster

" Native vim below
set ruler " show the cursor position all the time

" Turn backup off
set nowritebackup
set noswapfile

" Show possible completions with preview
set completeopt=menuone,preview

" netrw (open with :E)
" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

set path=$PWD/** " http://vim.wikia.com/wiki/Project_browsing_using_find

command -nargs=? G vimgrep /<args>/j **/* | copen 25
"nnoremap \| :G

" https://stackoverflow.com/questions/33051496/custom-script-for-git-blame-from-vim
" todo: set filetype dynamically
command! -nargs=* GB call s:GitBlame()
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

" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
xnoremap p "_dP

" Define commands for common typos
command WQ wq
command Wq wq
command W w
command Q q
command Qa qa

filetype plugin indent on
set autoindent
set number relativenumber
syntax enable
set belloff=all
set mouse=a
set showcmd
colorscheme ron
set encoding=utf-8
set title
set nohlsearch

" Switch buffers without saving
set hidden

" Disable intro message
set shortmess+=I

" Use system clipboard
set clipboard=unnamedplus

":hi TabLineFill term=bold cterm=bold ctermbg=0
":hi TabLine cterm=none ctermbg=0
:hi Pmenu ctermbg=gray guibg=gray

set wildmenu

" Ignore cAsEs in Wild menu
set wildignorecase
" Ignore compiled files
set wildignore=*.o,*~,*.class,*.pyc
" Random filetypes
set wildignore+=*.png,*.jpg,*.svg,*.pdf,*.graphml,*.eot,*.woff,*.log,*.sqlite,*.ttf
" Random files
set wildignore+=CHANGELOG.md,/*service,go.sum
" Directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/vendor/*,*/cache/*,*/bin/*,*/.DS_Store,*/gen/*

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

inoremap {<CR> {<CR>}<ESC>O

set list
set listchars=tab:>-,nbsp:%,trail:·

set nrformats-=octal " Remove octal numbers for Ctrl-A and Ctrl-X, it's confusing

set ignorecase smartcase " Ignore case when searching, except when search string has capitalisation
set incsearch " Jump to search results while typing

set scrolloff=999 " Center cursor vertically

set splitbelow splitright " Open new splits on opposite side

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" noesckeys will disable cursor/func keys in insert mode,
" so set delay instead
set ttimeoutlen=0

set smarttab
set expandtab
set shiftwidth=4 tabstop=4

" 1 tab == 4 spaces in specific languages
autocmd Filetype php setlocal shiftwidth=4 tabstop=4

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable continuation of comments

autocmd FileType cpp set cinoptions+=L0 " Prevent std:: from jumping to beginning of line

autocmd FileType go,c,cpp set listchars=tab:\ \ ,nbsp:%,trail:·
autocmd FileType go,c,cpp set noexpandtab

autocmd FileType help wincmd T " Open help in new tab

" https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -m json.tool

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
autocmd FocusGained,BufEnter * :checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'wellle/context.vim'

" Formatter
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
call plug#end()
