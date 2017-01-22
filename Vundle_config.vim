" Vundle���������  
" ��װvim��Ŀ¼ git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
" ���� �� _vimrc �ļ��У�source $VIM/GVim/Vundle_config.vim

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$VIM/bundle/Vundle.vim
call vundle#begin('$VIM/bundle/Vundle.vim')

" Vundle�������(����)
Plugin 'VundleVim/Vundle.vim'
" �﷨�������
Plugin 'altercation/vim-colors-solarized'
"�Զ���ȫ���š����ŵ�
Plugin 'Raimondi/delimitMate'

call vundle#end()            " required
filetype plugin indent on    " required

" �﷨�������(altercation/vim-colors-solarized)
syntax enable           "���� �﷨����
set background=dark     "���ñ�����ɫΪ��ɫ
"set background=light    "���ñ�����ɫΪ��ɫ
colorscheme solarized   "������ɫ
call togglebg#map("<F5>")   "������ɫ�л�(��ɫ�Ͱ�ɫ�л�)
let g:solarized_termcolors=256
