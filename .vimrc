if executable('fzf')
  if has('nvim')
    nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "tabedit", "options": "--reverse --preview 'bat --style=numbers --color=always {}'"})<CR><CR>
    autocmd! FileType fzf
    autocmd  FileType fzf set norelativenumber noshowmode noruler
      \| autocmd BufLeave <buffer> set showmode ruler
  else
    nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "tabedit", "down": "100%", "options": "--reverse --preview 'bat --style=numbers --color=always {} \|\| head -100 {}'"})<CR>
  endif
else
 nnoremap <C-P> :tabfind *
endif

" Needed for nvim on Fedora
set runtimepath+=/usr/share/vim/vimfiles

"nnoremap <C-P> :FZF<CR>

" Ale
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'

nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <C-^> :ALEFindReferences<CR>

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

" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
xnoremap p "_dP

" Define commands for common typos
command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
nnoremap ; :

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

:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLine cterm=none ctermbg=0
:hi Pmenu ctermbg=gray guibg=gray

set wildmenu

" Ignore cAsEs in Wild menu
set wildignorecase
" Ignore compiled files
set wildignore=*.o,*~,*.class,*.pyc
" Random filetypes
set wildignore+=*.png,*.jpg,*.svg,*.pdf,*.graphml,*.eot,*.woff,*.log,*.sqlite
" Directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/vendor/*,*/cache/*,*/bin/*,*/.DS_Store

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

" ctags
" https://stackoverflow.com/a/563992
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set tagcase=match

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

autocmd FileType go,c,cpp set listchars=tab:\ \ ,nbsp:%,trail:·
autocmd FileType go,c,cpp set noexpandtab

" Enable spell checking
" https://www.linux.com/learn/using-spell-checking-vim
"set spelllang=en_us
"autocmd FileType markdown set spell

autocmd FileType help wincmd T " Open help in new tab

" https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python -m json.tool

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
autocmd FocusGained,BufEnter * :checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" https://github.com/neovim/neovim/issues/10223
if exists('$WAYLAND_DISPLAY')
    " clipboard on wayland with newline fix
    let g:clipboard = {
                \   'name': 'WL-Clipboard with ^M Trim',
                \   'copy': {
                \      '+': 'wl-copy --foreground --type text/plain',
                \      '*': 'wl-copy --foreground --type text/plain --primary',
                \    },
                \   'paste': {
                \      '+': {-> systemlist('wl-paste --no-newline | sed -e "s/\r$//"', '', 1)},
                \      '*': {-> systemlist('wl-paste --no-newline --primary | sed -e "s/\r$//"', '', 1)},
                \   },
                \   'cache_enabled': 1,
                \ }
endif
