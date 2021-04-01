call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set nocompatible
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set foldmethod=indent
set foldlevel=20
set number
set expandtab
set tags=./tags;/
set cdpath=/Users/rick,/Users/rick/projects,/Volumes
set encoding=utf-8
set fileencoding=utf-8
set wildignore+=node_modules
set nohlsearch
let mapleader=","
syntax enable
set background=dark
filetype plugin indent on

colorscheme solarized
set t_Co=256
" highlight ColorColumn guibg=#859900 ctermbg=254
" set colorcolumn=100

let g:solarized_termcolors=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0

let g:AutoPairsMultilineClose = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

function ToggleWidth()
    if &tabstop == 2
        set tabstop=4
        set shiftwidth=4
    else
        set tabstop=2
        set shiftwidth=2
    endif
endfunction
function RenameToken()
    gD
    :%s///gc<left><left><left>
endfunction


" Custom shortcuts
imap <C-c> <Esc>
nmap <Leader>n :NERDTreeFocus<cr>
nmap <Leader>N :NERDTreeFind<cr>
nmap <Leader>. :call ToggleWidth()<cr>
nmap <Leader>h :nohl<cr>
nmap <Leader>w :w<cr>
nmap <Leader>c :q<cr>
nmap <Leader>z ZZ
nmap <Leader>d yyp
nnoremap <C-n> :set invrnu<cr>
nnoremap j gj
nnoremap k gk
nmap <C-s> :w<cr>
nmap <Leader>/ :set invhlsearch<cr>
nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>s :Rg <cword><CR>

"
" COC config
"
" Install extensions
let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-eslint', 'coc-yaml', 'coc-vetur', 'coc-tsserver', 'coc-css']

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nmap <Leader>p :Format<Cr>
