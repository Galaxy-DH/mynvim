

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com.cnpmjs.org/sickill/vim-monokai.git'
    Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline.git'       
    Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline-themes' "airline 的主题
    Plug 'https://github.com.cnpmjs.org/neoclide/coc.nvim.git', {'branch': 'release'}
    "Plug 'https://github.com.cnpmjs.org/clangd/coc-clangd.git'
    Plug 'https://github.com.cnpmjs.org/dense-analysis/ale.git'
    Plug 'jiangmiao/auto-pairs'
    Plug 'https://github.com.cnpmjs.org/KeitaNakamura/neodark.vim.git'
    "Plug 'nine2/vim-copyright'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'https://github.com.cnpmjs.org/rakr/vim-one.git'
    Plug 'ayu-theme/ayu-vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'tomasr/molokai'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'https://github.com.cnpmjs.org/sheerun/vim-polyglot.git'
    Plug 'https://github.com.cnpmjs.org/yuttie/inkstained-vim.git'
    Plug 'https://github.com.cnpmjs.org/hzchirs/vim-material.git'
call plug#end()
set cursorcolumn
set cursorline
set pastetoggle=<F9>


""DoxygenToolkit
" Doxygen for C
let g:DoxygenToolkit_commentType="C"
let g:DoxygenToolkit_dateTag="@modify \t"
let g:DoxygenToolkit_briefTag_pre="@brief \t"
let g:DoxygenToolkit_paramTag_pre="@param[] \t"
let g:DoxygenToolkit_returnTag="@return \t"
let g:DoxygenToolkit_authorTag="@author \t"
let g:DoxygenToolkit_versionTag="@version \t"
let g:DoxygenToolkit_authorName="xiaoyehua<me@xiaoyehua.net>"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes" "insert white line
let g:DoxygenToolkit_cinoptions="c0C1" " First '*' indent whitespace default=c1C1
nmap ,hh :DoxAuthor<CR><ESC>k8==j$a
nmap ,ff :Dox<CR><ESC>k8==j$a<TAB>
nmap ,da :DoxAuthor<CR><ESC>k8==
nmap ,db :DoxBlock<CR><ESC>k8==
"
let g:file_copyright_name = "xiaoyehua"
let g:file_copyright_email = "me@xiaoyehua.net"
let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java']
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \}

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <lug>(coc-diagnostic-prev)
nmap <silent> ]g <lug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <lug>(coc-definition)
nmap <silent> gy <lug>(coc-type-definition)
nmap <silent> gi <lug>(coc-implementation)
nmap <silent> gr <lug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <lug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <lug>(coc-format-selected)
nmap <leader>f  <lug>(coc-format-selected)

augroup mygroup
        autocmd!
            " Setup formatexpr specified filetype(s).
            "     autocmd FileType typescript,json setl
            "     formatexpr=CocAction('formatSelected')
            "         " Update signature help on jump placeholder
            "             autocmd User CocJumplaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <lug>(coc-codeaction-selected)
nmap <leader>a  <lug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <lug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <lug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <lug>(coc-funcobj-i)
xmap af <lug>(coc-funcobj-a)
omap if <lug>(coc-funcobj-i)
omap af <lug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'angr'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <lug>AirlineSelectTab1
nmap <leader>2 <lug>AirlineSelectTab2
nmap <leader>3 <lug>AirlineSelectTab3
nmap <leader>4 <lug>AirlineSelectTab4
nmap <leader>5 <lug>AirlineSelectTab5
nmap <leader>6 <lug>AirlineSelectTab6
nmap <leader>7 <lug>AirlineSelectTab7
nmap <leader>8 <lug>AirlineSelectTab8
nmap <leader>9 <lug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
" nmap <leader>- <lug>AirlineSelectrevTab
" " 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
" nmap <leader>+ <lug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 
filetype plugin on
" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double
set t_ut= " 防止vim背景颜色错误
set showmatch " 高亮匹配括号
set matchtime=1
set report=0
set ignorecase
set nocompatible
set noeb
set softtabstop=4
set shiftwidth=4
set nobackup
set autoread
set nocompatible
set nu "设置显示行号
set backspace=2 "能使用backspace回删
syntax on "语法检测
set ruler "显示最后一行的状态
set laststatus=2 "两行状态行+一行命令行
set ts=4
set expandtab
set autoindent "设置c语言自动对齐
" set mouse=a "设置可以在VIM使用鼠标
set selection=exclusive
" set selectmode=mouse,key
set tabstop=4 "设置TAB宽度
set history=1000 "设置历史记录条数   
" 配色方案
" let g:seoul256_background = 234
" colo monokai
 colo molokai
"set background=light
"colorscheme one
"共享剪切板
set clipboard+=unnamed 
set cmdheight=3
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set updatetime=300
set shortmess+=c
set signcolumn=yes

" autocmd FileType json syntax match Comment +\/\/.\+$+

set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠

" hi Normal ctermfg=252 ctermbg=none "背景透明
" au FileType gitcommit,gitrebase let g:gutentags_enabled=0

