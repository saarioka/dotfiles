syntax enable

set guicursor=
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set laststatus=2
set showcmd
set signcolumn=yes
set nocompatible " vim-polyglot
set updatetime=250 " mostly for gitgutter
set clipboard=unnamedplus " make clipboard same as system's

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
"Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter' " left status bar
Plug 'vim-airline/vim-airline' " bottom status bar

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" colorscheme plugins
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'

call plug#end()

" colorscheme settings
set background=dark
colorscheme gruvbox
highlight clear SignColumn

" git gutter marker colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" SignColumn appearence
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

"if executable('rg')
"    let g:rg_derive_root='true'
"endif

let mapleader = " "

" https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:gitgutter_map_keys = 0 " gitgutter is only used for status bar on the left

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" fzf
"nnoremap <Leader>df :Files<CR>
"nnoremap <Leader>gg :GFiles<CR>

" resize windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" ability to move code blocks in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" NVIM console mode
tnoremap <Esc> <C-\><C-n>

" plugin: NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" plugin: undotree
nnoremap <leader>u :UndotreeShow<CR>

" plugin: RipGrep
"nnoremap <Leader>rg :Rg<CR>

" plugin: COC
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gt <Plug>(coc-type-definition)
"nmap <leader>gi <Plug>(coc-implementation)
"nmap <leader>gr <Plug>(coc-references)
"nmap <leader>rr <Plug>(coc-rename)
"nmap <leader>g[ <Plug>(coc-diagnostic-prev)
"nmap <leader>g] <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
"nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
"nnoremap <leader>cr :CocRestart<CR>

"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()

" navigate suggestions
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <cr> to confirm suggestion
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" plug: vim fugitive
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gdf :Gdiff<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gp :Git push<CR>
set diffopt+=vertical " diff split is vertical instead of horizontal

" automatic whitespace trimming
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

