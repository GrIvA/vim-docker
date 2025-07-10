set termguicolors

filetype off 
call plug#begin('~/.vim/bundle') " Адрес до вашего ~/.vim/bundle

" Другие плагины
  
"Plug 'mhinz/vim-startify'
"Plug 'ledger/vim-ledger' "Plugin for leger-cli files
"Plug 'juneedahamed/vc.vim'

Plug 'SirVer/ultisnips'

""""""""""""""""""""""""""""""""""""""""""
"           ULTISNIP                     "
""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="qq"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<NUL>"

filetype indent plugin on

Plug 'honza/vim-snippets' "Snippets are separated from the engine. 

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Call NERDTree plugin
nmap <F6> :NERDTreeToggle<CR>

" Change directory also in nerdtree
nnoremap <leader>cd :cd %:p:h<CR>:NERDTreeCWD<CR>
         
Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/vim-easy-align'

""""""""""""""""""""""""""""""""""""""""
"     EASY ALIGN PLUGIN                "
""""""""""""""""""""""""""""""""""""""""
vmap <Enter> <Plug>(EasyAlign)
" nmap <Leader>a <Plug>(EasyAlign)

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle='' " disable alt-p

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""""""""""""""""""""""""""""""""""""""""""
"           Fuzzi Finder                 "
""""""""""""""""""""""""""""""""""""""""""
"let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>\ :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<CR>

" Use RipGrep to list files for fzf
let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
\ 'coc-prettier',
\ 'coc-phpls',
\ 'coc-pyright',
\ ]

""""""""""""""""""""""""""""""""""""""""""
"               COC-VIM                  "
""""""""""""""""""""""""""""""""""""""""""
" let g:flake8_max_markers=0
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

""""""""""""""""""""""""""""
" Coc Extensions
""""""""""""""""""""""""""""
nnoremap <leader>p  :<C-u>CocList -A --normal yank<cr>


Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

Plug 'StanAngeloff/php.vim'
Plug 'rayburgemeestre/phpfolding.vim'

let g:DisableAutoPHPFolding = 1
nmap <Leader>f <Esc>:EnablePHPFolds<Cr>
nmap <Leader>d <Esc>:DisablePHPFolds<Cr>

Plug 'sstallion/vim-cursorline'

Plug 'kshenoy/vim-signature'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Initialize plugin system
call plug#end()
      
" set spell parameters
set spell spelllang=en_us
set nospell
      
" folding column
set foldcolumn=3
set foldmethod=manual
set foldnestmax=10
set nofoldenable



""""""""""""""""""""""""""""""""""""""""""
"           SYSTEM COPY                  "
""""""""""""""""""""""""""""""""""""""""""
let g:system_copy#paste_command='xclip -sel clip -o'
let g:system_copy#copy_command='xclip -f -i -sel clip'

"""""""""""""""""""""""""""""""""""""""""
"         COLOR SCHEME                  "
"""""""""""""""""""""""""""""""""""""""""
syntax on
" colo desert 
colo wombat256grf 
" colo anotherdark 




""""""""""""""""""""""""""""""""""""""""
"       ADDITIONAL FUNCTIONS           "
""""""""""""""""""""""""""""""""""""""""

"        session options
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize

if !exists('*SaveSession')
function SaveSession()
   if (v:this_session == "") 
      let session = $HOME . "/.vimsession/" . input("Enter session name: ~/.vimsession/")
      if filereadable(session)
         echo "\n" . "Not saved: this session already exists."
      else  
         wa
         exe "mks! " . session
         echo "\n" . "Session saved."
      endif
   else
      wa
      exe "mks! " . v:this_session
      echo "Session saved in " . v:this_session
   endif
endfunction
endif

nmap SO :wa<CR>:so ~/.vimsession/
nmap SSA :call SaveSession()<CR>



" comment / uncomment
nmap ,, :call Comment()<CR>
nmap ,. :call Uncomment()<CR>
function! Comment()
   let ft = &filetype
   if ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
      silent s/^/\#/
   elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'php'
      silent s:^:\/\/:g
   elseif ft == 'tex'
      silent s:^:%:g
   elseif ft == 'vim'
      silent s:^:\":g
   endif
endfunction

function! Uncomment()
   let ft = &filetype
   if ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
      silent s/^\#//
   elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'php'
      silent s:^\/\/::g
   elseif ft == 'tex'
      silent s:^%::g
   elseif ft == 'vim'
      silent s:^\"::g
   endif
endfunction

"     leader & control symbol
" Set LEADER symbol
" let mapleader='~'

" Send daily report
"nmap <leader>S :w<CR>:! ~/send_report.sh '%'<CR>

" show/hide control symvbols
nmap <leader>2 :set list!<CR>

set listchars=tab:»-,trail:¯,nbsp:°,eol:¬,precedes:«,extends:»
   
set nocompatible
set number
"set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-c> :call NumberToggle()<cr>

set clipboard=unnamed

function! s:tig_status()
  cd `driller --scm-root %`
  !tig status
endfunction

map <C-G> :TigStatus<CR><CR>
command! TigStatus call s:tig_status()

"               RGrep
let Grep_Default_Filelist = '*.php'
map <C-f> :Rgrep<CR>

"       key mapping 
" Shortkey in visual mode
imap jj <Space><Space><Space><Space>

  " Сохранить файл
  nmap <F2> :w!<CR>
  imap <F2> <Esc>:w!<CR>
  vmap <F2> <Esc>:w!<CR>

  " Закрыть VIM
  nmap <F4> :q<CR>
	
	" Next/Prev TABS
	nnoremap <C-Left> gT
	nnoremap <C-Right> gt

"         Resize splits
nnoremap <leader><up> :resize -5<CR>
nnoremap <leader><down> :resize +5<CR>
nnoremap <leader><left> :vertical resize -5<CR>
nnoremap <leader><right> :vertical resize +5<CR>

" Горячие клавиши <--

" Set color string at end line (Mark 80 column)
" :au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
highlight ColorColumn ctermbg=0 
set colorcolumn=80 

" Функция копирует все выделенные фрагменты в буфер
" USE:   :CopyMatches A  - where A is register name
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Close all invisible buffers
" USE: call CloseHiddenBuffers()
function! CloseHiddenBuffers()
    " Tableau pour memoriser la visibilite des buffers                                                                                      
    let visible = {}
    " Pour chaque onglet...
    for t in range(1, tabpagenr('$'))
        " Et pour chacune de ses fenetres...
        for b in tabpagebuflist(t)
            " On indique que le buffer est visible.
            let visible[b] = 1
        endfor
    endfor
    " Pour chaque numero de buffer possible...
    for b in range(1, bufnr('$'))
        " Si b est un numero de buffer valide et qu'il n'est pas visible, on le
        " supprime.
        if bufexists(b) && !has_key(visible, b)
            " On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
            " sont pourtant charges en memoire.
            execute 'bwipeout' b
        endif
    endfor
endfun

" Remove trailing simbols at the end strings before write the file
autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
" au BufNewFile,BufRead *.py set foldmethod=indent

" strips trailing whitespace at the end of files. this
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction



" autoload change .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" Функция для переключения в режим hex-редактора
" command -bar Hexmode call ToggleHex()

function ToggleHex()
 	let l:modified=&mod
	let l:oldreadonly=&readonly
	let &readonly=0
	let l:oldmodifiable=&modifiable
	let &modifiable=1
	if !exists("b:editHex") || !b:editHex
		let b:oldft=&ft
		let b:oldbin=&bin
		setlocal binary 
		let &ft="xxd"
		let b:editHex=1
		%!xxd
	else
		let &ft=b:oldft
			if !b:oldbin
				setlocal nobinary
			endif
		let b:editHex=0
		%!xxd -r
	endif
	let &mod=l:modified
	let &readonly=l:oldreadonly
	let &modifiable=l:oldmodifiable
endfunction


" переключение в HEX режим
" nnoremap <C-H> :Hexmode<CR>
"----------------------------------------



" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
set mouse=a

" Минимальная высота окна
set winminheight=1
" Минимальная ширина окна
set winminwidth=3
" Всегда отображать статусную строку для каждого окна
set laststatus=2

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu

" Размер табуляции
set tabstop=4
" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=4
" Копирует отступ от предыдущей строки
set autoindent
set smarttab
set expandtab
" Включаем 'умную' автоматическую расстановку отступов
set smartindent

" Включаем перенос строк
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Останавливать поиск при достижении конца файла
" set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
"" Все swap файлы будут помещаться в эту папку
"set dir=~/.vim/swp

"" Размер истории для отмены
"set undolevels=1000

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
" set whichwrap=b,s,<,>,[,],l,h

" Настраиваем переключение раскладок клавиатуры по <C-^>
" set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
set iminsert=0
" Поиск по умолчанию - английский
set imsearch=0

" Перемещение строки вверх/вниз
nmap { ddkP
nmap } ddp

" Открытие конфига по ,v
map <silent><leader>v :tabf ~/.vimrc<cr>
 
" Сортировка css свойств
noremap <silent><leader>fs <esc>vi{:!sort<cr>:echo "CSS line sorting."<cr><Esc>

" Set file type
nnoremap <leader>fh :set ft=html<cr>:echo "File type: HTML"<cr><Esc>
nnoremap <leader>fx :set ft=xml<cr>:echo "File type: XML"<cr><Esc>
nnoremap <leader>fp :set ft=php<cr>:echo "File type: PHP"<cr><Esc>
nnoremap <leader>fy :set ft=python<cr>:echo "File type: Python"<cr><Esc>
nnoremap <leader>fm :set ft=mysql<cr>:echo "File type: MySQL"<cr><Esc>
nnoremap <leader>fc :set ft=css<cr>:echo "File type: CSS"<cr><Esc>
nnoremap <leader>fs :set ft=sql<cr>:echo "File type: SQL"<cr><Esc>
nnoremap <leader>fj :set ft=javascript<cr>:echo "File type: JavaScript"<cr><Esc>

" Set map for diff mode 
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif
