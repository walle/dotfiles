set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Fugitive is a highly-capable Git wrapper for Vim.
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks. Use [c and ]c to navigate changes.
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" Syntax checker for many languages
" You can populate the location-list and see all errors via :Errors
" https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'

" You complete me automatic code completion
Plugin 'Valloric/YouCompleteMe'

" Language syntax support
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml' "includes Haml, Sass and SCSS
Plugin 'ap/vim-css-color'
Plugin 'chrisbra/csv.vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" Colorschemes
Plugin 'whatyouhide/vim-gotham'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
augroup RD_LastLocation
  autocmd!
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Make Vim more useful
set nocompatible

" Optimize for fast terminal connections
set ttyfast

" Enable line numbers
set number

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
" Map shortcut to clear search highlighting
map <Leader>c  :nohl<cr>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let spacebar double as our leader, for great justice
" xmap includes Visual mode but not Select mode (which we don't often use, but
" if we did we'd expect hitting space to replace the selected text with a
" space char).
" nmap <space> <leader>
" xmap <space> <leader>
" nmap <space><space> <leader><leader>
" xmap <space><space> <leader><leader>
"
" ...on second thought, let's just map space directly to <leader> for a while
" and see how it goes.
nmap <space> <nop>
let mapleader=" "

" reload our .vimrc
nmap <leader>r :source ~/.vimrc<CR>:redraw!<CR>:echo "~/.vimrc reloaded!"<CR>

" Write file
nmap <leader>w :w<CR>

" Toggle spelling
nmap <leader>s :set invspell<CR>:set spell?<CR>

" Toggle wrap
nmap <leader>W :set invwrap<CR>:set wrap?<CR>

" Toggle paste mode
nmap <leader>p :set invpaste<CR>:set paste?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE TYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some file types should wrap their text
function! RD_SetupWrapping()
  setlocal wrap
  setlocal linebreak
  setlocal textwidth=78
  setlocal nolist
endfunction

augroup RD_FileTypeCommands
  autocmd!

  " Make sure all markdown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call RD_SetupWrapping()
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4
  " Syntax highlight fenced code blocks (e.g., ```ruby...)
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

  autocmd FileType mail call RD_SetupWrapping()
  autocmd FileType mail setlocal fo+=aw
  autocmd FileType mail set spell

  " enable spell checking on certain files
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Support for ES6
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en,sv

" Shortcuts using <leader>
map <leader>zn ]s
map <leader>zp [s
map <leader>zq z=

" Setup local dictionaries custom is version controlled, local is not
set spellfile=~/.vim/custom-dictionary.utf-8.add,~/.vim-local-dictionary.utf-8.add
" Remap zg to save to the local dictionary
nnoremap zG 2zg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme gotham
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
" see: :help 'statusline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=                 " reset
set statusline+=%#identifier#   " set color
set statusline+=[               " open bracket char
set statusline+=%n              " buffer number
set statusline+=%H%M%R%W        " flags: Help, Modified, RO, Preview
set statusline+=]%*             " close bracket & reset color
set statusline+=./%f\           " relative path of the filename
set statusline+=%<              " cut from here if line is too long
set statusline+=%y              " Filetype flag (displays in brackets)

set statusline+=%=              " left/right separator (everything from here is pulled right)

" show various error states that may apply
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" display a warning if fileformat isn't unix or encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'[ff:\ '.&ff.']':''}
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'[enc:\ '.&fenc.']':''}
set statusline+=%*

set statusline+=[tab:\ %{&expandtab==1?'soft':'HARD'}\ %{&ts}] " tab info

set statusline+=%{fugitive#statusline()} " git info

set statusline+=\ col\ %2c,      " cursor column
set statusline+=\ ln\ %3l/%L     " cursor line/total lines
set statusline+=\ (%P)           " percent through file

" recalculate the trailing whitespace & tab warning when idle and after saving
augroup RD_StatusUpdates
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
  autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
augroup END

" via: https://github.com/scrooloose/vimfiles
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[trailing spaces]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" via: https://github.com/scrooloose/vimfiles
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        " find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&expandtab) || (tabs && &expandtab)
            let b:statusline_tab_warning = '[&expandtab wrong?]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle colored right border after 80 chars
if exists('+colorcolumn')
  set colorcolumn=81
  let s:color_column_old = 0
  highlight ColorColumn term=reverse ctermbg=24 guibg=DarkCyan

  function! s:ToggleColorColumn()
      if s:color_column_old == 0
          let s:color_column_old = &colorcolumn
          windo let &colorcolumn = 0
      else
          windo let &colorcolumn=s:color_column_old
          let s:color_column_old = 0
      endif
  endfunction

  nnoremap <Leader>8 :call <SID>ToggleColorColumn()<cr>
endif
