if has('python3')
endif

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'

" 可以在 vim 中使用 tab 补全
Plug 'vim-scripts/SuperTab'

" The fancy start screen for Vim. https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme github
Plug 'acarapetis/vim-colors-github'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" colorscheme one
Plug 'rakr/vim-one'

" go 插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
" 下面两个插件要配合使用，可以自动生成代码块
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
"Plug 'majutsushi/tagbar'
Plug 'preservim/tagbar'
Plug 'jstemmer/gotags'
" 代码提示
Plug 'Valloric/YouCompleteMe'

" git插件
Plug 'zivyangll/git-blame.vim'

" markdown插件
Plug 'iamcco/markdown-preview.vim'

call plug#end()

" 关闭兼容模式
set nocompatible

set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" 允许使用鼠标
set mouse=a

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释


" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.php write

" 保存文件时自动删除行尾空格或 Tab
autocmd BufWritePre * :%s/\s\+$//e

" 在状态栏显示正在输入的命令
set showcmd

"开启追踪列表选择
set cscopetag
set hlsearch

" 取消备份
set nobackup
set noswapfile

" 主题颜色
" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用
colorscheme gruvbox " 主题
set background=dark " 主题背景 dark-深色; light-浅色

set guifont=Roboto\ Mono\ Medium\ for\ Powerline:h16
set lines=35 columns=118

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

" 每次打开回到上次编辑的位置
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif

" vim-go
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

"GoLang代码提示
imap <F2> <C-x><C-o>

nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

" 结构体添加 json tag
autocmd FileType go nmap <leader>j :GoAddTags<cr>
" 填充结构体
autocmd FileType go nmap <leader>fs :GoFillStruct<cr>
" 代码添加 if err
autocmd FileType go nmap <leader>e :GoIfErr<cr>


" nerd tree
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>tf :NERDTreeFind<cr>

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusShowIgnored = 1

" YouCompleteMe插件
set completeopt=menu,menuone
" 是否显示函数原型预览窗口
let g:ycm_add_preview_to_completeopt = 0
" 显示诊断信息
let g:ycm_show_diagnostics_ui = 1
let g:ycm_server_log_level = 'info'
let g:ycm_server_keep_logfiles = 1
" 两个字符以后自动弹出的是基于符号的补全
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" 触发语义补全
let g:ycm_key_invoke_completion = '<c-z>'

let g:go_auto_type_info = 1
set updatetime=500

" mac打开谷歌浏览器配置
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

noremap <c-z> <NOP>
" 输入符号的两个字母，即可自动弹出语义补全
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }

nmap <F4> :TagbarToggle<CR>
let g:tagbar_autopreview = 1 "开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口
let g:tagbar_sort = 0 "关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_width = 30 "宽度
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'

nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>
