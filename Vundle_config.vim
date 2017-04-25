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

" 设置运行路径，加载和初始化vundle
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')


" 让Vundle管理插件管理 Vundle (必需的)
Plugin 'VundleVim/Vundle.vim'

"--------------------------------------
" web 前端 插件
"--------------------------------------

"快速开发HTML和CSS(Zen Coding) 教程：https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plugin 'mattn/emmet-vim'

"高亮HTML/XML匹配标签
Plugin 'gregsexton/matchtag'

"CSS 颜色高亮
Plugin 'ap/vim-css-color'

"--------------------------------------
" 公共 插件
"--------------------------------------

" 配色主题(配色方案)
Plugin 'altercation/vim-colors-solarized'

" 语法检查
Plugin 'scrooloose/syntastic'

"树形目录插件
Plugin 'scrooloose/nerdtree'



" 自动补全括号、引号等。按下Shift+Tab，跳到补全的符号后面，并且是insert模式
Plugin 'Raimondi/delimitMate'

" 多光标多行编辑
"Plugin 'terryma/vim-multiple-cursors'

" 注释代码插件
"Plugin 'tpope/vim-commentary'

"状态栏插件(自带buffer)
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'


"Surround
"NERDCommenter 
"Syntastic
"neocomplcaches
"PIV
"Tabularize
"Tagbar

call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------------
"	< vim-colors-solarized(配色主题) 插件配置 >
"--------------------------------------
syntax enable           "激活 语法高亮
set background=dark     "设置背景颜色为暗色
"set background=light    "设置背景颜色为亮色
colorscheme solarized   "主题颜色
call togglebg#map("<F5>")   "背景颜色切换(亮色和暗色切换)
let g:solarized_termcolors=256

"--------------------------------------
"	< syntastic(语法检查) 插件配置 >
"--------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '>>'		"语法错误时，侧边栏显示
let g:syntastic_warning_symbol = '>'	"语法警告时，侧边栏显示
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1	"错误窗口打开模式
"let g:syntastic_check_on_open = 1	"打开文件是否进行语法检查 默认不检查 1：检查
let g:syntastic_check_on_wq = 0		" 当执行（:wq）、（:x）（:ZZ）时跳过语法检查，（:w）检查

highlight SyntasticErrorSign guifg=white guibg=red

"安装node.js 使用npm
" npm install -g htmlhint
" npm install -g jshint
" npm install -g csslint
" npm install -g prettycss

let g:syntastic_html_checkers=['htmlhint', 'jshint']
let g:syntastic_css_checkers=['csslint', 'prettycss']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']



"--------------------------------------
"	< nerdtree(树形目录) 插件配置 >
"--------------------------------------
" 自动打开树形目录
	autocmd vimenter * NERDTree

" 光标自动聚焦到右侧文件编辑区
	autocmd VimEnter * wincmd w

" 关闭树形目录 
    "let loaded_nerd_tree=1

" 突出显示树形目录中，光标所在行
    let NERDTreeHighlightCursorline=0

" 在树形目录中，显示书签列表
    let NERDTreeShowBookmarks=1

" 显示树形目录的行号
	let g:NERDTreeShowLineNumbers=1
" 设置树形目录的位置
    let NERDTreeWinPos='left'
" 设置树形目录窗口大小
    let NERDTreeWinSize=31


"--------------------------------------
"	< vim-multiple-cursors(多光标多行编辑) 插件配置 >
"--------------------------------------
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
