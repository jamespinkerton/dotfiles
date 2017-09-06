let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vim_folder . "/plugged")
    Plug 'flazz/vim-colorschemes'
    Plug 'tomtom/tcomment_vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        map <C-p> :FZF<CR>
        let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        map <C-n> :NERDTreeToggle<CR>
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
    Plug 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = "<C-n>"
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'rust-lang/rust.vim'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " Plug 'majutsushi/tagbar'
    "     nmap <F9> :TagbarToggle<CR>
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'junegunn/vim-easy-align'
    " Plug 'junegunn/vim-github-dashboard'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
    " Plug 'tpope/vim-surround'
    " Plug 'terryma/vim-multiple-cursors'
    "    let g:multi_cursor_start_key='<C-b>'
    " Plug 'ctrlpvim/ctrlp.vim'
    "     let g:ctrlp_custom_ignore = { 'dir' : 'c/obj/*\|/home/jamesp/lustre\|/home/jamesp/libraries/neovim' }

    if !has('nvim')
        Plug 'davidhalter/jedi-vim'
        Plug 'Rip-Rip/clang_complete'
            let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
            let g:deoplete#sources#clang#clang_header
            let g:clang_complete_auto = 0
            let g:clang_auto_select = 0
            let g:clang_omnicppcomplete_compliance = 0
            let g:clang_make_default_keymappings = 0
            let g:clang_use_library = 1
            " function! BuildYCM(info)
                " if a:info.status == 'installed' || a:info.force
                "     execute "export PATH=/usr/bin/:$PATH"
                "     !./install.py
                "     execute "export PATH=/home/jamesp/.conda/envs/modeling/bin/:$PATH"
                " endif
            " endfunction
            " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
            " Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
            "
    endif

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            let g:deoplete#enable_at_startup = 1
        Plug 'zchee/deoplete-jedi'
        Plug 'tweekmonster/deoplete-clang2'
        " Plug 'zchee/deoplete-clang'
        "     let g:deoplete#sources#clang#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
        "     let g:deoplete#sources#clang#clang_header='/usr/lib/clang/3.8.1/include'
        Plug 'sebastianmarkow/deoplete-rust'
        Plug 'benekastah/neomake'
            let g:neomake_python_enabled_makers = ['pyflakes']
            let g:neomake_yaml_enabled_makers = ['yamllint']
    endif
call plug#end()

set clipboard=unnamed " Maybe turn this off in nvim
set background=dark
set mouse=
set noshowmode
inoremap <C-z> <esc><C-z>
syntax on
set t_Co=256
set nocompatible
set hlsearch
if has('nvim')
    set inccommand=split
endif
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Always display the status line, even if only one window is displayed
set laststatus=2
set hidden
" Show partial commands in the last line of the screen
set showcmd
" Better command-line completion
set wildmenu
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" Keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Stop certain movements from always going to the first character of a line.
set nostartofline
" Display the cursor position on the last line of the screen
set ruler
"" Raise dialong instead of failing a command because of unsaved changes
set confirm
" Use visual bell instead of beeping when doing something wrong
set visualbell
set t_vb=
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
map Y y$
set tabstop=4 shiftwidth=4
autocmd Filetype c setlocal tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal tabstop=2 shiftwidth=2
autocmd Filetype h setlocal tabstop=2 shiftwidth=2
autocmd Filetype hpp setlocal tabstop=2 shiftwidth=2
autocmd Filetype py setlocal tabstop=4 shiftwidth=4
autocmd Filetype nim setlocal tabstop=2 shiftwidth=2
set expandtab
