"                                 __
"        ___        ___          /__/\
"       /__/\      /  /\        |  |::\
"       \  \:\    /  /:/        |  |:|:\
"        \  \:\  /__/::\      __|__|:|\:\
"    ___  \__\:\ \__\/\:\__  /__/::::| \:\
"   /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"   \  \:\|  |:|     \__\::/  \  \:\
"    \  \:\__|:|     /__/:/    \  \:\
"     \__\::::/      \__\/      \  \:\
"         ~~~~                   \__\/
"
" Install all the plugins
call plug#begin('~/.vim/plugged')
Plug 'luochen1990/rainbow'
"Plug 'sjl/vitality.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'gnattishness/cscope_maps'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
"Plug 'dylanaraps/fff.vim'
"Plug 'mcchrish/nnn.vim'
Plug 'vifm/vifm.vim'
call plug#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
set nocompatible

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
    set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Set hidden needed by ctrl space
set hidden

" wait time for plugins
set updatetime=100

" keep 1000 lines of command line history
set history=1000

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" display completion matches in a status line
set wildmenu
set wildmode=longest,full

" time out for key codes
set ttimeout

" wait up to 100ms after Esc for special key
set ttimeoutlen=100

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=0

" Do incremental searching when it's possible to timeout.
if has('reltime')
    set incsearch
endif

" Store info from no more than 100 files at a time, 9999 lines of text
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Encoding
set encoding=utf-8

" Wrap text on words
set linebreak

" How pasting is formatted
set formatoptions=tcqrn1

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Show line numbers
" set nu
set relativenumber

" Show the line where the cursor is
set cursorline

" Wrap lines that are too long
set wrap

" Split in a sane way
set splitright
set splitbelow

" Highlight search terms
set hlsearch

" Ignore case when searching
set ignorecase

" Case sensitive only if using upper case letters in search
set smartcase

" Show white space
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

" Change the character for split
set fillchars=vert:\│

" Options for vimdiff algorithm
set diffopt+=hiddenoff,iwhiteall,iblank,internal,context:10,algorithm:histogram

" When pressing tab add 4 spaces, when pressed again insert a tab
" which is equivalent to 8 spaces
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab

" Color column 81
set colorcolumn=81

" Make yank use the system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

set modelines=0
set ttyfast
set laststatus=2
set showmode
set matchpairs+=<:>
set wic
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
set guioptions+=a

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
    set mouse=a
endif

" Fix focus
let g:vitality_fix_focus = 1
let g:vitality_always_assume_iterm = 1

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
   " Revert with ":syntax off".
    syntax on

    " I like highlighting strings inside C comments.
    " Revert with ":unlet c_comment_strings".
    let c_comment_strings=1
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If set (default), this may break plugins (but it's backward
    " compatible).
    set nolangremap
endif

"""""" Key Bindings """"""

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Make up and down work properly on wrapped lines
noremap j g<Down>
noremap k g<Up>

" Remap semicolon to colon
map ; :
noremap ;; ;

" Toggle the line numbers
nnoremap <F2> :set nonumber!<CR>
inoremap <F2> <C-o>:set nonumber!<CR>
cnoremap <F2> <C-c>:set nonumber!<CR>

" Toggle turning tabs into spaces
nnoremap <F3> :set expandtab!<CR>
inoremap <F3> <C-o>:set expandtab!<CR>
cnoremap <F3> <C-c>:set expandtab!<CR>

" Toggle showing whitespace
nnoremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Make the Tab key shift lines
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-d>

" Use ctrl + up or down to move a line
nnoremap <C-k> :m-2<CR>
inoremap <C-k> <C-o>:m-2<CR>
cnoremap <C-k> <C-c>:m-2<CR>
nnoremap <C-j> :m+1<CR>
inoremap <C-j> <C-o>:m+1<CR>
cnoremap <C-j> <C-c>:m+1<CR>

" Shortcut for file opener
nnoremap <C-f> :FZF<CR>
nnoremap <C-b> :Vifm<CR>

" COLORS

" Set my colorscheme
let g:dracula_italic = 0
let g:dracula_colorterm = 0
color dracula

hi DraculaBoundary ctermbg=none
" hi VertSplit cterm=none ctermfg=233
" hi ignore ctermfg=234
" hi Todo cterm=bold ctermfg=white ctermbg=darkred
hi ColorColumn ctermbg=239
" hi DiffAdd ctermbg=22 ctermfg=none cterm=bold
" hi DiffDelete ctermbg=52 ctermfg=none cterm=bold
" hi DiffChange ctermbg=233 ctermfg=none cterm=none
" hi DiffText ctermbg=none ctermfg=none cterm=bold
" hi MatchParen ctermbg=5
" hi Folded ctermbg=233
" hi TabLineFill ctermfg=235
" hi Pmenu ctermfg=white ctermbg=5
" hi PmenuSel ctermfg=white ctermbg=darkred
" hi VertSplit ctermbg=none
" hi SpecialKey ctermfg=242
hi StatusLine cterm=reverse
" hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" hi CursorLineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE
hi CursorLine cterm=bold ctermbg=NONE ctermfg=NONE guibg=black guifg=NONE
" hi Search cterm=NONE ctermfg=none ctermbg=darkgrey
" hi Visual term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE


" AUTOCMDS
" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    " Revert with ":filetype off".
    filetype plugin indent on

    " Put these in an autocmd group, so that you can revert them with:
    " ":augroup vimStartup | au! | augroup END"
    augroup vimStartup
        au!

        "au FocusLost * set norelativenumber
        "au InsertEnter * set norelativenumber
        "au FocusGained * set relativenumber
        "au InsertLeave * set relativenumber
        "au BufNewFile * tab sball

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid, when inside an event handler
        " (happens when dropping a file on gvim) and for a commit message (it's
        " likely a different one than last time).
        autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

    augroup END

endif " has("autocmd")


" OPTIONS FOR PLUGINS
" Rainbow Options
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Airline Options
let g:airline#extensions#tabline#enabled = 1

" Signify Options
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

" Syntastic Options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" CtrlSpace Options
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" YouCompleteMe Options
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0

" NNN options
let g:nnn#layout = { 'left': '~20%' }
