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

" Display extra whitespace
set list listchars=tab:»·,trail:·
set backspace=2
"set clipboard=unnamed
"
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

nnoremap <Leader>) ciw(<C-r>")<Esc>
nnoremap <Leader>( ciw(<C-r>")<Esc>
nnoremap <Leader>} ciw{<C-r>"}<Esc>
nnoremap <Leader>{ ciw{<C-r>"}<Esc>
nnoremap <Leader>] ciw[<C-r>"]<Esc>
nnoremap <Leader>[ ciw[<C-r>"]<Esc>
nnoremap <Leader>> ciw<<C-r>"><Esc>
nnoremap <Leader>< ciw<<C-r>"><Esc>
nnoremap <Leader>" ciw"<C-r>""<Esc>
nnoremap <Leader>' ciw'<C-r>"'<Esc>
nnoremap <Leader>* ciw*<C-r>"*<Esc>

vnoremap <Leader>) c(<C-r>")<Esc>
vnoremap <Leader>( c(<C-r>")<Esc>
vnoremap <Leader>} c{<C-r>"}<Esc>
vnoremap <Leader>{ c{<C-r>"}<Esc>
vnoremap <Leader>] c[<C-r>"]<Esc>
vnoremap <Leader>[ c[<C-r>"]<Esc>
vnoremap <Leader>" c"<C-r>""<Esc>
vnoremap <Leader>' c'<C-r>"'<Esc>
vnoremap <Leader>* c*<C-r>"*<Esc>

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

" pathogen
execute pathogen#infect()

" indentLIne
let g:indentLine_char = '|'
let g:indentLine_color_term = 'lightblue'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='zenburn'

" NERDTree
let NERDSpaceDelims=1
let NERDTreeIgnore=['\.vim$', '\~$', '.*\.class$', '\.pyc$', 'CVS', 'classes','.*\.jar$', 'target']

" python indent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
"autocmd BufRead *.py set foldmethod=indent
"autocmd BufRead *.py set foldlevel=99

" remove unwanted whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

filetype plugin indent on

" python-mode
"
"C901 : complex
"W0404 : redefinition of unused '__init__' ...
"let g:pymode_lint_ignore = "C901,E124,E125,E126,E127,E128,E201,E202,E231,E251,E265,E271,E501,W391,E0602,W0612,W0404"
"let g:pymode_rope_lookup_project = 0

" python syntax
" For highlighted numbers:
let python_highlight_numbers = 1
" For highlighted builtin functions:
let python_highlight_builtins = 1
" For highlighted standard exceptions:
let python_highlight_exceptions = 1
" Highlight erroneous whitespace:
let python_highlight_space_errors = 1

" vimwiki
filetype plugin on
"let g:vimwiki_list = [{'path': '~/Dropbox-personal/Dropbox/note', 'path_html': '~/Dropbox-personal/Dropbox/note_html'}]

" python-mode
"filetype off
"call pathogen#infect()
"call pathogen#helptags()
"let g:pymode_doc = 0
"let g:pymode_lint = 0
"let g:pymode_rope = 1
"let g:pymode_rope_project_root = "~/temp/ropeproject"
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion = 1
"let g:pymode_rope_autoimport = 0

"filetype plugin indent on

"""""""""""""""""
if has("lua")
    " neocomplete
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Disable autopop
    let g:neocomplete#disable_auto_complete = 1
    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction

    " <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
    inoremap <expr><TAB>  pumvisible() ? "\<C-p>" : neocomplete#start_manual_complete()
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    "if !exists('g:neocomplete#sources#omni#input_patterns')
    "  let g:neocomplete#sources#omni#input_patterns = {}
    "endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    "let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

""""""""""""""""""
" jedi
" jedi and neocomplete
"if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
"endif
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:neocomplete#force_omni_input_patterns.python =
"\ '\h\w*\|[^. \t]\.\w*'
"\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'
" jedi
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "1"
"let g:jedi#smart_auto_mappings = 0

