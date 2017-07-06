let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif
set expandtab
set clipboard=unnamed
if ! has('nvim')
    set clipboard=unnamed
endif
set tabstop=4 shiftwidth=4
autocmd Filetype c setlocal tabstop=2 shiftwidth=2
autocmd Filetype h setlocal tabstop=2 shiftwidth=2
autocmd Filetype nim setlocal tabstop=2 shiftwidth=2

set mouse=
set noshowmode
inoremap <C-z> <esc><C-z>
syntax on
set t_Co=256
set nocompatible
set hlsearch
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Always display the status line, even if only one window is displayed
set laststatus=2
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
"" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
 
"------------------------------------------------------------

call plug#begin(vim_folder . "/plugged")
    Plug 'flazz/vim-colorschemes'
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
    " Plug 'ctrlpvim/ctrlp.vim'
    "     let g:ctrlp_custom_ignore = { 'dir' : 'c/obj/*\|/home/jamesp/lustre\|/home/jamesp/libraries/neovim' }
    " Plug 'davidhalter/jedi-vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        map <C-p> :FZF<CR>
    " Plug 'majutsushi/tagbar'
    "     nmap <F9> :TagbarToggle<CR>
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'tpope/vim-surround'
    " Plug 'terryma/vim-multiple-cursors'
    "    let g:multi_cursor_start_key='<C-b>'

    " function! BuildYCM(info)
        " if a:info.status == 'installed' || a:info.force
        "     execute "export PATH=/usr/bin/:$PATH"
        "     !./install.py
        "     execute "export PATH=/home/jamesp/.conda/envs/modeling/bin/:$PATH"
        " endif
    " endfunction
    " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

    if has('nvim')
        Plug 'Shougo/deoplete.nvim'
            let g:deoplete#enable_at_startup = 1
            let g:python3_host_prog = '/home/jamesp/.conda/envs/modeling/bin/python3'
        Plug 'zchee/deoplete-jedi'
        " Plug 'zchee/deoplete-clang'
        Plug 'benekastah/neomake'
            let g:neomake_python_enabled_makers = ['pyflakes']
            let g:neomake_yaml_enabled_makers = ['yamllint']
    endif
call plug#end()
