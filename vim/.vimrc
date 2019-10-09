set nocompatible
filetype off

" ================ Turn Off Swap Files ==============
set number
set noswapfile
set nobackup
set nowb
set encoding=UTF-8
color desert
set cursorline

" Backspace
set backspace=indent,eol,start

" New line without entering in insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Make Ctrl + [ work as the ESC key
nmap <ctrl+[> <Esc>

"Scroll offset
set scrolloff=5

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'miyakogi/conoline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dominikduda/vim_current_word'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'prettier/vim-prettier'
Plugin 'styled-components/vim-styled-components'

call vundle#end()
filetype plugin indent on

syntax on

"Nerdtree
map <C-n> :NERDTreeToggle<CR>
"nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']
"let NERDTreeDirArrowExpandable='+'
"let NERDTreeDirArrowCollapsible='~'
let NERDTreeQuitOnOpen = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_dont_split = 'NERD_tree_2'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Remove trailing whitespace on save for  the specified files.
au FileType c,cpp,java,php,ruby,python,rb,coffee,javascript,html,css,scss,erb,haml au BufWritePre <buffer> :%s/\s\+$//e

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
"nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" vim-go
let g:go_fmt_command = "goimports"

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

