"--------------------------------------
" Vundle插件管理工具
" 克隆Vundle插件管理器 git clone https://github.com/VundleVim/Vundle.vim.git /d/Vim/vimfiles/bundle/Vundle.vim
" 引入 在 _vimrc 文件中：source $VIM/GVim/Vundle_config.vim
    " :PluginList          - 列出配置的插件
    " :PluginInstall       - 安装插件
    " :PluginInstall(!)    - 安装(更新)插件
    " :PluginClean(!)      - 确认(或自动批准)删除未使用的插件
"	< 插件管理 >
"--------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ','
let g:mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""" Vundle 插件管理 开始 """"""""""""""""""""""""""""""""""""""""""""""""

" 设置运行路径，加载和初始化vundle
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')


" 让Vundle管理插件管理 Vundle (必需的)
Plugin 'VundleVim/Vundle.vim'

"--------------------------------------
" theme 主题
"--------------------------------------
Plugin 'altercation/vim-colors-solarized'



"--------------------------------------
" 状态栏、buffer栏美化
"--------------------------------------
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'



"--------------------------------------
" 树形列表(文件、函数)
"--------------------------------------
"文件浏览器 (树形目录插件)
Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

"函数列表
Plugin 'majutsushi/tagbar'



"--------------------------------------
" 代码对齐
"--------------------------------------
"代码对齐( = 或 : )
Plugin 'godlygeek/tabular'



"--------------------------------------
" 代码注释
" shift+v 选择要注释的行
" ,cc  注释单行或者选中行
" ,cm  多行注释
" ,cu  解开注释
" ,ci  在注释和取消注释之间切换
"--------------------------------------
Plugin 'scrooloose/nerdcommenter'



"--------------------------------------
" 代码行尾空格标红处理
"--------------------------------------
Plugin 'bronson/vim-trailing-whitespace'



"--------------------------------------
" 快速切换括号/引号或者标签
" csw"	添加双引号
" yss'	整行添加单引号
" cs"'	双引号替换为单引号
" cs(]	括号替换为中括号
" sct'	标签替换为单引号
" ds'	删除单引号
"--------------------------------------
Plugin 'tpope/vim-surround'



"--------------------------------------
" 高亮显示匹配的标签
" 依赖python	官网：https://www.python.org/
" windows 安装：
"--------------------------------------
Plugin 'Valloric/MatchTagAlways'



"--------------------------------------
" 高亮显示颜色代码
"--------------------------------------
Plugin 'gorodinskiy/vim-coloresque'



"--------------------------------------
" 自动补全 引号，括号，括号等
"--------------------------------------
Plugin 'raimondi/delimitmate'



"--------------------------------------
" 快速匹配() [] {} 等，还可以匹配单词，如html标签。
"--------------------------------------
Plugin 'vim-scripts/matchit.zip'



"--------------------------------------
" 代码片段工具
" 依赖python	官网：https://www.python.org/
"--------------------------------------
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'



"--------------------------------------
" 多光标多行编辑
" <C-n>	选中
" c	替换内容
" 例：检索 hello 选中 替换为 world --> fh<C-n>cworld
"--------------------------------------
Plugin 'terryma/vim-multiple-cursors'


"--------------------------------------
" web HTML 插件
"--------------------------------------
Plugin 'othree/html5.vim'


"--------------------------------------
" 语法检查
"--------------------------------------
let s:vim8 = has('patch-8.0.0039') && exists('*job_start')
if s:vim8
    Plugin 'w0rp/ale'
    let g:airline_section_error = '%{ALEGetStatusLine()}'
else
    Plugin 'scrooloose/syntastic'
endif



call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""" Vundle 插件管理 结束 """"""""""""""""""""""""""""""""""""""""""""""""


"--------------------------------------
"	< altercation/vim-colors-solarized(配色主题) 插件配置 >
"--------------------------------------
syntax enable           "激活 语法高亮
colorscheme solarized	"主题配色方案
if has('gui_running')
	set background=dark		"设置背景颜色为暗色
else
	set background=light	"设置背景颜色为亮色
endif

call togglebg#map("<F5>")	"背景颜色切换(亮色和暗色切换)

"let g:solarized_termcolors=256
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"


"--------------------------------------
"	< scrooloose/nerdtree(树形目录) 插件配置 >
"--------------------------------------
" 自动打开树形目录
	autocmd vimenter * NERDTree

" 光标自动聚焦到右侧文件编辑区
	autocmd VimEnter * wincmd w

"let loaded_nerd_tree = 1		" 关闭树形目录
let NERDTreeHighlightCursorline = 0		" 突出显示树形目录中，光标所在行
let NERDTreeShowBookmarks = 1			" 在树形目录中，显示书签列表
let g:NERDTreeShowLineNumbers = 1		" 显示树形目录的行号
let NERDTreeWinPos = 'left'				" 设置树形目录的位置
let NERDTreeWinSize = 31				" 设置树形目录窗口大小
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"如果唯一打开的窗口是一个NERDTree，那么关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


" ----------------------------------------------------------------------------
"	< majutsushi/tagbar(函数列表) 插件配置 >
"	http://ctags.sourceforge.net/ 官网
"	windows ： 官网下载Windows的源代码和二进制的.zip包,解压放到指定的路径;重新定义g:tagbar_ctags_bin变量值;列：let g:tagbar_ctags_bin = '$VIM/GVim/ctags58/ctags.exe'
" ----------------------------------------------------------------------------
let g:tagbar_autofocus = 1		" 启动 时自动focus
let g:tagbar_width = 50
let g:tagbar_ctags_bin = '$VIM/GVim/ctags58/ctags.exe'		"设置tagbar使用的ctags的插件 
let g:tagbar_width=30			"设置tagbar的窗口宽度
"let g:tagbar_left=1			"设置tagbar的窗口显示的位置,为左边

"打开文件自动 打开tagbar  
autocmd BufReadPost *.php,*.js, call tagbar#autoopen()  
"映射tagbar的快捷键  
nnoremap <F8> :TagbarToggle<CR>


" ----------------------------------------------------------------------------
"	< godlygeek/tabular(代码对齐) 插件配置 >
"	,a=	等号对齐
"	,a:	冒号对齐
"	,a"	双引号对齐
"	,a'	单引号对齐
" ----------------------------------------------------------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a' :Tabularize /'<CR>
vmap <Leader>a' :Tabularize /'<CR>


" ----------------------------------------------------------------------------
"	< bronson/vim-trailing-whitespace(代码行尾空格标红处理) 插件配置 >
" Mapping: <leader><space>
" ,空格    去掉多余空格
" ----------------------------------------------------------------------------
map <leader><space> :FixWhitespace<cr>


" ----------------------------------------------------------------------------
"	< raimondi/delimitMate(自动补全) 插件配置 >
" ----------------------------------------------------------------------------
"let delimitMate_matchpairs = "(:),[:],{:}"
"let delimitMate_expand_cr = 1


"--------------------------------------
"	< terryma/vim-multiple-cursors(多光标多行编辑) 插件配置 >
"--------------------------------------
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'


"--------------------------------------
"	< scrooloose/syntastic(语法检查) 插件配置 >
"--------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '>>'		"语法错误时，侧边栏显示
let g:syntastic_warning_symbol = '>'	"语法警告时，侧边栏显示
let g:syntastic_style_error_symbol='»'
let g:syntastic_style_warning_symbol='•'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1	"错误窗口打开模式
"let g:syntastic_check_on_open = 1	"打开文件是否进行语法检查 默认不检查 1：检查
let g:syntastic_check_on_wq = 0		" 当执行（:wq）、（:x）（:ZZ）时跳过语法检查，（:w）检查
let g:syntastic_enable_highlighting = 0

highlight SyntasticErrorSign guifg=white guibg=red

"安装node.js 使用npm
" npm install -g htmlhint
" npm install -g jshint
" npm install -g csslint
" npm install -g prettycss

"HTML语法检查
let g:syntastic_html_checkers=['htmlhint', 'jshint']

"CSS语法检查
let g:syntastic_css_checkers=['csslint', 'prettycss']

"javascript语法检查
let g:syntastic_javascript_checkers = ['jshint','eslint']
if executable('eslint_d')
    let g:syntastic_javascript_eslint_exec = 'eslint_d'
endif

"php语法检查
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["java"] }