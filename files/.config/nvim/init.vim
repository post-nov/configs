call plug#begin()

" FuzzyFinder (для быстрого поиска)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" NERDTree - быстрый просмотр файлов
Plug 'preservim/nerdtree'
" Сoc - автодополнение 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Дополнения для NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
" Дополнение для Git, а также иконки для NERDTree
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
" Линия статуса
Plug 'itchyny/lightline.vim'
" Проверка Синтаксиса
Plug 'scrooloose/syntastic' 
Plug 'nvie/vim-flake8'
" Плагин автозавершения
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
" Закрывашка для ", [, (, {..
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Поддержка Python
Plug 'klen/python-mode'
Plug 'vim-scripts/indentpython.vim'
" Темы
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
" Folding
Plug 'tmhedberg/SimpylFold'
" Django
Plug 'jmcomets/vim-pony'
call plug#end()

" Украшательства
set number
set ruler

" Комбинация клавиш jkl - действует как Escape в режиме Insert
inoremap jkl <ESC>

" Делаем так, чтобы навигация работала на русском языке
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d

" В нормальном режиме Ctrl+n вызывает :NERDTree
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggl

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Тема для **NeoVim**
syntax on
" Лютый костыль, но почему-то если сначала выставить цвета терминала, 
" а затем цветовую схему, то все работает 
set termguicolors
colorscheme iceberg

" Линия статуса: конфигурация
set noshowmode " Табличка --INSERT-- больше не выводится на экран
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
	
" Питоновские настройки
set ts=4
set autoindent
set shiftwidth=4
set textwidth=120
set expandtab
set fileformat=unix
let python_highlight_all=1

" Для веба
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2 
	\ set shiftwidth=2

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Autocomplete
let g:jedi#completions_enabled = 0

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Don't show docs
set completeopt-=preview
