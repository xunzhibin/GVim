""""""""""""""""""""""
"      设置编码
""""""""""""""""""""""
"Vim的工作原理
"1、 Vim启动,根据encoding的值来设置buffer、菜单文本、消息文的字符编码方式（强烈建议将encoding设置为utf-8）
"2、 读取需要编辑的文件,根据fileencodings中列出的字符编码方式逐一探测该文件编码方式,并设置fileencoding为探测到的,看起来是正确的字符编码方式
"3、 对比fileencoding和encoding的值,若不同则调用iconv将文件内容转换为encoding所描述的字符编码方式,并且把转换后的内容放到为此文件开辟的buffer里,此时我们就可以开始编辑这个文件了
"4、 编辑完成后保存文件时,再次对比fileencoding和encoding的值.若不同,再次调用iconv将即将保存的buffer中的文本转换为fileencoding所描述的字符编码方式,并保存到指定的文件中
"
"fileencodings	编码的自动识别,是一个用逗号分隔的复数形式列表,列表中的每一项是一种编码的名称
"当我们打开文件的时候,VIM按顺序使用fileencodings中的编码进行尝试解码,如果成功的话,就使用该编码方式进行解码,并将fileencoding设置为这个值,如果失败的话,就继续试验下一个编码
"因此,我们在设置fileencodings的时候,一定要把要求严格的,当文件不是这个编码的时候更容易出现解码失败的编码方式放在前面,把宽松的编码方式放在后面
"
"fileencoding	当前编辑的文件的字符编码方式,Vim保存文件时也会将文件保存为这种字符编码方式
"当Vim从磁盘上读取文件的时候,会对文件的编码进行探测.如果文件的编码方式和Vim的内部编码方式不同,Vim就会对编码进行转换
"转换完毕后,Vim会将fileencoding选项设置为文件的编码.当Vim存盘的时候,如果encoding和fileencoding不一样,Vim就会进行编码转换
"
"encoding	是Vim内部使用的字符编码方式,当我们设置了encoding之后,Vim内部所有的buffer、寄存器、脚本中的字符串等,全都使用这个编码
"Vim 在工作的时候,如果编码方式与它的内部编码不一致,它会先把编码转换成内部编码.如果工作用的编码中含有无法转换为内部编码的字符,在这些字符就会丢失
"
"termencoding	用于屏幕显示的编码
"在显示的时候,Vim会把内部编码转换为屏幕编码,再用于输出.内部编码中含有无法转换为屏幕编码的字符时,该字符会变成问号,但不会影响对它的编辑操作
"如果termencoding没有设置,则直接使用encoding不进行转换

	set encoding=utf-8	"Vim内部使用的字符编码方式
    set fileencoding=utf-8  "当前编辑文件的编码方式
	set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1	"文件自动识别的编码方式
	set termencoding=utf-8	"屏幕显示的编码方式

"解决菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

"解决consle输出乱码
	language messages zh_CN.utf-8

"显示中文帮助（将vimcdoc-1.8.0/doc目录下的文件(Vim 7.3)，复制到~/vimfiles/doc目录中）
	"set helplang=cn

""""""""""""""""""""""
"      窗口、字体
""""""""""""""""""""""
	set lines=29 columns=108			"窗口大小 行=lines 列=columns
    set guioptions-=T                   "隐藏窗口上侧工具栏
    set guioptions-=m                   "隐藏窗口上侧菜单栏
    set guioptions-=r                   "隐藏窗口右侧的滚动条
    set guioptions-=L                   "隐藏窗口左侧的滚动条
    set guioptions-=b                   "隐藏窗口底部的滚动条
	set guifont=Source_Code_Pro:h14		"设置字体（将SourceCodePro_FontsOnly/TTF目录下的文件，复制到windows系统fonts字体目录下）
    set ambiwidth=double                "防止特殊符号无法正常显示

""""""""""""""""""""""
"      行
""""""""""""""""""""""
	set nu!			"显示行号
	set cursorline	"突出显示当前行

""""""""""""""""""""""
"      文件
""""""""""""""""""""""
	set nobackup	"从不备份(文件保存时，不产生~备份文件)
	set noswapfile	"不产生交换文件(文件编辑时，不产生.swp交换文件)
	set autoread	"自动重新读入(当打开文件在外部被修改，自动更新该文件)
    
"文件类型检测
"   detection	on:自动检测文件类型
"   plugin		on:运行时环境目录下加载该类型相关的插件
"   indent		on:不同文件类型选择合适的缩进方式了
"
    "filetype plugin indent on

""""""""""""""""""""""
"      tab缩进
""""""""""""""""""""""
	set expandtab		"将tab键转为空格
	set tabstop=4		"一个tab键占4个空格
	set softtabstop=4	"编辑模式时,退格键的退回为4个空格
	set shiftwidth=4	"tab键自动缩进时,宽度为4个空格
	
	"set smartindent		"在这种缩进模式中,每一行都和前一行有相同的缩进量,同时能正确的识别出花括号,当遇到右花括号（}）,则取消缩进形式
	set autoindent		"自动缩进(对齐),每行的缩进值与上一行相等
	
""""""""""""""""""""""
"      搜索
""""""""""""""""""""""	
	set ignorecase		"搜索模式里忽略大小写
    set hlsearch        "高亮显示搜索结果
    set incsearch       "搜索时,直接高亮
    "set nowrapscan      "搜索到文件两端时,不重新搜索
	
""""""""""""""""""""""
"      自动补全
""""""""""""""""""""""
	inoremap ( ()<ESC>
	inoremap { {}<esc>
	inoremap [ []<ESC>
	inoremap < <><ESC>
	inoremap ' ''<ESC>
	inoremap " ""<ESC>

""""""""""""""""""""""
"      命令行
""""""""""""""""""""""
    set cmdheight=2 "命令行高度
	set showcmd		"命令行显示输入的命令
	set showmode	"命令行显示vim当前模式
	set ruler		"标尺，命令行显示光标位置的行号和列号，逗号分隔
