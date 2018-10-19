let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vim_folder . "/plugged")

Plug 'flazz/vim-colorschemes'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    map <C-p> :FZF<CR>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
    map <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeHijackNetrw=1
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
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
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
" Plug 'uplus/vim-clang-rename' " not working
"     let g:clang_rename#command='/usr/bin/clang-rename-3.8'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-surround'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'icymind/NeoSolarized'
" Plug 'mhartington/oceanic-next'
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}

if has('nvim')
    " *** Begin ncm2 ***
    Plug 'ncm2/ncm2', { 'do': ':UpdateRemotePlugins' }
    Plug 'roxma/nvim-yarp'
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
    " Wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-pyclang'
    Plug 'ncm2/ncm2-racer'
    Plug 'ncm2/ncm2-vim'
    " Plug 'yuki-ycino/ncm2-dictionary'
    Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'

    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
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
    " *** End ncm2 ***

    " based on snipmate
    Plug 'ncm2/ncm2-snipmate'
    " snipmate dependencies
    Plug 'tomtom/tlib_vim'
    Plug 'marcweber/vim-addon-mw-utils'
    Plug 'garbas/vim-snipmate'
    " Press enter key to trigger snippet expansion
    " The parameters are the same as `:help feedkeys()`
    inoremap <silent> <expr> <CR> ncm2_snipmate#expand_or("\<CR>", 'n')
    " wrap <Plug>snipMateTrigger so that it works for both completin and normal
    " snippet
    " inoremap <expr> <c-u> ncm2_snipmate#expand_or("\<Plug>snipMateTrigger", "m")
    " c-j c-k for moving in snippet
    let g:snips_no_mappings = 1
    vmap <c-j> <Plug>snipMateNextOrTrigger
    vmap <c-k> <Plug>snipMateBack
    imap <expr> <c-k> pumvisible() ? "\<c-y>\<Plug>snipMateBack" : "\<Plug>snipMateBack"
    imap <expr> <c-j> pumvisible() ? "\<c-y>\<Plug>snipMateNextOrTrigger" : "\<Plug>snipMateNextOrTrigger"

    Plug 'benekastah/neomake'
        let g:neomake_python_enabled_makers = ['pyflakes']
        let g:neomake_yaml_enabled_makers = ['yamllint']

    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
    " set hidden
    " let g:LanguageClient_serverCommands = {
    "     \ 'python': ["pyls"],
    " \ }
    " nnoremap <F5> :call LanguageClient_contextMenu()<CR>

    " Plug 'arakashic/chromatica.nvim'
    "     let g:chromatica#enable_at_startup=1
    "     let g:chromatica#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'

    set inccommand=split
    set termguicolors
endif

if !has('nvim')
    Plug 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = "<C-n>"
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

" set clipboard+=unnamed
" set colorcolumn=90
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
" call neomake#configure#automake('nw', 1000)
