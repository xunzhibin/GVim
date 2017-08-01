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

"显示英文帮助
	set helplang=en

if has("win16") || has("win32") || has("win64") || has("win95")
	"解决菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

	"解决consle输出乱码
	language messages zh_CN.utf-8
endif


""""""""""""""""""""""
"      窗口、字体
""""""""""""""""""""""
	set shortmess=atI				"启动的时候不显示那个援助索马里儿童的提示

	"set lines=60 columns=200			"窗口大小 行=lines 列=columns
	autocmd GUIEnter * simalt ~x		"自动最大化
    set guioptions-=T                   "隐藏窗口上侧工具栏
    set guioptions-=m                   "隐藏窗口上侧菜单栏
    set guioptions-=r                   "隐藏窗口右侧的滚动条
    set guioptions-=L                   "隐藏窗口左侧的滚动条
    set guioptions-=b                   "隐藏窗口底部的滚动条
	set guifont=Source_Code_Pro:h14		"设置字体
    set ambiwidth=double                "防止特殊符号无法正常显示



""""""""""""""""""""""
"      行、列
""""""""""""""""""""""
	set number			"显示行号
	set nowrap			"不要换行 
	set cursorline		"高亮显示当前行
	set cursorcolumn	"高亮显示当前列
	"set relativenumber	"显示相对的行号 show relative line number
	set scrolloff=7		"设定光标离窗口上下边界 n 行时窗口自动滚动
	"autocmd InsertEnter * :set norelativenumber " 在插入模式中没有相对数字
	"autocmd InsertLeave * :set relativenumber   " 在保持插入模式时显示相对数字

""""""""""""""""""""""
"      鼠标
""""""""""""""""""""""
	"set mouse-=a		"禁用鼠标


""""""""""""""""""""""
"      文本
""""""""""""""""""""""
	set t_ti= t_te=				"退出vim后，内容显示在终端屏幕
	set selection=inclusive		"选择文本时，光标所在位置也属于被选中的范围
	set selectmode=mouse,key
	set title					"改变终端的标题
	set novisualbell			" 不要闪烁 " don't beep
	set noerrorbells			" 不让vim发出讨厌的滴滴声
	set t_vb=					"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
	set tm=500
	set nostartofline			"在缓冲区之间切换时保持光标位置
	set showmatch				"设置匹配模式，显示匹配的括号
	set mat=2					"当匹配括号的时候，眨眼的时间是多少
	set hidden					"允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存(没有保存的缓冲区可以自动隐藏)
	set wildmode=longest:full,full
	set ttyfast
	set ffs=unix,dos,mac			" Use Unix as the standard file type
	set formatoptions+=m			"如遇Unicode值大于255的文本，不必等到空格再折行。
	set formatoptions+=B			"合并两行中文时，不在中间加空格（当连接行时，不要在两个多字节字符之间插入空格）
	set completeopt=longest,menu	"自动补全配置,让Vim的补全菜单行为与一般IDE一致
	set wildmenu					" 增强模式中的命令行自动完成操作（自动完成命令）（自身命令行模式智能补全）
	set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class		" Ignore compiled files （tab键的自动完成现在会忽略这些 ）



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
"      tab键
""""""""""""""""""""""
	set expandtab		"将tab键转为空格
	set tabstop=4		"一个tab键占4个空格
	set softtabstop=4	"编辑模式时,退格键的退回为4个空格
	set shiftwidth=4	"tab键自动缩进时,宽度为4个空格
	
	set smartindent		"在这种缩进模式中,每一行都和前一行有相同的缩进量,同时能正确的识别出花括号,当遇到右花括号（}）,则取消缩进形式
	set autoindent		"自动缩进(对齐),每行的缩进值与上一行相等
	set smarttab		"在行和段开始处使用制表符
	set shiftround		"使用 < 和 > 进行缩进时 依shiftwidth 调整宽度


""""""""""""""""""""""
"      backspace键
""""""""""""""""""""""
	set backspace=eol,start,indent		"配置backspace 使退格键（backspace）使用此顺序; 正常处理indent, eol, start等 
	set whichwrap+=<,>,h,l				"允许backspace和光标键跨越行边界(不建议)


""""""""""""""""""""""
"      快捷键
""""""""""""""""""""""
	set pastetoggle=<F5>		"F5快捷键来激活/取消 paste模式(粘贴模式)


""""""""""""""""""""""
"      搜索
""""""""""""""""""""""	
	set ignorecase		"搜索模式里忽略大小写
    set hlsearch        "高亮显示搜索结果
    set incsearch       "搜索时,直接高亮
	set smartcase		"如果搜索模式全是小写的，则忽略大小写，否则不区分大小写
    set nowrapscan      "搜索到文件两端时,不重新搜索
	set viminfo^=%		" Remember info about open buffers on close
	set magic			" 设置魔术（对于正则表达式，可以打开魔法）


""""""""""""""""""""""
"      命令行、状态栏
""""""""""""""""""""""
    set cmdheight=2		"命令行高度
	set showcmd			"命令行显示输入的命令
	set showmode		"命令行显示vim当前模式
	set ruler			"标尺，命令行显示光标位置的行号和列号，逗号分隔
	set history=200		"记录冒号命令的历史行数
	set noshowmode		"显示当前模式

	if has('statusline')
		set laststatus=2							"将状态行显示在窗口底部倒数第二行
		set statusline=%<%f\						" 文件名
		set statusline+=%w%h%m%r					" 选项
		"set statusline+=%{fugitive#statusline()}	" Git Hotness
		set statusline+=\ [%{&ff}/%Y]				" 文件类型
		set statusline+=\ [%{getcwd()}]				" 当前dir
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%		" 右对齐文件导航信息
	endif


""""""""""""""""""""""
"      代码折叠
""""""""""""""""""""""
	set foldenable			"代码折叠
	set foldmethod=indent	"代码折叠方式: manual(手工定义折叠) indent(用缩进表示折叠) expr(用表达式来定义折叠) syntax(用语法高亮来定义折叠) diff(对没有更改的文本进行折叠) marker(用标志折叠)
	set foldlevel=99		"显示折叠的级别