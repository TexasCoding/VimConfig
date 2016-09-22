set nocompatible
filetype off

syntax enable
set backspace=indent,eol,start
let mapleader = ','
set number
set autowriteall
set complete=.,w,b,u

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4


let NERDTreeShowHidden=1

so ~/.vim/plugins.vim



"/ CtrlP
let g:ctrlp_custom_ignore = 'node_modules\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/ NerdTree
let NERDTreeHijackNetrw = 0


"/ Greplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'



let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>



"----- VISUALS ----"
colorscheme atom-dark
set t_CO=256
set guifont=Fira\ Code\ 13
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

highlight LineNr guibg=bg




"---- GUI OPTIONS -----"
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=e



"------ Searhing  -------"
set hlsearch
set incsearch




"------  SPLIT MANAGEMENT -------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"------ MAPPINGS -------"
"--imap ff <esc> 
nmap <Leader>ev :tabedit $MYVIMRC<cr>

nmap <Leader>es :e ~/.vim/snippets/

nmap <Leader>ep :e ~/.vim/plugins.vim


nmap <Leader>f :tag<space>
nmap <Leader><space> :nohlsearch<cr>
nmap <C-O> :NERDTreeToggle<cr>
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>

"/cs-fixer
let g:php_cs_fixer_path = "~/php-cs-fixer.phar"
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"----- AUTO COMMANDS -----"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
