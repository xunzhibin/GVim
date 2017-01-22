" Vundle���������  
" ��װvim��Ŀ¼ git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
" ���� �� _vimrc �ļ��У�source $VIM/GVim/Vundle_config.vim

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$VIM/bundle/Vundle.vim
call vundle#begin('$VIM/bundle/Vundle.vim')

" Vundle�������(����)
Plugin 'VundleVim/Vundle.vim'
" �﷨����
Plugin 'altercation/vim-colors-solarized'
" �Զ���ȫ���š����ŵȡ�����Shift+Tab��������ȫ�ķ��ź��棬������insertģʽ
Plugin 'Raimondi/delimitMate'
" ������б༭
Plugin 'terryma/vim-multiple-cursors'
" ע�ʹ�����
Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required

" �﷨�������(altercation/vim-colors-solarized)
syntax enable           "���� �﷨����
set background=dark     "���ñ�����ɫΪ��ɫ
"set background=light    "���ñ�����ɫΪ��ɫ
colorscheme solarized   "������ɫ
call togglebg#map("<F5>")   "������ɫ�л�(��ɫ�Ͱ�ɫ�л�)
let g:solarized_termcolors=256


" ������б༭ 
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
