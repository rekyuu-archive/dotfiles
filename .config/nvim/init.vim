set nocompatible
filetype off

" Plugins
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'

" Syntax Plugins
Plugin 'tpope/vim-markdown'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on

" Autorun plugins
autocmd vimenter * NERDTree

" Cosmetic
syntax on
set number
