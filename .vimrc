if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute "! curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.config/nvim/plugged")

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/tagbar'
    nmap <F8> :TagbarToggle<CR>
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
    noremap <C-n> :NERDTreeToggle<CR>
Plug 'mbbill/undotree'
    nnoremap <F5> :UndotreeToggle<CR>
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    noremap <C-p> :FZF<CR>
    nnoremap <silent> <Leader>b :Buffers<CR>
    nnoremap <silent> <Leader>f :Rg<CR>
    nnoremap <silent> <Leader>g :Commits<CR>
    nnoremap <silent> <Leader>j :History<CR>
    nnoremap <silent> <Leader>t :Tags<CR>
    let g:fzf_tags_command = 'git ls-files | ctags --links=no -L- '
Plug 'itchyny/lightline.vim'
Plug 'villainy/murmur-lightline'
    let g:lightline = { 'colorscheme': 'murmur' }
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
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'antoinemadec/coc-fzf'
    nnoremap <silent> <Leader>e :<C-u>CocFzfList diagnostics<CR>
    nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>

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
set inccommand=split
" set clipboard+=unnamed
" map <Leader>y "*y
" map <Leader>p "*p
call plug#end()

" autocmd VimEnter * TSInstall python

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = false,
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = {"python"},
    },
}
EOF
