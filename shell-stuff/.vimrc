" Set up colors and highlighting
syntax on " syntax highlighting
set cursorline " cursor highlighting
set hlsearch " search results highlighting

if has('gui_running')
    set background=light
else
    set background=dark
endif

" Always show the status line
set laststatus=2

" Source ~/.vimrc file after saving it - this way you don't have to reload vim to see the changes
if has('autocmd')
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

" Switch paste mode and show current mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Custom menu allowing re-open current file with different encodings
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
map <F8> :emenu Encoding.<TAB>
