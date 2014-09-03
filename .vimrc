" This must be the first so other commands are properly affected
set nocompatible

" Меню для выбора кодировок
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r 		:e ++enc=8bit-koi8-r<CR>
menu Encoding.windows-1251 	:e ++enc=8bit-cp1251<CR>
menu Encoding.utf-8 		:e ++enc=2byte-utf-8 <CR>
menu Encoding.ibm-866 		:e ++enc=8bit-ibm866<CR>
menu Encoding.ucs-21e 		:e ++enc=ucs-2le<CR>

" Назначение клавиши для меню
nmap <F7> :emenu Encoding.<TAB>
vmap <F7> <esc>:emenu Encoding.<TAB>
imap <F7> <esc>:emenu Encoding.<TAB>

" Автоопределение кодировок
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Подсвечивание результатов поиска
set hlsearch

" Подсвечивать соответствующую скобку
set showmatch

" Настройка табуляции
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" 'Без этого backspace будет криво работать'
set bs=2

set autoindent
"set smartindent

set incsearch

set novisualbell
set t_vb=
set visualbell

set pastetoggle=<F12>

syntax on
"autocmd FileType perl syn include @perlDATA syntax/MojoliciousTemplate.vim

" Запрещаем Perl::Tags - ошибка
let Perl_PerlTags="disabled"

"colorscheme evening

" show the cursor position all the time
set ruler

" Don't use Ex mode, use Q for formatting
map Q gq

set showcmd

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
normal `Z
endfunction

" Разрешить для удаления пробелов в конце строки при каждой записи файла
"autocmd BufWritePre *.pl,*.pm :call StripTrailingWhitespace()

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
