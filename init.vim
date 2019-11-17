call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'dgraham/vim-eslint'
Plug 'sheerun/vim-polyglot'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()

set nocompatible
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set foldmethod=indent
set foldlevel=20
set nu
set et
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

" CoC specific
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

colorscheme solarized
set t_Co=256
" highlight ColorColumn guibg=#859900 ctermbg=254
" set colorcolumn=100

let g:solarized_termcolors=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}
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

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Leader>p :ALEFix<cr>
