set number
set cursorline
set clipboard=unnamedplus
set virtualedit=block
set noswapfile
set incsearch
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

let mapleader = "\<Space>"

filetype off

inoremap <silent> jj <ESC>
nnoremap <C-S-s> :wa!<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'vim-jp/vimdoc-ja'
Plug 'machakann/vim-sandwich' " テキストを囲める: ex)saiw}
Plug 'simeji/winresizer'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc' " vim-sessionが依存
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" Coc
source $HOME/.config/nvim/plug-config/coc.vim

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Nerdtree
nnoremap <silent> <A-p> :NERDTreeToggle<CR>

" rust
" 保存時に自動でrustfmtする
let g:rustfmt_autosave = 1
let g:rustfmt_emit_fies = 1
let g:rustfmt_fail_silently = 0

" バッファの削除
nnoremap <C-BS> :bd<CR>
" ハイライトを消す
nnoremap <ESC> :noh<CR>

" 画面分割
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
" ウィンドウ削除
nnoremap <leader>wq :<C-w>q<CR>
" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ウィンドウのリサイズ
let g:winresizer_start_key = '<C-w><C-w>'

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" ターミナル
let g:neoterm_default_mod='belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1

nnoremap <A-t> :Ttoggle<CR>
tnoremap <A-t> <C-\><C-n>:Ttoggle<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-v> <C-\><C-n>pA

" 候補選択時に改行をしない
set completeopt=menuone,noinsert

" Neovide
if exists("g:neovide")
set guifont=HackGen:h11.5
let g:neovide_fullscreen=v:true
let g:neovide_refresh_rate = 144
let g:neovide_transparency=0.9725

let g:neovide_scroll_animation_length=0.5
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_size=0.4
let g:neovide_cursor_antialiasing = v:true

let g:neovide_cursor_vfx_mode="wireframe"
let g:neovide_cursor_vfx_particle_density=50.0
let g:neovide_cursor_vfx_particle_speed=10.0
let g:neovide_cursor_vfx_mode=1.5
let g:neovide_cursor_vfx_particle_phase=30.0
let g:neovide_cursor_vfx_particle_curl=0.25
endif

" Telecsope - files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
" Telecsope - git
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>
nnoremap <leader>gst <cmd>Telescope git_stash<CR>
nnoremap <leader>gss <cmd>Telescope git_status<CR>
" Telescope - vim
nnoremap <leader>cs <cmd>Telescope colorscheme<CR>

syntax enable
colorscheme desert
