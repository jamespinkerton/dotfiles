tnoremap <C-h><C-h> <C-\><C-n>
autocmd TermOpen * startinsert

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

set mouse=

if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute "! curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.config/nvim/plugged")
Plug 'easymotion/vim-easymotion'
    " map <Leader> <Plug>(easymotion-prefix)
    " <Leader>f{char} to move to {char}
    " map  <Leader>f <Plug>(easymotion-bd-f)
    " nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    " nmap s <Plug>(easymotion-overwin-f2)
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
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
" Plug 'ervandew/supertab'
"     let g:SuperTabDefaultCompletionType = "<C-n>"
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'antoinemadec/coc-fzf'
    nnoremap <silent> <Leader>e :<C-u>CocFzfList diagnostics<CR>
    nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>

" set t_Co=256
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
map <leader>vm :vsp ~/.vimrc<CR>
call plug#end()

autocmd FileType python CocEnable

" autocmd VimEnter * TSInstall python

" **********************************************
" *************    COC SETTINGS    *************
" **********************************************

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use K to show documentation in preview window.
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

" autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


" **********************************************
" *************    LUA *************
" **********************************************

" lua <<EOF
" -- local set = vim.opt
"
" -- Set the behavior of tab
"
" -- set.t_Co = 256
" -- set.tabstop = 4
" -- set.confirm = true
" -- set.shiftwidth = 4
" -- set.expandtab = true
" -- set.inccommand = "split"
" -- set.ignorecase = true
" -- set.smartcase = true
"
" -- require'nvim-treesitter.configs'.setup {
" --     ensure_installed = "maintained",
" --     sync_install = false,
" --     highlight = {
" --         enable = true,
" --         disable = {},
" --         additional_vim_regex_highlighting = {"python"},
" --     },
" -- }
" EOF
