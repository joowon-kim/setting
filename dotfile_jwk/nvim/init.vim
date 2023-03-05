set nocompatible
set encoding=utf-8
set ff=unix
set t_Co=256
syntax on
set history=50
set incsearch
set hls
set noerrorbells visualbell t_vb=

set number
set numberwidth=5
set laststatus=2
set ruler
set showcmd

set tabstop=4
set shiftwidth=4
set sts=4 "softtabstop
set expandtab
set smarttab

set autoindent
set cindent
set smartindent

set fo-=r
set mouse=a


" vim-plug
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·
set backspace=2
"set clipboard=unnamed
"
colorscheme dracula
"colorscheme torte
"colorscheme seoul256
"colorscheme github
"highlight NonText guibg=#060606
"highlight Folded guibg=#0A0A0A guifg=#9090D0

" setup swap file location
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

" key mapping
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+P

" imap <S-CR> <ESC>o
" imap <C-S-Enter> <ESC>O
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

"map <A-Left> <C-w>h
"map <A-Right> <C-w>l
"map <A-Up> <C-w>k
"map <A-Down> <C-w>j

map <C-Right> <C-W>l
map <C-Left> <C-W>h
map <C-Down> <C-W>j
map <C-Up> <C-W>k

map <C-S-p> :bp<CR>
map <C-S-n> :bn<CR>
map <C-S-h> :bp<CR>
map <C-S-l> :bn<CR>

map th :tabprev<CR>
map tl :tabnext<CR>
map tn :tabnew<CR>
map td :tabclose<CR> 

"map <F2> %zf
"map <F3> zo
" block to clipboard
map <F2> "+y
" paste from clipboard
map <F3> "+p
set pastetoggle=<F4>
" remove this file from buffer
map <F5> :bp<bar>sp<bar>bn<bar>bd<CR>
map <F12> :NERDTreeToggle<CR>


" copy without indent
function! NoIndent()
    let wholeline=substitute(@+, '\n\n\+', "\n", 'g')
    let lines=split(wholeline, "\n")
    let indent=0
    let parsed=''
    for line in lines
        let current_indent=strlen(matchstr(line, '^\s\+\s\@!'))
        if indent < current_indent
            let indent=current_indent
        endif
        if indent > current_indent
            let parsed=parsed."\n"
            let indent=current_indent
        endif
        let line=substitute(line, '^\ *', '', 'g')
        let parsed=parsed.line."\n"
    endfor
    let @+=parsed
"    let @+=substitute(@+, '^\ *', '', 'g')
"    let @+=substitute(@+, '\n\@<!\n\n\n\@!', '\n\n\n', 'g')
endfunction
map ,r "+y:call NoIndent() <cr>

if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        source ~/vimrc_mac.vim
        colorscheme torte
    else
        " Do Linux stuff here
        if s:uname == "CYGWIN_NT-10.0-WOW\n"
            " Do MobaXTerm stuff here
            source ~/vimrc_moba.vim
        endif
    endif
else
    " Do Windows stuff here
endif

" remove unwanted whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

filetype plugin indent on

" python syntax
" For highlighted numbers:
let python_highlight_numbers = 1
" For highlighted builtin functions:
let python_highlight_builtins = 1
" For highlighted standard exceptions:
let python_highlight_exceptions = 1
" Highlight erroneous whitespace:
let python_highlight_space_errors = 1

