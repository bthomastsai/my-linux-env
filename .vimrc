set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
 " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'fcamel/gj'
Plugin 'https://github.com/rking/ag.vim.git'
Plugin 'mileszs/ack.vim'

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList          - list configured plugins
 " :PluginInstall(!)    - install (update) plugins
 " :PluginSearch(!) foo - search (or refresh cache first) for foo
 " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
"Set Mapleader
let mapleader = ","
let g:mapleader = ","
let g:indent_guides_guide_size=1

"Turn filetype plugin on
filetype on
filetype plugin on
set runtimepath+=~/.vim/textmateOnly
set runtimepath+=~/.vim/textmateOnly/after

set autoread

"Fast saving
nmap <leader>w :w!<cr>

"Search Dictionary
nmap <leader>d :call SearchWord()<CR>
""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set laststatus=2

"Format the statusline
set statusline=Line:\ \ %l/%L:%c\ \ \ %F%m%r%h\ %w


"Remove the Windows ^M
map <Leader>m mz:%s/\r$//g<cr>`z

"Remove trailing whilespace
map <Leader>s :%s/\s\+$//e

"Nerd Tree commands and options
map <Leader>, :NERDTreeToggle<cr>
map <Leader>t :TlistToggle<cr>
map <Leader>b :TagbarToggle<cr>

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set mouse=n
"GUI Options
" set guioptions=e
" set showtabline=2
" set tabpagemax=15

"Font info
set guifont=Monaco

"Colorscheme options
" set t_Co=256
colorscheme wombat256
set cursorline
let python_highlight_all = 1

"Other Options
set splitright
set wildmode=longest,list,full
set wildmenu
"set nobackup
set directory=~/.swpdir
set backupdir=~/.backdir
set nocompatible
set ruler
set number
set nuw=4
set vb
set binary noeol
set backspace=indent,eol,start
set showmode
set showmatch
"set ignorecase
"set smartindent
"set modeline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set fileformats=dos,unix " support all three, in this order

syntax on

" indentation rules for FFmpeg: 4 spaces, no tabs
set tabstop=4
set shiftwidth=4
set expandtab
retab
"set softtabstop=4
"set noexpandtab
set cindent
set cinoptions=(0
" allow tabs in Makefiles
" autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=4
" Trailing whitespace and tabs are forbidden, so highlight them.
" highlight ForbiddenWhitespace ctermbg=red guibg=red
" match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
" autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/
"autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" Markdown file
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

au BufReadPost svn-commit.tmp  silent! exe '0read  ~/.commit.template'

ab teh the
ab fro for

set incsearch
set smartcase

"Map hlsearch
nmap <Leader>hl :set hlsearch!<BAR>set hlsearch?<CR>
" turn off highlight search automatically
nnoremap <silent> <CR> :nohl<CR><CR>


"Tab maps
map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt

"VCSCommand
command SVNadd VCSAdd
command SVNblame VCSAnnotate
command SVNcommit VCSCommit
command SVNdelete VCSDelete
command SVNdiff VCSVimDiff
command SVNlog VCSLog
command SVNstatus VCSStatus
command SVNupdate VCSUpdate
command SVNup VCSUpdate

"Status line visual fluff
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0* " buffer number
set statusline+=%f " file name
set statusline+=%h%1*%m%r%w%0* " flags
set statusline+=[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
set statusline+=%2*0x%-8B " current char
set statusline+=%-14.(%l,%c%V%) " offset
set statusline+=%{fugitive#statusline()} "git branch

"diff option
set diffopt+=iwhite

" Only rightscrollbars
" set guioptions-=L
" set guioptions-=l
" set guioptions+=R
" set guioptions+=r

" Thomas Tsai's key mapping
"map <F8> :TlistToggle<CR>

" Thomas Tsai's option
set clipboard=unnamed
set nowrap
set path=./,**,


function! DeNoise()
       execute 'v/eventq\|Elapsed\|set frequency\|tuner_callback\|PERFORMANCE_TEST\|CA Demux Data\|STVID.*EVT\|CA Desc Set Pid\|dscSet1LevelProtectedKeys] xDscChannelId\|CA Filter\|T1RawExchange nRet\|CAK\|*L1*>/d'
endfunction
nnoremap <silent> <leader>ll :call DeNoise()<CR>

function! TransCakTime()
       execute '%s:\(\d\+\.\d\+\)\/\d\+:\=float2nr(str2float(submatch(1)) * 1000):'
endfunction
nnoremap <silent> <leader>ls :call TransCakTime()<CR>

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()

"Added by android-vim:
set tags+=/Users/bthomastsai/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

let g:ackprg = "/usr/bin/ack-grep"
"let g:ackprg = 'ag --nogroup --nocolor --column'
"
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

function MultiScroll(OnOff)
    if a:OnOff == 1
        noremap j 5j
        noremap k 5k
    else
        noremap j j
        noremap k k
    endif
endfunction

map \j :call MultiScroll(1)<RETURN>
map \k :call MultiScroll(0)<RETURN>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

set runtimepath^=~/.vim/bundle/ag
