set nocompatible

filetype off


let g:plug_url_format = 'git@github.com:%s.git'

"Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript',   { 'for': 'javascript' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'lukas-reineke/indent-blankline.nvim'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'
Plug 'github/copilot.vim'

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
"------------------------ One Dark Theme ------------------------
Plug 'joshdick/onedark.vim'

Plug 'udalov/kotlin-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'zivyangll/git-blame.vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
call plug#end()

unlet g:plug_url_format

filetype plugin indent on

autocmd FileType json let g:indentLine_enabled=0
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" == AUTOCMD END ================================

" GENERAL
syntax enable
set noswapfile
set nobackup
set shortmess+=c
set number
set history=100
set colorcolumn=120
set encoding=UTF-8
set clipboard^=unnamed
set backspace=indent,eol,start
set foldmethod=syntax
" set foldlevelstart=99
set foldlevel=4
" set foldmethod=indent
set nofoldenable

set scrolloff=8
set guifont=monospace
set nobk
set autoindent
set lazyredraw
set termguicolors
set background=dark
set t_Co=256
set tabstop=2 shiftwidth=2 expandtab
set hlsearch
set showmatch
set hidden

syntax on

colorscheme onedark
""""""""

highlight ColorColumn guibg=#6e6f6f

"MAPPINGS
let mapleader=","
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <c-p> :Files<CR>
nmap <c-l> :Buffers<CR>
nmap <c-f> :Rg<space>
nmap <ctrl+[> <Esc>
nmap <space><space> :e#<CR>
nnoremap <silent> <leader>e $<CR>
nmap <leader>ww <c-w><c-w>
inoremap <C-c> <ESC>
nnoremap <silent> <leader>b :<C-u>call gitblame#echo()<CR>
nnoremap <leader>s :update<cr>
inoremap <leader>s <Esc>:update<cr>gi

" Tabs
"
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

""" Coc  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Rust
let g:rustfmt_autosave = 1

""" Golang
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

""" Lightline
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"""


"{{{ TAGBAR
let g:tagbar_foldlevel = 0
nmap ,. :TagbarToggle<CR><C-w><C-w>

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

"}}}

" cursorline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#404040 ctermbg=234

""""


"NERDTREE
map <C-n> :call MyNerdToggle()<CR>
" Start NERDTree automatically when vim starts up if no files were specified.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Sync tree
"autocmd BufWinEnter * NERDTreeFind

let NERDTreeQuitOnOpen = 0
let NERDTreeIgnore=['\~$', '\.git$', '.DS_Store']
let NERDTreeShowHidden=1
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
" Re Map keys
let NERDTreeMapPreview='p'

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

function MyNerdToggle()
  if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction
""""""""

"FZF
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader><tab> <plug>(fzf-maps-n)

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
""""""""

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Files + devicons + floating fzf
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}" --exclude "!{node_modules/*,.git/*}"'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m --reverse ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': 'call CreateCenteredFloatingWindow()'})

endfunction

" Relative numbers
set relativenumber
nnoremap <leader>nt :call NumberToggle()<cr>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc



" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

