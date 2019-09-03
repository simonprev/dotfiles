" Define the leader key
" ----------------------------------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

" Misc. options
" ----------------------------------------------------------------------------------------------------
set nu
set ts=2 " A tab = 4 spaces
set sw=2 " Shift width
set et " Use spaces instead of tabs
set sts=2 " Short tab stop
set isk+=- " Treat “-” like a word separator (for auto-completion!)
set isk+=? " Treat “?” like a word separator (for auto-completion!)
set isk+=! " Treat “!” like a word separator (for auto-completion!)
set shell=fish
set clipboard=unnamed " Make sure we can copy-paste into the system clipboard
set termguicolors

" netrw
" ----------------------------------------------------------------------------------------------------
let g:netrw_fastbrowse = 0

" No automatic word-wrap!
" ----------------------------------------------------------------------------------------------------
set sidescrolloff=14
set nowrap
set sidescroll=4
set listchars=precedes:←,extends:→,nbsp:◊,trail:⠿,eol:\ ,tab:●·
set list

" Clear search-highlighted terms
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Locale
" ----------------------------------------------------------------------------------------------------
let $LC_ALL = "fr_CA.UTF-8"

" Easy line moving
" ----------------------------------------------------------------------------------------------------
nnoremap <silent> <C-k>   :move-2<CR>==
nnoremap <silent> <C-j> :move+<CR>==
xnoremap <silent> <C-k>   :move-2<CR>gv=gv
xnoremap <silent> <C-j> :move'>+<CR>gv=gv

" Easy indentation in visual mode
" ----------------------------------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv|
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap <Tab> mzV>`zl
nnoremap <S-Tab> mzV<`zh

" Change the working directory to the current file directory
" ----------------------------------------------------------------------------------------------------
nmap èè :lcd %:p:h<CR>

" Disable ex mode, damnit
" ----------------------------------------------------------------------------------------------------
nmap Q :echo "Ex mode is disabled."<cr>

" Disable arrow keys
" ----------------------------------------------------------------------------------------------------
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" Easy save and close buffer
" ----------------------------------------------------------------------------------------------------
noremap <Leader>d :bd<CR>
noremap <Leader>D :bd!<CR>
noremap <Leader>w :w<CR>

" Plugged settings
" ----------------------------------------------------------------------------------------------------
let g:plug_window = 'topleft new'

" YankRing
" ----------------------------------------------------------------------------------------------------
let g:yankring_history_dir = expand('$HOME').'/.vim-local'
let g:yankring_history_file = '.vim-yankring'
let g:yankring_clipboard_monitor=0

map <Leader>y :YRShow<CR>

autocmd BufEnter \[YankRing\] set scrolloff=0 cursorline
autocmd BufLeave \[YankRing\] set scrolloff=4 nocursorline

" Plugs
" ----------------------------------------------------------------------------------------------------
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-scripts/YankRing.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'JakeBecker/elixir-ls'

Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/mru'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'

call plug#end()

let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
colorscheme onedark

" vim-airline
let g:airline_theme='onedark'

" vim-startify
let g:startify_custom_header = []

" CoC
" ----------------------------------------------------------------------------------------------------
"
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" FZF mappings
map <Leader>f :Rg<CR>
map <Leader>p :GFiles<CR>
map <Leader>o :Files<CR>
map <Leader>, :Buffers<CR>
map <Leader>m :MRU<CR>
map <Leader>l :Lines<CR>
