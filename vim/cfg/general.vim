" => General -----------------------------------------------{{{
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

set t_Co=256

syntax enable
set background=dark
"colorscheme solarized

let g:sql_type_default = 'mysql'


set viminfo^=%

"-----------------------------------------------------------}}}
" => Buffers -----------------------------------------------{{{

" Set to auto read when a file is changed from the outside
set autoread
" A buffer becomes hidden when it is abandoned
set hid

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry



"-----------------------------------------------------------}}}
" => Encoding & Backup -------------------------------------{{{
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

"-----------------------------------------------------------}}}
" => Undo --------------------------------------------------{{{
try
    set undodir=$PROFILE_DIR/vim/tmp/undodir
    set undofile
catch
endtry


"-----------------------------------------------------------}}}
" => Search & Replace --------------------------------------{{{

" Ignore case when searching
"set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

"-----------------------------------------------------------}}}
" => Status Line -------------------------------------------{{{

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

"-----------------------------------------------------------}}}
" => Lines & Indentation -----------------------------------{{{

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4

"-----------------------------------------------------------}}}
" => VIM user interface ------------------------------------{{{

set foldmethod=marker

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Enable mouse scrolling
"set mouse=a

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set title
set hidden
set list
set number
set listchars=tab:!·,trail:·

" Height of the command bar
set cmdheight=1

"-----------------------------------------------------------}}}
