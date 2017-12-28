set nocompatible              " be iMproved, required
filetype on                   " required
filetype plugin indent on
syntax on
set hidden
set backspace=indent,eol,start

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style

au FileType html set softtabstop=2
au FileType javascript set softtabstop=2

au FileType html set tabstop=2
au FileType javascript set tabstop=2

au FileType html set shiftwidth=2
au FileType javascript set shiftwidth=2

nnoremap <leader>s :set invspell<CR>

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Yusuf's plugin

" 1. PHP Syntax Highlighting
Plugin 'StanAngeloff/php.vim'
" 2. PHP Linter
Plugin 'https://github.com/joonty/vim-phpqa'
" 3. Blade Error
Plugin 'jwalton512/vim-blade'
" 4. Tree windows
Plugin 'scrooloose/nerdtree'
" 5. Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
" 6. fatih/vim-go Don't forget to run :GoInstallBinaries
Plugin 'fatih/vim-go'
" 7. Gocode, don't forget to run go get -u github.com/nsf/gocode
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" 8. Code completion
Plugin 'Valloric/YouCompleteMe'
" 9. provides insert mode auto-completion for quotes, parens, brackets, etc. 
Plugin 'Raimondi/delimitMate'
" 10. Comment functions so powerful
Plugin 'scrooloose/nerdcommenter'
" 11. NerdTree GIT support
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 12. A Vim plugin for displaying changes in a buffer
Plugin 'chrisbra/changesPlugin'
" 13. Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 14 Buffer info
Plugin 'bling/vim-bufferline'
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml)
Plugin 'tpope/vim-ragtag'
" Always highlight enclosing tags
Plugin 'Valloric/MatchTagAlways'
" Nodejs
Plugin 'moll/vim-node'
" Buffer explorer
Plugin 'vim-scripts/LustyExplorer'
" TagBar
Plugin 'majutsushi/tagbar'
" Javascript and JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" JS Linter
Plugin 'w0rp/ale'
" This is a Vim plugin that provides Tern-based JavaScript editing support.
Plugin 'ternjs/tern_for_vim'
" Vim syntax highlighting for Vue components.
" npm i -g eslint eslint-plugin-vue
Plugin 'posva/vim-vue'
" Auto close (X)HTML tags
Plugin 'alvan/vim-closetag'
" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim.
Plugin 'othree/html5.vim'

" All of your Plugins must` be added before the following line
call vundle#end()            " required

let g:closetag_filenames = "*.twig,*.tmpl,*.vue,*.xml,*.html,*.xhtml,*.phtml,*.php"
au FileType twig,tmpl,vue,xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" Activate changes indicator
autocmd bufenter EC

" NerdTree
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=0

" vim-maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" Omni Complete, vim builtin
set omnifunc=syntaxcomplete#Complete

" VimDevIcons Icons
set encoding=utf8

" if PHP File
autocmd FileType php map <C-s> :Php<CR>
autocmd FileType php map <C-a> :Phpcs<CR>


" Toggle NerdTree
autocmd FileType go au vimEnter * NERDTree
autocmd FileType php au vimEnter * NERDTree
autocmd FileType javascript au vimEnter * NERDTree

" Hide files
" let NERDTreeIgnore=['\.swp$', '\~$']

" If Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)
au BufReadPost *.gtpl set syntax=html

" Below are some settings you might find useful. For the full list see :he go-settings.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"
" By default vim-go shows errors for the fmt command, to disable it:
" let g:go_fmt_fail_silently = 1
" Disable auto fmt on save:
" let g:go_fmt_autosave = 0
" Disable opening browser after posting your snippet to play.golang.org:
"let g:go_play_open_browser = 0
" By default when :GoInstallBinaries is called, the binaries are installed to $GOBIN or $GOPATH/bin. To change it:
" let g:go_bin_path = expand("~/.gotools")
" let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path
" Disable updating dependencies when installing/updating binaries:
" let g:go_get_update = 0

" NerdTree Git Plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'

" Airline fonts
let g:airline_powerline_fonts = 1

" Close current buffer
nmap <leader>q :bp <BAR> bd #<CR>
" Save the current file, while keeping it open
noremap <Leader>s :update<CR>
" Mapped Escape to jj 
imap jj <ESC>
imap JJ <ESC>

au BufNewFile,BufRead *.html set filetype=htmldjango
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
   hi! def link phpDocTags  phpDefine
   hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
   autocmd!
   autocmd FileType php call PhpSyntaxOverride()
augroup END

au BufReadPost *.vue set syntax=html
