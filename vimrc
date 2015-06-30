"Settings
"General stuff
let mapleader = " "
execute pathogen#infect()
set encoding=utf-8
filetype plugin on

"Syntax highlighting
syntax on
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

"Schemes
colorscheme monokai

"Searching
set hlsearch
set incsearch

"Oh yes, no annoying swap files!
set noswapfile

"Whitespace

"Show trailing whitespace
set list
set listchars=eol:¬,trail:·
hi SpecialKey ctermfg=8

"Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Command-t
let g:CommandTMaxHeight = 8

"Tabsettings
set tabstop=2 shiftwidth=2 expandtab
set guifont=Menlo\ Regular:h22

"Line numbers
set number
""RltvNmbr plugin, able to use both rltv and fixed line numbers
"map rr :RltvNmbr<Enter>
"map rt :RltvNmbr!<Enter>

"Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"Folding
set foldmethod=manual

"Save folding in vimrc
set viewoptions=folds
autocmd BufWinLeave .vimrc mkview
autocmd BufWinEnter .vimrc silent loadview

"Autosave
let g:auto_save = 1

"Return to line where you left previous file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Commands
"Save/Escape commands
imap jk <Esc>:w<Enter>
cmap w!! w !sudo tee %
imap jj <Esc>
map <Leader>w :w<Enter>
map <Leader>q :q<Enter>
map <Leader>wq :wq<Enter>

"Exucute shell command
map ;; :!<Space>

"Swapping and Moving

"Swap two words
map <Leader>x cxiw

"Selection swapping
vnoremap <C-X> <Esc>`.``gvP``P

"Line and selection moving
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

"File Navigation
""NerdTree
map tt :NERDTreeToggle<Enter>

""Fuzzyfinder
map fd :FufDir<Enter>
map fl :FufLine<Enter>
map ff :FufFile<Enter>

"Find latest opened files
map fr :MRU<Enter>

"Open vimrc
map <Leader>v ;;vim ~/.vimrc<Enter>

"Window Navigation
"map re <c-w>h
"map rt <c-w>l

"Cursor Navigation
noremap H ^
noremap L $
noremap <c-j> 10j
noremap <c-k> 10k

"Execute Mode Navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"Indention
noremap <c-h> <<
noremap <c-l> >>

"Just stop using arrow keys already
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

"Textmate CMD-Enter
"Open on new line from inside insert mode
imap `` jko

"Autocompletion
let g:acp_autoselectFirstCompletion = 0
let g:acp_behaviorKeywordLength = 2
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"Navigate through dropdown
imap <c-j> <c-n>
imap <c-k> <c-p>

"Commenting
map ,, <Leader>ci

"Visual Search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"Change case
map <Leader>u guiw
map <Leader>U gUiw

"Pluralize
map <Leader>p easjk

