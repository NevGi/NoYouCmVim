set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'SirVer/ultisnips'
Plugin 'suan/vim-instant-markdown'
Plugin 'dyng/ctrlsf.vim'
Plugin '907th/vim-auto-save'
" 插件列表结束
call vundle#end()

syntax enable
filetype plugin on
filetype indent on
"set autoindent
"colorscheme darkblue
colorscheme desert


" NEDTREE
nmap <F2> :NERDTreeToggle<CR>
" 只显示1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" ?Ƿ???ʾ?????ļ?
let NERDTreeShowHidden=1
" 宽度
let NERDTreeWinSize=35
" 打开时显示
let g:nerdtree_tabs_open_on_console_startup=1
" 不显示下面文件
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示标签
let NERDTreeShowBookmarks=1

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
autocmd BufReadPost *.cpp,*.[ch],*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
nmap <F3> :TagbarToggle<CR>


" ctrlp 
let g:ctrlp_map = '<leader>ff' " 搜索文件
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:vtrlp_math_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" powerline
let g:Powerline_sysmbol = 'fancy'
set encoding=utf-8
set laststatus=2



" protodef
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" ??Ա??????ʵ??˳????????˳??һ??
let g:disable_protodef_sorting=1

"markdown
let g:instant_markdown_autostart=0
map <F8> :InstantMarkdownPreview<CR>

"auto save
let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged"]
" "TextChangedI", "CursorHoldI", "CompleteDone"]
"set updatetime=5000
"python
map <F5> :w<CR> :!python3 %<CR>

au BufNewFile,BufRead *.py "????py?ļ?֧??PEP8????

autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_python_header  
autocmd BufNewFile *.py ks|call FileName()|'s  
autocmd BufNewFile *.py ks|call CreatedTime()|'s  

fun FileName()  
    if line("$") > 10
        let l = 10  
    else
        let l =line("$")
    endif
    exe "1,".l."g/File Name:.*/s/File Name:.*/File Name:".expand("%")
endfun

fun CreatedTime()
    if line("$") > 10
        let l=10
    else
        let l=line("$")
    endif
    exe "1,".l."g/Created Time:.*/s/Created Time:.*/Created Time:".strftime("%Y-%m-%d %T")
endfun



"自定
" 给c cpp java文件输入格式
autocmd BufNewFile *.[ch],*.cpp,*.hpp,*.sh,*.java exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: kzh") 
        call append(line(".")+2, "\# mail: 2471604619@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else
        call setline(1,"/**") 
        call append(line("."), " * @file ".expand("%")) 
        call append(line(".")+1, " * @brief ") 
        call append(line(".")+2, " * @details")
        call append(line(".")+3, " * @mainpage")
        call append(line(".")+4, " * @author kzh")
        call append(line(".")+5, " * @email 2471604619@qq.com")
        call append(line(".")+6, " * @version 1.0.0")
        call append(line(".")+7, " * @date ".strftime("%c")) 
        call append(line(".")+8, " */") 
    endif

"    if &filetype == 'cpp'
"        call append(line(".")+9, "#include<iostream>")
"        call append(line(".")+10, "using namespace std;")
"        call append(line(".")+11, "") 
"        call append(line(".")+12, "")
"        call append(line(".")+13, "int main()") 
"        call append(line(".")+14, "{")
"        call append(line(".")+15, "")
"        call append(line(".")+16, "") 
"        call append(line(".")+17, "    return 0;")
"        call append(line(".")+18, "}")
"    endif
"    if &filetype == 'c'
"        call append(line(".")+9, "#include<stdio.h>")
"        call append(line(".")+10, "")
"        call append(line(".")+11, "") 
"        call append(line(".")+12, "")
"        call append(line(".")+13, "int main()") 
"        call append(line(".")+14, "{")
"        call append(line(".")+15, "")
"        call append(line(".")+16, "")
"        call append(line(".")+17, "    return 0;")
"        call append(line(".")+18, "}")
"    endif 
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"????????
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" 基本设置
" =========================================================================================================================
set nu
set showcmd
set backspace=eol,start,indent
set magic
set showmatch
set nobackup
set cursorline
set nowb
set noswapfile
set ai
set si
set cindent
set wildmenu
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set history=400
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1
set smartindent
set softtabstop=4
"python
set textwidth=79

"折叠
set foldmethod=indent "syntax
set nofoldenable

" 定义快捷键============================================================================================================
let mapleader=";"
set mouse=a
" 让鼠标右键可用
if has('mouse')
    set mouse-=a
endif

map <leader>s :w<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>S :w!<CR>
map <leader>r :source $MYVIMRC<CR>

map <leader><CR> :noh<CR>

map sl :set splitright<CR>:vsplit<CR> 
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <leader>j <C-W>j
map <leader>h <C-W>h
map <leader>k <C-W>k
map <leader>l <C-W>l 

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map te :tabe<CR>
map tn :-tabnext<CR>
map tf :+tabnext<CR>

map <leader>sv <C-W>t<C-H>H
map <leader>sh <C-W>t<C-W>K

map <leader>sw :FSHere<CR>
" 自动生成实现
map <leader>d <leader>PP

map <leader>jd <C-]>
map <leader>jf <C-T>
map <leader>jp <C-O>

" 打开最近使用文件
map <leader>fp :CtrlPMRU<CR> 

" search in project
" 显示匹配的上下文 选中其中匹配项 按下p 显示文件具体内容
map <leader>sp :CtrlSF<CR> 

" 多选光标 shift+n 选中下一个 shift+k 跳过这个
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

"?۵?
map zo zo
map zc zc
map ZO zR
map ZC zM
" ===============================================================================

if &term == "xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

set laststatus=2
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\[%{&fileformat}]\[%{&encoding}]\[%{strftime(\"%Y-%m-%d\ %H:%M:%S\")}] 
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

nmap <F7> :TlistToggle <CR>

let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

set tags+=tags
set tags+=~/.vim/tags/libc.tags
set tags+=~/.vim/tags/cpp.tags
set tags+=~/.vim/tags/glib.tags
set tags+=~/.vim/tags/susv2.tags

set completeopt=longest,menu

let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=2
let OmniCpp_ShowAccess=1
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_DefaultNamespaces=["std","_GLIBCXX_STD"]

