set nocompatible
filetype off


set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

"set fileencodings=utf8,cp936,gb18030,big5

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"call vundle#end()
"filetype plugin indent on
call plug#begin('~/.vim/plugged')
" Use release branch (Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
"Plug 'Raimondi/delimitMate'
"Plug 'Valloric/YouCompleteMe'
Plug 'habamax/vim-psionic'
Plug 'voldikss/vim-floaterm'
call plug#end()

" configuration for floaterm 
source ~/.vim/init/floaterm.vim


" ************ basic setting for vim
set cursorline
syntax enable
set termguicolors
colorscheme psionic
set background=light
set ts=4
set tabstop=4
set shiftwidth=4    " Indents will have a width of 4
set expandtab
set cindent
"set autoindent
set number 
"set pastetoggle=<C-e>
"set paste=<C-w>
"set paste
set noautoindent
set backspace=indent,eol,start
set tags=./.tags;,.tags
set guifont=SFMonoPowerline-Regular:h15

" ###### some shortcut
" vim-powered terminal in split window
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>

" change buffers
"nmap <C-Right> :bnext<CR> 
noremap <C-x><C-Left> :bn<CR>
noremap <C-p> :bp<CR>


"############################### Airline 
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set noshowmode
"let g:indentLine_color_term = 239 " adjust the color of indentLine 
let g:airline#extensions#tabline#enabled = 1  "Automatically displays all buffers when there's only one tab open.
"let g:airline_section_... = 0
let g:airline_powerline_fonts = 1
let g:airline_section_error = ''
let g:airline_section_warning = ''  " delete the last part of status line
let g:airline_theme='light'
let g:vim_json_syntax_conceal = 0
if !exists('g:airline_symbols')
          let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"############################ Airline
let delimitMate_matchpairs = "(:),[:],{:},<:>"

let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1



"#################### LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap ff :LeaderfFile<CR>
noremap fb :LeaderfBuffer<CR>
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_ShowDevIcons = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"############################ LeaderF
"
"############################ set wildmenu
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>
nnoremap <c-n> :b <c-z>
nnoremap mm :vertical sb <c-z>
"############################ set wildmenu


"**************************** gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+pxlzD'] " 将默认关闭的全都打开 详情可见 ctags --list-kinds=c 
"setlocal tags+=... 

"*************************** Asyncrun
" For plugin asyncrun
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

