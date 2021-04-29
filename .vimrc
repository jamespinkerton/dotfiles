let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vim_folder . "/plugged")
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
    map <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeHijackNetrw=1
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    map <C-p> :FZF<CR>
    " map <C-p> :FzfPreviewGitFilesRpc<CR>
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'itchyny/lightline.vim'
Plug 'villainy/murmur-lightline'
let g:lightline = { 'colorscheme': 'murmur' }
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
    highlight! link SignColumn LineNr
    let g:gitgutter_set_sign_backgrounds = 1
    highlight GitGutterAdd guifg=#009900 ctermfg=2
    highlight GitGutterChange guifg=#bbbb00 ctermfg=3
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1
    autocmd BufWritePost * GitGutter
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<C-n>"
Plug 'metakirby5/codi.vim'
Plug 'dense-analysis/ale'
    let b:ale_fixers = {'python': ['black']}
    let g:ale_linters = {'python': ['mypy', 'pyflakes']}
    let g:ale_linters_explicit = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    let g:airline#extensions#ale#enabled = 1
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    nmap <leader>rn <Plug>(coc-rename)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction
call plug#end()

if has('nvim')
    set inccommand=split
    " set termguicolors
endif
set noshowmode
syntax on
set t_Co=256
set nocompatible
set hlsearch
set backspace=indent,eol,start
set ruler
set wildmenu
set autoindent
set smarttab
filetype indent plugin on
set notimeout ttimeout ttimeoutlen=200
set showcmd
inoremap <C-z> <esc><C-z>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
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
filetype plugin on
set clipboard+=unnamed
map <Leader>y "*y
map <Leader>p "*p
