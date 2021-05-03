let vim_folder = has('nvim') ? "~/.config/nvim/" : "~/.vim/"
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vim_folder . "/plugged")
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
    noremap <C-n> :NERDTreeToggle<CR>
Plug 'tomtom/tcomment_vim'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': './install --all' }
    noremap <C-p> :FZF<CR>
    nnoremap <silent> <Leader>b :Buffers<CR>
    nnoremap <silent> <Leader>f :Rg<CR>
Plug 'junegunn/fzf.vim'
Plug 'bfredl/nvim-ipy'
" Plug 'ivanov/vim-ipython'
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
if !has('nvim')
    Plug 'noahfrederick/vim-neovim-defaults'
endif
call plug#end()

if has('nvim')
    set inccommand=split
    " :tnoremap <Esc> <C-\><C-n>
    " autocmd TermOpen term://* startinsert
    " set termguicolors
    " set clipboard+=unnamed
    " map <Leader>y "*y
    " map <Leader>p "*p
endif

" set hidden
set t_Co=256
filetype indent plugin on
set notimeout ttimeout ttimeoutlen=200
inoremap <C-z> <esc><C-z>
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>
set ignorecase smartcase
set visualbell t_vb=
set confirm
set expandtab tabstop=4 shiftwidth=4
filetype plugin on
