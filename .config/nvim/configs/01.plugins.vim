call plug#begin('~/.config/nvim/bundle')

Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

" Paredit – a Visual Guide
Plug 'kovisoft/paredit'
" A simple Vimscript test framework
Plug 'junegunn/vader.vim'
" 🌻 A Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" A code-completion engine for Vim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" fireplace.vim: Clojure REPL support
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" 🌸 A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Multiple cursors plugin for vim/neovim
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'
" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-sensible'
" Plug '/usr/local/opt/fzf'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" lean & mean status/tabline for vim that's light as air
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
"
" Powerline is a statusline plugin for vim
" Plug 'powerline/powerline'
"
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-speeddating'
Plug 'gregsexton/gitv'
Plug 'mbbill/undotree'
Plug 'benmills/vimux'
Plug 'justinmk/vim-sneak'
Plug 'sjl/clam.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" emmet for vim: http://emmet.io/
Plug 'mattn/emmet-vim'
" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'
"
"### Language
" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'
" An autocompletion daemon for the Go programming language
Plug 'nsf/gocode', { 'rtp': 'vim' }
" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ekalinin/dockerfile.vim'
Plug 'stanangeloff/php.vim'
Plug 'sheerun/vim-polyglot'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/nginx.vim'
Plug 'junegunn/vim-github-dashboard'
Plug 'scrooloose/nerdcommenter'

" Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'
" A light and configurable statusline/tabline plugin for Vim
" Plug 'itchyny/lightline.vim'
"

" A tree explorer plugin for vim.
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'xuyuanp/nerdtree-git-plugin'
" Generate a fast shell prompt with powerline symbols and airline colors
Plug 'edkolev/promptline.vim'
" Theme
Plug 'morhetz/gruvbox'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' | Plug 'ryanoasis/vim-devicons'
" https://github.com/ryanoasis/vim-devicons

call plug#end()