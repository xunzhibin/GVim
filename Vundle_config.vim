"--------------------------------------
" Vundle���������  
" ��¡Vundle��������� git clone https://github.com/VundleVim/Vundle.vim.git /d/Vim/vimfiles/bundle/Vundle.vim
" ���� �� _vimrc �ļ��У�source $VIM/GVim/Vundle_config.vim
    " :PluginList          - �г����õĲ��
    " :PluginInstall       - ��װ���
    " :PluginInstall(!)    - ��װ(����)���
    " :PluginClean(!)      - ȷ��(���Զ���׼)ɾ��δʹ�õĲ��
"	< ������� >
"--------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" ��������·�������غͳ�ʼ��vundle 
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')


" ��Vundle���������� Vundle (�����)
Plugin 'VundleVim/Vundle.vim'

" �﷨����
Plugin 'altercation/vim-colors-solarized'

" �Զ���ȫ���š����ŵȡ�����Shift+Tab��������ȫ�ķ��ź��棬������insertģʽ
Plugin 'Raimondi/delimitMate'

" ������б༭
Plugin 'terryma/vim-multiple-cursors'

" ע�ʹ�����
Plugin 'tpope/vim-commentary'

"״̬�����(�Դ�buffer)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"����Ŀ¼���
Plugin 'scrooloose/nerdtree'

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
"	< nerdtree(����Ŀ¼) ������� >
"--------------------------------------
" �Զ�������Ŀ¼
	autocmd vimenter * NERDTree

" ����Զ��۽����Ҳ��ļ��༭��
	autocmd VimEnter * wincmd w

" �ر�����Ŀ¼ 
    "let loaded_nerd_tree=1

" ͻ����ʾ����Ŀ¼�У����������
    let NERDTreeHighlightCursorline=0

" ������Ŀ¼�У���ʾ��ǩ�б�
    let NERDTreeShowBookmarks=1

" ��ʾ����Ŀ¼���к�
	let g:NERDTreeShowLineNumbers=1
" ��������Ŀ¼��λ��
    let NERDTreeWinPos='left'
" ��������Ŀ¼���ڴ�С
    let NERDTreeWinSize=31

"--------------------------------------
"	< vim-colors-solarized(�﷨�������) ������� >
"--------------------------------------
syntax enable           "���� �﷨����
set background=dark     "���ñ�����ɫΪ��ɫ
"set background=light    "���ñ�����ɫΪ��ɫ
colorscheme solarized   "������ɫ
call togglebg#map("<F5>")   "������ɫ�л�(��ɫ�Ͱ�ɫ�л�)
let g:solarized_termcolors=256

"--------------------------------------
"	< vim-multiple-cursors(������б༭) ������� >
"--------------------------------------
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
