" Beginners .vimrc
" v0.1 2012-10-22 Philip Thrasher
"
" If you have any questions, email me at pthrash@me.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Bundle 'gmarik/vundle'

" Atom one dark theme
Bundle 'Daetalus/atom-one-dark'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
Bundle 'ctrlpvim/ctrlp.vim'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'

" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.

" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Bundle 'groenewege/vim-less'

" Coffee-script syntax.
Bundle 'kchmck/vim-coffee-script'

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700 " History size for commands

" Set to auto read when a file is changed from the outside
set autoread

" Shows -- INSERT --, -- VISUAL -- etc
set showmode

" Leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " Show line numbers
set mouse=a " Turn mouse on

" Set block cursor when not in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set so=7 " Set 7 lines to the cursor when moving vertically
set wildmenu " Pressing tab in command line works in enhanced way, must be compiled with +wildmenu
set wildmode=longest,list,full " Complete longest common string, then list alternatives, then select the sortest first

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler " Always show current position
set showmatch " Show matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show 80 character line
set colorcolumn=81

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " Set 256 colours

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
colorscheme myonedark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Colour the line number for the current line
set cursorline
hi clear CursorLine

" Colour the Ctrl-p background, Not working
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

" Colour the wildmenu background
" hi WildMenu guifg=#93a1a1 guibg=#073642 gui=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set tabstop=4 " Number of spaces a tab is
set shiftwidth=4 " Number of spaces a '>>' does
set softtabstop=4 "Number of spaces a tab is when editing
set expandtab " Use spaces instead of tabs.
set smarttab " Let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " Tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set hidden " Allow me to have buffers with unsaved changes.

" Show trainling spaces
set list listchars=tab:>-,trail:.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set virtualedit+=block " Allow the cursor to go anywhere in visual block mode.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs, buffers, splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Bindings for easy split nav, use Ctrl and h, j, k, l, to move between split screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch easily between buffers
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>
noremap <F5> :buffers<CR>:buffer<Space>

" Always show tab bar
set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ cwd:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" Create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Use sane regex's when searching, magic search
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion of the line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
" inoremap <Down> <C-o>gj    These break moving up and down in the ctrl-p menu
" inoremap <Up> <C-o>gk

" Fixes Alt mappings mac
" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        for i in range(97,122)
            let c = nr2char(i)
            exec "map \e".c." <M-".c.">"
            exec "map! \e".c." <M-".c.">"
        endfor
    endif
endif

" Move a line of text using ALT+[jk]
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Map the key for toggling comments with vim-commentary
" Doesn't seem to work
nnoremap <leader>c <Plug>CommentaryLine

" These are plugin settings or something

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
" let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to: 30 results.
let g:ctrlp_max_height = 10 " Doesn't seem to work

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Press F2 before and after pasting to turn off auto indenting
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " Live incremental searching
set showmatch " Live match highlighting
set hlsearch " Highlight matches
set gdefault " Use the `g` flag by default.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use global clipboard for yanks
set clipboard=unnamed,unnamedplus

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function BrightHighlightOn()
    hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
    hi CursorLine guibg=#191919
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

