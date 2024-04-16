 
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set noshowmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Always show status line
set laststatus=2

" zo open the fold under the cursor
" zc close the fold under the cursor
" zR open all fold
" zM close all fold


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

if !has("gui_running")
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
endif

" Use the Solarized Dark theme
colorscheme solarized
set background=dark

" Set a custom font you have installed on your computer.
" Syntax is set guifont=<font_name>\ <font_weight>\ <size>
set guifont=Monaco\ Bold\ 12


" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif


" }}}


" STATUS LINE ------------------------------------------------------------ {{{

"%F – Display the full path of the current file.

"%M – Modified flag shows if file is unsaved.

"%Y – Type of file in the buffer.

"%R – Displays the read-only flag.

"%b – Shows the ASCII/Unicode character under cursor.

"0x%B – Shows the hexadecimal character under cursor.

"%l – Display the row number.

"%c – Display the column number.

"%p%% – Show the cursor percentage from the top of the file.



" Status bar code goes here.

" Function that check the status mode and assing the extended string used in the statusline vaiable 


function! CustomMode()
  let mode = mode(1)
  if mode ==# 'i'
    return 'INSERT'
  elseif mode ==# 'R'
    return 'REPLACE'
  elseif mode ==# 'v'
    return 'VISUAL'
  elseif mode ==# 'V'
    return 'V-LINE'
  elseif mode ==# "\<C-V>"
    return 'V-BLOCK'
  elseif mode ==# 'c'
    return 'COMMAND'
  elseif mode ==# 's'
    return 'SELECT'
  elseif mode ==# 'S'
    return 'S-LINE'
  elseif mode ==# "\<C-S>"
    return 'S-BLOCK'
  elseif mode ==# 'Rv'
    return 'V-REPLACE'
  else
    return 'NORMAL'
  endif
endfunction

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Define and customize the statusline
set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}          " Define new status line group used to color the mode
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}          "
set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}          "
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}        "
set statusline+=%2*\ [%n]\                                                "buffernr
set statusline+=%3*\ %m\                                                  "Modified?
set statusline+=%4*\ %<%F\                                                "File+path
set statusline+=%5*\ %=\ row:%l/%L\ (%03p%%)\ \|                         "Rownumber/total (%)
set statusline+=%6*\ col:%03c\ \|                                        "Colnr
set statusline+=%7*\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|                 "Encoding
set statusline+=%8*\ %{&spelllang}\%{HighlightSearch()}\ \|              "Spellanguage & Highlight on?
set statusline+=%9*\ \ %r%w\                                              "Readonly? Top/bot.

"set statusline+=%2*\ %y\                                  "FileType
"set statusline+=%8*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)


hi NormalColor ctermfg=232 ctermbg=39
hi InsertColor ctermfg=232 ctermbg=46
hi VisualColor ctermfg=232 ctermbg=206
hi ReplaceColor ctermfg=232 ctermbg=160
hi User2 ctermfg=232  ctermbg=255
hi User3 ctermfg=232  ctermbg=255
hi User4 ctermfg=232  ctermbg=255

" }}}

