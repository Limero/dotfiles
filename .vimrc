if executable('fzf')
  "nnoremap <C-P> :FZF<CR>
  nnoremap <C-B> :Buffers<CR>
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
:hi Pmenu ctermbg=gray guibg=gray " ron theme has pink previews by default
set encoding=utf-8
set title
set nohlsearch
set hidden                   " Switch buffers without saving
set shortmess+=I             " Disable intro message
set clipboard=unnamedplus    " Use system clipboard
set updatetime=300           " Speed up preview while typing
set ruler                    " show the cursor position all the time
set nowritebackup noswapfile " Turn backup off
set nrformats-=octal         " Remove octal numbers for Ctrl-A and Ctrl-X, it's confusing
set ignorecase smartcase     " Ignore case when searching, except when search string has capitalisation
set incsearch                " Jump to search results while typing
set scrolloff=999            " Center cursor vertically
set splitbelow splitright    " Open new splits on opposite side
set laststatus=0             " Disable status line
let g:netrw_liststyle = 3    " netrw tree style
set path=$PWD/**             " http://vim.wikia.com/wiki/Project_browsing_using_find
set completeopt=menuone,noselect,noinsert

set wildmenu
set wildignorecase " Ignore cAsEs in Wild menu
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

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" noesckeys will disable cursor/func keys in insert mode,
" so set delay instead
set ttimeoutlen=0

set list
set listchars=tab:>-,nbsp:%,trail:·

set smarttab expandtab
set shiftwidth=2 tabstop=2

" Languages with tabs
autocmd Filetype go,c,cpp setlocal shiftwidth=4 tabstop=4
autocmd FileType go,c,cpp set listchars=tab:\ \ ,nbsp:%,trail:·
autocmd FileType go,c,cpp set noexpandtab

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
autocmd FocusGained,BufEnter * :checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -m json.tool

command -nargs=? G vimgrep /<args>/j **/* | copen 25
nnoremap \| :G 

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
