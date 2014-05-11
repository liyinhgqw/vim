set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


Plugin 'clang-complete'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tomasr/molokai'

Plugin 'ervandew/supertab'

Plugin 'scrooloose/nerdtree'

Plugin 'gtags.vim'

" bracket auto completion
Plugin 'Raimondi/delimitMate'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'Lokaltog/vim-easymotion'

" status bar
Plugin 'bling/vim-airline'

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" =============================================================================================================
" Precondition conf

" set mapleader
let mapleader = ","
let g:mapleader = ","



" =============================================================================================================
" Conf for vundle plugin

" clang-complete
set completeopt-=preview

" molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
colorscheme molokai

" nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" gtags
" :Gtags funcname 定位到 funcname 的定义处。
" :Gtags -r funcname 查询 funcname被引用的地方。
" :Gtags -s symbol 定位 symbol 出现的地方。
" :Gtags -g string Goto string 出现的地方。 :Gtags -gi string 忽略大小写。
" :Gtags -f filename 显示 filename 中的函数列表。 你可以用 :Gtags -f %
" 显示当前文件。
" :Gtags -P pattern 显示路径中包含特定模式的文件。 如 :Gtags -P .h$
" 显示所有头文件， :Gtags -P /vm/ 显示vm目录下的文件。
nmap <c-i> :Gtags <C-R>=expand("<cword>")<CR><CR>
nmap <c-t> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <c-m> :Gtags -s <C-R>=expand("<cword>")<CR><CR>
nmap <c-u> :ccl <CR>
nmap <c-o> :Gtags -f %
function! UpdateGtags(f)
    let dir = fnamemodify(a:f, ':p:h')
    exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
endfunction
au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))

" vim-trailing-whitespace
map <leader><space> :FixWhitespace<cr>

" 多光标选中编辑
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" snippet
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
" 定义存放代码片段的文件夹 .vim/additional_snippets下，使用自定义和默认的，将
" 会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["additional_snippets", 'UltiSnips']

" =============================================================================================================
" Other conf

"==========================================
" fileencode settings 文件编码,格式
"==========================================
" 设置新文件的编码为 utf-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_cn.utf-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 vim。
set termencoding=utf-8

" use unix as the standard file type
set ffs=unix,dos,mac

" 如遇unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=b


"set guifont=monaco:h20          " 字体 && 字号

" history存储容量
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

set autoread          " 文件修改之后自动载入。
set shortmess=ati       " 启动的时候不显示那个援助索马里儿童的提示

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile


"create undo file
"set undolevels=1000         " how many undos
"set undoreload=10000        " number of lines to save for undo
"if v:version >= 730
    "set undofile                " keep a persistent backup file
    "set undodir=/tmp/vimundo/
"endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" 突出显示当前行等
"set cursorcolumn
set cursorline          " 突出显示当前行


"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
"set t_ti= t_te=


"- 则点击光标不会换,用于复制
"set mouse-=a             " 鼠标暂不启用, 键盘党....

" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
"set selection=inclusive
"set selectmode=mouse,key

" no annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

" remember info about open buffers on close"
set viminfo^=%

" for regular expressions turn magic on
set magic

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" display settings 展示/排版等界面格式设置
"==========================================
"
"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

set cc=80

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
"set scrolloff=7

"set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",bom\":\"\")}]\ %-14.(%l,%c%v%)\ %p
" always show the status line - use 2 lines for the status bar
set laststatus=2

"显示行号：
set number
" 取消换行。
set nowrap

" 括号配对情况,跳转并高亮一下匹配的括号
set showmatch
" how many tenths of a second to blink when matching brackets
set matchtime=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" 缩进配置

set smartindent   " smart indent
set autoindent    " 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting

" tab相关变更
set tabstop=4     " 设置tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将tab自动转化成空格    [需要输入真正的tab键时，使用 ctrl+v + tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" a buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=


"==========================================
" fileencode settings 文件编码,格式
"==========================================
" 设置新文件的编码为 utf-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_cn.utf-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 vim。
set termencoding=utf-8

" use unix as the standard file type
set ffs=unix,dos,mac

" 如遇unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=b


"==========================================
" others 其它设置
"==========================================
"autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
"让vim的补全菜单行为与一般ide一致(参考vimtip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

"离开插入模式后自动关闭预览窗口
autocmd insertleave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <cr>       pumvisible() ? "\<c-y>" : "\<cr>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <down>     pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <up>       pumvisible() ? "\<c-p>" : "\<up>"
inoremap <expr> <pagedown> pumvisible() ? "\<pagedown>\<c-p>\<c-n>" : "\<pagedown>"
inoremap <expr> <pageup>   pumvisible() ? "\<pageup>\<c-p>\<c-n>" : "\<pageup>"

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" hotkey settings  自定义快捷键设置
"==========================================

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
"map <left> <nop>
"map <right> <nop>
"map <up> <nop>
"map <down> <nop>

"treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" f1 - f6 设置
" f1 废弃这个键,防止调出系统帮助
" f2 行号开关，用于鼠标复制代码用
" f3 显示可打印字符开关
" f4 换行开关
" f5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" f6 语法开关，关闭语法可以加快大文件的展示

" i can type :help on my own, thanks.  protect your fat fingers from the evils of <f1>
noremap <f1> <esc>"
noremap <f3> :set list! list?<cr>
nnoremap <f4> :set wrap! wrap?<cr>
              "set paste
set pastetoggle=<f5>            "    when in insert mode, press <f5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au insertleave * set nopaste

nnoremap <f6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<cr>


"smart way to move between windows 分屏窗口移动
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" go to home and end using capitalized directions
"noremap H ^
"noremap L $
inoremap <c-a> <home>
inoremap <c-e> <end>



"map ; to : and save a million keystrokes
" ex mode commands made easy 用于快速进入命令行
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <c-j> <t_kd>
cnoremap <c-k> <t_ku>
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" 搜索相关

" map <space> to / (search) and ctrl-<space> to ? (backwards search)
" 进入搜索use sane regexes"
nnoremap / /\v
vnoremap / /\v

"keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> n nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" switch # *
"nnoremap # *
"nnoremap * #

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<cr>

" --------tab/buffer相关

"use arrow key to change buffer"
noremap <left> :bp<cr>
noremap <right> :bn<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" ------- 选中及操作改键

"reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> y make y behave like other capitals
map y y$

" select all
map <leader>sa ggvg"

" select block
nnoremap <leader>v v`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 esc
inoremap kj <esc>

" 滚动speed up scrolling of the viewport slightly
nnoremap <c-e> 2<c-e>
nnoremap <c-y> 2<c-y>


"jump to start and end of line using the home row keys
"nmap t o<esc>k
nmap t o<esc>j

" quickly close the current window
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<cr>
nmap <silent> <leader>sv :so ~/.vimrc<cr>

" quickfix
nmap <leader>qo :copen<cr>
nmap <leader>ql :ccl<cr>

"==========================================
" filetype settings  文件类型设置
"==========================================

" python 文件的一般设置，比如不要 tab 等
"autocmd filetype python set tabstop=4 shiftwidth=4 expandtab ai

"" for error highlight，防止错误整行标红导致看不清
highlight clear spellbad
highlight spellbad term=standout ctermfg=1 term=underline cterm=underline
highlight clear spellcap
highlight spellcap term=underline cterm=underline
highlight clear spellrare
highlight spellrare term=underline cterm=underline
highlight clear spelllocal
highlight spelllocal term=underline cterm=underline
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end
