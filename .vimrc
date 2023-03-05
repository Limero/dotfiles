" Find file and navigate buffers. Will be overriden by fzf if available
nnoremap <C-P> :tabfind *
nnoremap <C-B> :buffers<CR>:buffer<Space>

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
"colorscheme ron
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
set foldopen=mark,quickfix,tag

set wildmenu
set wildignorecase " Ignore cAsEs in Wild menu
" Ignore compiled files
set wildignore=*.o,*~,*.class,*.pyc,/*service
" Random filetypes
set wildignore+=*.png,*.jpg,*.svg,*.pdf,*.graphml,*.eot,*.woff,*.log,*.sqlite,*.ttf,*.json,*.key
" Random files
set wildignore+=CHANGELOG.md,CODEOWNERS,go.sum,swagger.yaml
" Directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/vendor/*,*/cache/*,*/bin/*,*/.DS_Store,*/gen/*,*/mocks/*,*/testdata/*

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

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
autocmd FocusGained,BufEnter * :checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -m json.tool

command -nargs=? G vimgrep /<args>/j **/* | copen 25
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -g\ '!{mocks,CHANGELOG.md,CODEOWNERS,go.sum}'
  command! -nargs=+ G execute 'silent grep! "<args>"' | copen 25
endif
nnoremap \| :G<Space>

" https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
:nmap yp :let @+ = expand("%")<cr>
:nmap yfp :let @+ = expand("%:p")<cr>

" https://stackoverflow.com/questions/33051496/custom-script-for-git-blame-from-vim
command! -nargs=* GB call s:GitBlame()
function! s:GitBlame()
   let cmdline = "git blame -w " . bufname("%")
   let nline = line(".") + 1
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap cursorline
   execute "$read !" . cmdline
   setlocal nomodifiable
   execute "normal " . nline . "gg"
endfunction
