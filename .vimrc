set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Yusuf's plugin

" 1. PHP Syntax Highlighting
Plugin 'StanAngeloff/php.vim'
" 2. PHP Linter
Plugin 'https://github.com/joonty/vim-phpqa'
" 3. Tree windows
Plugin 'scrooloose/nerdtree'
" 4. Grepper
Plugin 'mhinz/vim-grepper'
" 5. Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

"End of Yusuf's plugin

" All of your Plugins must` be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


execute pathogen#infect()
set nu

" NerdTree
map <C-\> :NERDTreeToggle<CR>

" Next tab
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>
map <C-Down> :tabclose<CR>
map <C-Up> :tabnew<CR>

" if PHP File
autocmd FileType php map <C-s> :Php<CR>
autocmd FileType php map <C-a> :Phpcs<CR>
autocmd FileType php au vimEnter * NERDTree

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
   hi! def link phpDocTags  phpDefine
   hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
   autocmd!
   autocmd FileType php call PhpSyntaxOverride()
augroup END
