set nocompatible
filetype off

"Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails',           { 'for': 'ruby' }
Plug 'fatih/vim-go',              { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'dense-analysis/ale'
Plug 'tveskag/nvim-blame-line'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
call plug#end()


filetype plugin indent on

" GENERAL
syntax enable
set noswapfile
set nobackup
set shortmess+=c
set number
set history=100
set encoding=UTF-8
set clipboard^=unnamed
set backspace=indent,eol,start
setlocal foldmethod=indent
set scrolloff=5
set guifont=monospace
set nobk
set autoindent
set lazyredraw
set termguicolors
set background=dark
set t_Co=256
set tabstop=2
set shiftwidth=2
set cursorline
set hlsearch
set showmatch
set hidden
""""""""

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
nnoremap <esc> :noh<return><esc>
inoremap <C-c> <ESC>
nnoremap <silent> <leader>b :ToggleBlameLine<CR>
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"nmap <c-l> :ls<CR>
""""""""

" {{{ NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" }}}

"{{{ TAGBAR
let g:tagbar_foldlevel = 0
nmap ,. :TagbarToggle<CR><C-w><C-w>
"}}}

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
"let NERDTreeMapActivateNode='o'

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

" Ale
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#FFA500


" ALE
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['prettier'],
            \'css' : ['prettier'],
            \'html' : ['prettier'],
            \'markdown' : ['prettier'],
            \ 'go': ['goimports'],
            \ 'rust': ['rustfmt'],
            \'yaml': ['prettier'],
            \'json': ['prettier'],
            \}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✘'
let g:ale_sign_info = ''
let g:ale_completion_enabled = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_go_gometalinter_options = '--fast'
let g:ale_lint_on_enter = 1
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'go': ['vet', 'errcheck', 'lint'],
      \}
""""""""

"LIGHTLINE
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
set laststatus=2
set noshowmode
""""""""

"{{{ GO
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
"}}}

"{{{ FUGITIVE
"set diffopt+=vertical
"}}}

"FZF
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader><tab> <plug>(fzf-maps-n)

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files
 \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
""""""""


" {{{ LanguageClient
" let g:LanguageClient_loggingFile = '~/Desktop/lcn.log'
" let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_hoverPreview = 'always'
let g:LanguageClient_completionPreferTextEdit = 0
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'rust': ['ra_lsp_server'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
noremap <leader>ca :call LanguageClient#textDocument_codeAction()<CR>
command Action :call LanguageClient#textDocument_codeAction()<CR>
" }}}

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
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}"'
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
nnoremap <leader>nt :call NumberToggle()<cr>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
