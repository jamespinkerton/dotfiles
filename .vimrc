" TODO:
" vim clang complete

let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vim_folder . "/plugged")

Plug 'flazz/vim-colorschemes'
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    map <C-p> :FZF<CR>
    " let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    " --files: List files that would be searched but do not search
    " --no-ignore: Do not respect .gitignore, etc...
    " --hidden: Search hidden files and folders
    " --follow: Follow symlinks
    " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
    map <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeHijackNetrw=1
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
    set encoding=utf-8
    set laststatus=2
    set ttimeoutlen=50
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#tab_min_count = 2
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='murmur'
" Plug 'ervandew/supertab'
"     let g:SuperTabDefaultCompletionType = "<C-n>"
Plug 'rust-lang/rust.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

" Plug 'lyuts/vim-rtags'
" Plug 'hdima/python-syntax'
" Plug 'junegunn/vim-github-dashboard' " Not working
" Plug 'majutsushi/tagbar'
"     nmap <F9> :TagbarToggle<CR>
" Plug 'ryanoasis/vim-devicons'
" Plug 'easymotion/vim-easymotion'
" Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/vim-github-dashboard'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'terryma/vim-multiple-cursors'
"    let g:multi_cursor_start_key='<C-b>'
" Plug 'ctrlpvim/ctrlp.vim' " Alternative to FZF
"     let g:ctrlp_custom_ignore = { 'dir' : 'c/obj/*\|/home/jamesp/lustre\|/home/jamesp/libraries/neovim' }
" Plug 'bbchung/clighter' " Alternative to chromatica
"     let g:clighter_libclang_file = '/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
" Plug 'python-mode/python-mode' " Too slow

if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "     let g:deoplete#enable_at_startup = 1
    " Plug 'zchee/deoplete-jedi'


    " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-pyclang'

        " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

    " Plug 'zchee/deoplete-clang'
    "     let g:deoplete#sources#clang#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
    "     let g:deoplete#sources#clang#clang_header='/usr/lib/clang/3.8.1/include'
    " Plug 'tweekmonster/deoplete-clang2', { 'on': [] }
    " Plug 'sebastianmarkow/deoplete-rust', { 'on': [] }
    " Plug 'Shougo/neoinclude.vim'

    " Plug 'benekastah/neomake'
    " Plug 'benekastah/neomake', { 'on': ['Neomake'] }
        " let g:neomake_python_enabled_makers = ['pyflakes']
        " let g:neomake_yaml_enabled_makers = ['yamllint']
    " Plug 'arakashic/chromatica.nvim'
    "     let g:chromatica#enable_at_startup=1
    "     let g:chromatica#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
    " Plug 'autozimu/LanguageClient-neovim'
    "     let g:LanguageClient_autoStart = 1
    set inccommand=split
    set termguicolors
endif

if !has('nvim')
    " Plug 'davidhalter/jedi-vim'
    " Plug 'uplus/vim-clang-rename' " not working
    "     let g:clang_rename#command='/usr/bin/clang-rename-3.8'
    set noshowmode
    syntax on
    set t_Co=256
    set nocompatible
    set hlsearch
    " Allow backspacing over autoindent, line breaks and start of insert action
    set backspace=indent,eol,start
    " Display the cursor position on the last line of the screen
    set ruler
    " Better command-line completion
    set wildmenu
    " Keep the same indent as the line you're currently on. Useful for READMEs, etc.
    set autoindent
    set smarttab
    filetype indent plugin on
    " Quickly time out on keycodes, but never time out on mappings
    set notimeout ttimeout ttimeoutlen=200
    " Show partial commands in the last line of the screen
    set showcmd
endif

" colorscheme NeoSolarized
" set clipboard+=unnamed
" set colorcolumn=80
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$\|\t/
inoremap <C-z> <esc><C-z>
set background=dark
set ignorecase smartcase
set visualbell t_vb=
set nostartofline
set hidden
set confirm

set expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal tabstop=2 shiftwidth=2
autocmd Filetype h setlocal tabstop=2 shiftwidth=2
autocmd Filetype hpp setlocal tabstop=2 shiftwidth=2
autocmd Filetype nim setlocal tabstop=2 shiftwidth=2
filetype plugin on

so ~/.config/nvim/opti.vim

let g:python2_host_prog = expand("~") . "/.miniconda3/bin/python2"
let g:python3_host_prog = expand("~") . "/.miniconda3/bin/python3"

call plug#end()
