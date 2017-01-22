" Vundle插件管理工具  
" 安装vim根目录 git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
" 引入 在 _vimrc 文件中：source $VIM/GVim/Vundle_config.vim

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$VIM/bundle/Vundle.vim
call vundle#begin('$VIM/bundle/Vundle.vim')

" Vundle插件管理(必须)
Plugin 'VundleVim/Vundle.vim'
" 语法高亮插件
Plugin 'altercation/vim-colors-solarized'
"自动补全括号、引号等
Plugin 'Raimondi/delimitMate'

call vundle#end()            " required
filetype plugin indent on    " required

" 语法高亮插件(altercation/vim-colors-solarized)
syntax enable           "激活 语法高亮
set background=dark     "设置背景颜色为暗色
"set background=light    "设置背景颜色为亮色
colorscheme solarized   "主题颜色
call togglebg#map("<F5>")   "背景颜色切换(亮色和暗色切换)
let g:solarized_termcolors=256
