" -----------------------------------------------------------------------------
" vim-plug
" to install vim-plug:
"   1) curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   2) run :PlugInstall
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'                   " one colorscheme pack to rule them all!
Plug 'vim-airline/vim-airline'                  " Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Dark powered asynchronous completion framework for neovim/Vim8
Plug 'deoplete-plugins/deoplete-jedi'                           " Deoplete.nvim source for Python
Plug 'w0rp/ale'                                                 " Asynchronous Lint Engine
Plug 'scrooloose/nerdcommenter'                                 " Vim plugin for intensely orgasmic commenting
Plug 'SirVer/ultisnips'                                         " Snippets made easy (<Tab>)
Plug 'honza/vim-snippets'                                       " Default snippets

" Plug 'vim-latex/vim-latex'                      " Enhanced LaTeX support for Vim
Plug 'lervag/vimtex'                            " A modern vim plugin for editing LaTeX files

Plug 'airblade/vim-gitgutter'                   " A Vim plugin which shows a git diff in the 'gutter' (sign column)
Plug 'tpope/vim-fugitive'                       " fugitive.vim: a Git wrapper so awesome, it should be illegal

call plug#end()

" -----------------------------------------------------------------------------
" General setting
set nocompatible                                "always set
set autoread                                    " Automatic read file when changed outside of Vim
set showcmd                                     " Show (partial) command in status line.
set wildmenu                                    " use menu for command line completion
set mouse=a                                     " Enable mouse usage (all modes)
filetype on                                     " file type detection
filetype plugin on                              " file type plugin
filetype indent on                              " file type indent
syntax on                                       " syntax to be loaded for current buffer
let mapleader=','                               " To define a mapping which uses the mapleader variable

" Syntax checking
let g:ale_enabled=1                             " enable ale
let g:ale_lint_on_text_changed=0                " do not check at text change
let g:ale_lint_on_insert_leave=1                " check when leave insert mode

" Commenting
let g:NERDSpaceDelims = 1                       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                 " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1                 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1            " Enable trimming of trailing whitespace when uncommenting

" Auto completion
let g:deoplete#enable_at_startup=1              " enable deoplete
let g:deoplete#auto_complete_delay=100          " delay completion
let g:deoplete#enable_smart_case=1              " no ignore case when pattern has uppercase
let g:deoplete#min_pattern_length=3             " number of input completion
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" Python provider
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" -----------------------------------------------------------------------------
" Edit setting
set autoindent                                  " Take indent for new line from previous line
set smarttab                                    " use 'shiftwidth' when inserting <Tab>
set expandtab                                   " use spaces when <Tab> is inserted
set tabstop=2                                   " number of spaces that <Tab> in file uses
set shiftwidth=2                                " Number of spaces to use for each step of (auto)indent
set conceallevel=2                              " whether concealable text is shown or hidden

" -----------------------------------------------------------------------------
" Search setting
set hlsearch                                    " Highlight matches with last search pattern
set incsearch                                   " Highlight match while typing search pattern
set ignorecase                                  " Ignore case in search patterns
set smartcase                                   " no ignore case when pattern has uppercase

" -----------------------------------------------------------------------------
" Display/Theme settings
set background=dark                             " dark background, used for highlight colors
set ruler                                       " show cursor line and column in the status line
set number                                      " print the line number in front of each line
set showmatch                                   " briefly jump to matching bracket if insert one
set cursorline                                  " highlight the screen line of the cursor
set colorcolumn=80                              " color the columns
set list listchars=tab:▸\ ,trail:∎,eol:¬        " print special characters
let g:airline_powerline_fonts=1                 " use powerline symbols
let g:airline#extensions#tabline#enabled=1      " enable buffer line integration
let g:airline#extensions#ale#enabled=1          " enable ale integration
let g:airline#extensions#fugitiveline#enabled=1
colorscheme jellybeans                          " vim-colorscheme parameter
hi CursorLine cterm=bold ctermbg=235
hi Search cterm=NONE ctermbg=Yellow ctermfg=Black
hi IncSearch cterm=NONE ctermbg=Yellow ctermfg=Black

" -----------------------------------------------------------------------------
" Shortcut/Mapping
"remap C-n to tab for deoplete
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" down is really next line
nnoremap j gj
nnoremap k gk

" easy escape to normal mode
imap jj <esc>

" exit terminal mode
tnoremap jj <C-\><C-n>

" new line
nnoremap <C-O> O<esc>
nnoremap <C-o> o<esc>

" easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" turn off results highlight
noremap <F8> :noh<CR>
inoremap <F8> <esc>:noh<CR>a

" toggle showing non-printable characters
noremap <F12> :set list!<CR>
inoremap <F12> <esc>:set list!<CR>a

" -----------------------------------------------------------------------------
" LaTex config
let g:tex_conceal="a"                          " Latex conceal
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_CompileRule_pdf = 'latexmk'
" " let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -shell-escape -file-line-error -output-directory=build $*'
" let g:Tex_UseMakefile = 0
" let g:Tex_AutoFolding = 0
" let g:Tex_UseSimpleLabelSearch = 1
" set grepprg=grep\ -nH\ $*

" -----------------------------------------------------------------------------
" git config
set updatetime=10       " vim-gitgutter: update time

let g:tex_flavor = 'latex'       " use latex flavor instead of plaintex
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
    \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|\w*'
\ .')'

" -----------------------------------------------------------------------------
" ultisnips config
let g:UltiSnipsUsePythonVersion = 3

" -----------------------------------------------------------------------------
" ale config
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'tex': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
\}

let g:ale_linters_explicit = 1
let g:ale_linters = {
\'cpp' : ['clang', 'gcc', 'clangcheck'],
\'tex' : ['chktex', 'lacheck']
\}
let g:ale_cpp_clangcheck_options = '-- -Iinclude'
let g:ale_fix_on_save = 1

" -----------------------------------------------------------------------------
" config for deoplete-clanx

" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')
