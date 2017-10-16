"  /\ \ \___  _____   _(_)_ __ ___
" /  \/ / _ \/ _ \ \ / / | '_ ` _ \
"/ /\  /  __/ (_) \ V /| | | | | | |
"\_\ \/ \___|\___/ \_/ |_|_| |_| |_|
"-----------------------------------
" Configuration file

" Plugins {{{
" Load plugin and indent plugin automatically based on filetype
filetype plugin indent on
" Si tu veux installer un nouveau plugin, ajoute une line ci-dessous
" puis lance :PlugInstall et voilà!
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
"Plug 'NovaDev94/lightline-onedark'
Plug 'jack6000/lightline-onedark'
Plug 'airblade/vim-gitgutter'
"Plug '/home/jack/.config/nvim/vim-sniper'
"Plug '/home/jack/.config/nvim/molok'
Plug 'vivien/vim-linux-coding-style'
Plug 'jack6000/grep-selection'
Plug 'equalsraf/neovim-gui-shim'
Plug 'cespare/vim-toml'
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
"Plug 'vim-scripts/OmniCppComplete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'cocopon/vaffle.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'derekwyatt/vim-fswitch'
""-- Qques cool colorscheme
Plug 'jack6000/vim-hybrid'
"Plug 'tomasr/molokai'
Plug 'jack6000/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/Wombat'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
"Plug 'zchee/hybrid.nvim'
call plug#end()
" }}}
" General {{{
"set guicursor=                  " Pour éviter un bug d'affichage dans neovim
set termguicolors               " Pour utiliser des couleurs 24bits
"set backup                      " keep a backup file (restore to previous version)
set undofile                    " keep an undo file (undo changes after closing)
set noshowmode                  " Affiche le mode d'édition.
set ruler                       " Affiche la position du curseur.
set noerrorbells                " Pas de beep.
set modeline                    " Enable modeline. La dernière ligne d'un fichier comprends des instructions vim à appliquer au fichier
set nowrap                      " Pas de retour à la ligne pour les longues lignes
set encoding=utf-8              " Encodage par défaut
set diffopt=vertical            " Split vertical pour la comparaison de fichier
set backspace=indent,eol,start  " Retour arrière intelligent
set formatoptions-=o            " Ne pas commenter automatiquement la ligne lorsque l'on presse o ou O
set hidden
set switchbuf=useopen           " Lors de swtich de buffer, sélectionne la fenêtre déja ouverte
set scrolloff=4                 " Garde le ligne courante toujours au centre
set completeopt=menu,menuone,preview,longest

" Switch on syntax highlighting
syntax enable

" How to show special chars like tabs, trailing whitespace...
" Add eol:<char> to show end of line
"set listchars=tab:\|\.,trail:•,extends:,precedes:,nbsp:+,eol:¬
set listchars=tab:\|\.,trail:•,extends:,precedes:,nbsp:+
set list                        " Affichage des caractères non imprimables

" Ajout du dossier d'include de AVR lib
"set path+=/usr/lib/avr/include
" Cherche dans le répertoire et les sous répertoire
"set path+=**

" Ajout du dictionnaire français
set dict+=/usr/share/dict/french

" Evite de charger le plugin interne d'affichage des matching parenthesis
:let loaded_matchparen=1

" Ne pas afficher la bannière de netrw
":let g:netrw_banner=0
"" Affichage de netrw sur 25% de largeur
":let g:netrw_winsize=25
"" Affichage part sort
:let g:netrw_sort_options="i"

"" Enable folding for xml files
":let g:xml_syntax_folding=1
" }}}
" Indentation et tabulation {{{
set tabstop=4           " Nombre d'espace pour un TAB, lors de la lecture d'un fichier.
set softtabstop=4       " Nombre d'espace pour un TAB, lors de l'édition.
set expandtab           " Conversion des tabulations en espaces.
set shiftwidth=4        " Nombre d'espace pour l'indentation avec < et >.
set smartindent         " Indentation intelligente.
set autoindent          " Conservation de l'indentation pour les nouvelles lignes.
set shiftround          " Indentation au tab le plus proche
" }}}
" UI config {{{
set number              " Affichage du numéro des lignes
set showcmd             " Affiche les commandes incomplètes.
set cursorline          " Affichage en sur brillance de la ligne du curseur.
set wildmenu            " Affichage de l'auto-complétion pour les commandes systèmes.
set lazyredraw          " Rafraichissement de la vue seulement si nécessaire
set showmatch           " Affiche les accolades/parentheses correspondantes.
" }}}
" Searching {{{
set incsearch           " Incremental search.
set hlsearch            " Affichage en surbrillance de la recherche.
set ignorecase          " Pas de casse pour la recherche
set smartcase           " ... unless the query has capital letters.
" }}}
" Key mapping {{{
" Map the leader key to SPACE
let mapleader="\<SPACE>"
nnoremap <silent> <c-l> :nohlsearch<CR>

" Toggle relative numbering
nnoremap <leader>r :set rnu!<cr>

" Navigation rapide entre les fenêtres
nnoremap <silent> <A-h> :wincmd h<cr>
nnoremap <silent> <A-k> :wincmd k<cr>
nnoremap <silent> <A-j> :wincmd j<cr>
nnoremap <silent> <A-l> :wincmd l<cr>

" Pour re-dimensionner les fenêtres
nnoremap <Left> :vertical resize +2<cr>
nnoremap <Right> :vertical resize -2<cr>
nnoremap <Up> :resize -2<cr>
nnoremap <Down> :resize +2<cr>

" Navigation rapide pour les tags (utile pour les fichiers d'aide)
" Sauf dans la fenêtre quickfix
nnoremap <expr> <cr> &buftype == "quickfix" ? "\<cr>zz" : "\<c-]>zz"
nnoremap <bs> <c-t>

" Pour editer/prendre en compte rapidement ce fichier
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>sc :source $MYVIMRC<cr>

" Fichier bashrc
nnoremap <leader>eb :vsplit ~/.bashrc<cr>

" Terminal key bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Navigation dans les buffers
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bP :bfirst<cr>
nnoremap <leader>bN :blast<cr>
" Affiche la liste des buffers, et swtich en full-screen
nnoremap <leader>bf :ls<cr>:b<space>
" Affiche la liste des buffers, et swtich en horizontal
nnoremap <leader>bh :ls<cr>:sb<space>
" Affiche la liste des buffers, et swtich en vertical
nnoremap <leader>bv :ls<cr>:vert sb<space>

" Navigation dans le pop-up menu
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" fugitive keybindings
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gD :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

" Navigation dans un fichier C, garde la ligne
" toujours au centre
nnoremap [[ [[zz
nnoremap ]] ]]zz

" Compilation
nnoremap <silent> <f9> :w \| make! \| copen<cr>

" Programmation
nnoremap <silent> <f10> :make program<cr>

" Navigation dans la quickfix
nnoremap >q :cnext<cr>
nnoremap >Q :clast<cr>
nnoremap <q :cprevious<cr>
nnoremap <Q :cfirst<cr>
" }}}
" CppEnhancedHighlight Plugin config {{{
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
" }}}
" OmniCppComplete Plugin config {{{
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" also necessary for fixing LIBSTDC++ releated stuff
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "_GLIBCXX_STD_A"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
" }}}
" LinuxCodingStyle Plugin config {{{
let g:linuxsty_patterns=["~/code/eudyptula"]
" }}}
" {{{ Vaffle Plugin config
nnoremap - :execute 'Vaffle ' . ((strlen(bufname('')) == 0) ? '.' : '%:h')<CR>
" }}}
" Lightline plugin config {{{
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'bufnum', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightlineFugitive',
            \   'readonly': 'LightlineReadonly',
            \ },
            \ 'component': {
            \ 'modified': '%m',
            \ }
            \}
let g:lightline.colorscheme = 'onedark'
let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'V-L',
            \ "\<C-v>": 'V-B',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S-L',
            \ "\<C-s>": 'S-B',
            \ 't': 'T',
            \ }

let g:lightline.subseparator = { 'left': '', 'right': '' }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
"function! LightlineFugitive()
    "if exists('*fugitive#head')
        "let branch = fugitive#head()
        "return branch !=# '' ? ''.branch : ''
    "endif
    "return ''
"endfunction
function! LightlineFugitive()
    if exists('*fugitive#statusline')
        return fugitive#statusline()
    endif
    return ''
endfunction
"}}}
"FSwitch plugin config {{{
nnoremap <F4> :FSHere<cr>
"}}}
" Autogroups {{{
augroup config_filetype
    autocmd!
    autocmd FileType Makefile setlocal noexpandtab
    autocmd FileType xml setlocal foldmethod=syntax
augroup END
augroup vaffle_plugin
    autocmd!
    autocmd FileType vaffle nnoremap ~ :Vaffle ~<cr>
    autocmd FileType vaffle nnoremap 1 :Vaffle ~/code/micro/arm/projects/<cr>
    autocmd FileType vaffle nnoremap 2 :Vaffle ~/code/micro/avr/<cr>
    autocmd FileType vaffle nnoremap 3 :Vaffle ~/code/desktop/<cr>
augroup END
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END
augroup golang
    autocmd!
    autocmd FileType go nnoremap <buffer> <F9> :GoBuild<cr>
    autocmd FileType go nnoremap <buffer> <F10> :GoRun<cr>
augroup END
" }}}
"  Abbréviations {{{
" }}}
"  Colorscheme {{{
" Certain colorscheme en ont besoin
set background=dark
colorscheme molokai
" Pas de colonne en couleur pour la ligne de séparation verticale
highlight VertSplit ctermbg=NONE guibg=#0d0d0d
" Commentaire en italics
"highlight Comment gui=italic
highlight Folded guibg=#111111
" }}}
" Functions {{{
" Recheche un fichier de config lconfig.vim et charge le si trouvé
function! FindLocalVimrc()
    let s:afile = findfile("lconfig.vim", expand("%:p:h") . ";~")
    if s:afile != ""
        execute "source " s:afile
        echo "File " . s:afile . "loaded"
    else
        echo "No local lconfig.vim found"
    endif
endfunction
" }}}
" En diff mode:
" [c    : go to start of previous change
" ]c    : go to start of next change
" :diffput  : put the change under the cursor to the other file
" :diffget  : la même chose mais inversé

" <action><n>i{    : fait n fois l'action sur l'ensemble des lignes dans le block { }
" <action><n>a{    : même chose mais inclut les accolades. (marche aussi avec les parentheses, crochets...)

" D : delete from cursor to end of line
" C : like D but go in insert mode after
" <c-g> : affichage du chemin complet du ficher
" ga : affichage du caractères sous le curseur
" [[ : go to previous function in C
" ]] : go to next function in C
" X<c-^> : go to buffer X


"<c-o> trigger single command mode
"K : help on word under cursor
"
nohlsearch

" Recherche un fichier de config local
nnoremap <leader>f :call FindLocalVimrc()<cr>

" vim:foldmethod=marker:foldlevel=0
