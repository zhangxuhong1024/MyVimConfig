set nocompatible
"把以下几句mark起来，以取消瘟到死下ctrl+q进入列模式。
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"设置 <leader>为空格键,写在较前面的位置,便后面使用到时可以统一并生效.
let mapleader = " "

"按 F2 可以写上自己的大名和当前日期
inoremap <F2> <C-R>=strftime(" XUHONG_%Y%m%d ")<Cr>

"普通模式下连续按5次空格，清楚搜索关键字高亮
nnoremap <Space><Space><Space><Space><Space> :nohl<CR>

"普通模式下按 <leader>p 粘贴系统粘贴板上的内容
"普通模式下按 <leader>y 复制当前单词至系统粘贴板
"选择模式下按 <leader>y 复制当前内容至系统粘贴板
nnoremap <leader>p "+p
nnoremap <leader>y "+yiw
vnoremap <leader>y "+y

"普通模式下，按 <leader>e1 转换显示编码为gb2312.
"普通模式下，按 <leader>e2 转换显示编码为utf8.
"普通模式下，按 <leader>e3 转换显示编码为big5.
nnoremap <leader>e1 :e ++enc=gb2312<Cr>
nnoremap <leader>e2 :e ++enc=utf8<Cr>
nnoremap <leader>e3 :e ++enc=big5<Cr>

"普通模式下，按<ss> 则替换当前单词为剪切板0的内容。
"可视模式下，按<ss> 则替换当前选定为剪切板0的内容。
nnoremap ss ciw<C-r>0<ESC>
vnoremap ss c<C-r>0<ESC>

"普通模式下，按<leader>z 则退出vim。
nnoremap <leader>z :qa<CR>

"在可视模式下搜索选定的字串
vnoremap n <ESC>gv"xy:let @/=@x<CR>nzz
vnoremap N <ESC>gv"xy:let @/=@x<CR>Nzz

"普通模式下上下移动光标时，以显示的行为准（而不是以实际文件中换行符为准）一行一行移动。
noremap j gj
noremap k gk

"插入模式下移动光标
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"自动设置目录为正在编辑的文件所在的目录
set autochdir 

"查找时，对大小写不敏感。当查找的模式里有大写时则对大小写敏感。
set ignorecase smartcase

"文件编码设置
set encoding=utf-8
set fileencoding=utf-8
"可按需要排列big5的位置
set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1

"让Vim能自动识别UNIX格式和MS-DOS格式
set fileformats=unix,dos

"显示行号
set number

"突显当前行
set cursorline

"显示括号配对情况  
set showmatch

"自动换行
set nowrap
set textwidth=82 

"命令行显示输入命令
set showcmd

"命令行显示vim当前模式
set showmode

"搜索模式时,输入字符串就显示匹配点
set incsearch        

"高亮搜索字符串
set hlsearch    

"关键字着色
syntax on

"VIM默认只能打开10个标签页，在配置文件可以修改这个限制
set tabpagemax=18

" 设定Python的DLL位置
set pythonthreedll=python37.dll

"总是显示标签栏
set showtabline=2 

"不显示工具栏
set guioptions-=T

"设置自动代码折叠
set foldmethod=manual
":set foldmethod=indent
set foldlevel=9999

"创建折叠，zf%太麻烦了，不然zff方便。
noremap zff zf%

" 设定配色方案
"colorscheme ron
"colorscheme blue
"colorscheme desert
colorscheme morning

"保存全局变量
set viminfo+=!

"设定会话保存的内容
set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize

"自动缩进与C语言风格缩进
set autoindent
set smartindent
set linebreak
set cindent

"switch case 对齐风格
set cino=g0,=0

"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4

"用空格代替制表符.
set expandtab
"set noexpandtab

" leaderf设置
noremap <leader>t :LeaderfBufTag<Cr>
noremap <leader>T :LeaderfBufTagAll<Cr>
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_UseVersionControlTool=0

