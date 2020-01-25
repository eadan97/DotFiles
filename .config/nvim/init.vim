"=================================================================
"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
" ~SeraphyBR Neovim Config
"================================================================

" Auto install vim-plug and Plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
"
Plug 'Shougo/denite.nvim'

" Print infos in echo area
Plug 'Shougo/echodoc.vim'

"
Plug 'janko/vim-test'

" Git status support for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Display the indentation levels with thin vertical lines
Plug 'Yggdroot/indentline'

" Templates
Plug 'aperezdc/vim-template'

" Support for specific files related to portage
Plug 'gentoo/gentoo-syntax'

" Markdown Line Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Latex support
Plug 'lervag/vimtex', { 'for': 'tex' }

" Viewer for Symbols and Ctags
Plug 'liuchengxu/vista.vim'

" Graphic viewer for keybinds
Plug 'liuchengxu/vim-which-key'

" Rainbow Parentheses Improved
Plug 'luochen1990/rainbow'

"
Plug 'matze/vim-move'

" Undo history visualizer
Plug 'mbbill/undotree'

" Start Screen for vim
Plug 'mhinz/vim-startify'

" Color scheme
Plug 'morhetz/gruvbox'

" Completion support and Language server Client
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Icons for vim plugins
Plug 'ryanoasis/vim-devicons'

" File explorer
Plug 'scrooloose/nerdtree'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Extra syntax highlighting for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"
Plug 'tpope/vim-eunuch'

" Git Wrapper inside Vim
Plug 'tpope/vim-fugitive'

" Awesome Keybinds
Plug 'tpope/vim-unimpaired'

" Status Line
Plug 'vim-airline/vim-airline'

" Themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Linting support
Plug 'w0rp/ale'
call plug#end()

" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
set autoindent               " Auto-indent new lines
set background=dark
set clipboard=unnamedplus
set cursorline              " Highlight cursor line
set encoding=utf-8          " Define o encoding exibido no terminal
set expandtab               " Use spaces instead of tabs
set fileencoding=utf-8      " Define o encoding na escrita dos arquivos
set hidden
set hlsearch                " Highlight all search results
set ignorecase              " Always case-insensitive
set inccommand=split
set incsearch                     " Searches for strings incrementally
set linebreak                     " Break lines at word (requires Wrap lines)
set list listchars=trail:·,tab:>· " Show trailing spaces as dots
set mouse=a                 " Enable mouse. see :help mouse for info.
set noshowmode
set number                  " Show line numbers
set pumblend=11             " pseudo-transparent popup menu
set pumheight=10
set relativenumber
set scrolloff=1000           " Always show N lines above/below the cursor
set shell=/bin/zsh
set shiftwidth=4            " Number of auto-indent spaces
set showbreak=+++           " Wrap-broken line prefix
set showmatch               " Highlight matching brace
set smartcase               " Enable smart-case search
set smartindent             " Enable smart-indent
set smarttab                " Enable smart-tabs
set softtabstop=4           " Number of spaces per Tab
set spelllang=pt_br,en_us
set splitbelow
set termguicolors
set textwidth=110                    " Line wrap (number of cols)
set virtualedit=insert,block,onemore " Permite mover o cursor onde não há texto
set visualbell                       " Use visual bell (no beeping)
set wildmenu
set wildmode=full

set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz,*.docx,*.ppt,*.odt
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.jar,*.iso
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=.git,.hg,.svn

"" Advanced:
set backspace=indent,eol,start " Backspace behaviour
set ruler                      " Show row and column ruler information
set undolevels=1500            " Number of undo levels

"" Persistent Undo:
" Let's save undo info!
if !isdirectory($HOME."/.config/nvim/undo-dir")
    call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif
set undodir=~/.config/nvim/undo-dir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-which-key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ }

"" Airline status line:
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"" ALE section:
let g:ale_linters = {
            \ 'python': ['pyls']
            \ }

"" COC section:
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-git',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-marketplace',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-project',
            \ 'coc-rls',
            \ 'coc-snippets',
            \ 'coc-tabnine',
            \ 'coc-vimlsp',
            \ 'coc-vimtex',
            \ 'coc-yaml',
            \ 'coc-yank'
            \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"" vim-test
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'basic',
\}

"" Rainbow Parentheses Improved
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['#FFD700','#C466C0','#7AB9E0']}

"" Vista:
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = "coc"

"" IndentLine:
let g:indentLine_char= '│'
let g:indentLine_fileTypeExclude = ['markdown']

"" Custom Templates:
if !isdirectory($HOME."/.config/nvim/templates")
    call mkdir($HOME."/.config/nvim/templates", "", 0700)
endif
let g:templates_directory = [ '~/.config/nvim/templates' ]
let g:templates_detect_git = 1

" Vimtex:
let g:vimtex_view_general_viewer = 'zathura'

"" Prettier:
let g:prettier#config#print_width = 100
let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4

"" Disable conceal ("Hiding tag"):
let g:tex_conceal = ''
let g:vim_markdown_conceal = 0

"" Syntax Hightlighting:
syntax on

"" Colorscheme Section:
if empty($DISPLAY)
    colorscheme default
else
    colorscheme gruvbox
    let g:gruvbox_contrast_dark='hard'
    "" Transparent backgroud
    hi Normal guibg=#00282828
endif

"" NERDtree Section:
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 42
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeRespectWildIgnore = 1

"" Startify Section:
let g:startify_files_number = 8
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:ascii = [
            \' _______                ___ ___  __ ',
            \'|    |  |.-----..-----.|   |   ||__|.--------. ',
            \'|       ||  -__||  _  ||   |   ||  ||        |   ',
            \'|__|____||_____||_____| \_____/ |__||__|__|__|   ',
            \]
let g:startify_custom_header = 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]
let g:startify_commands = [ {'t': ['Open a new Terminal', ':terminal']} ]
let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   My most recently used files in the current directory: '. getcwd()] },
            \ { 'type': 'files',     'header': ['   My most recently used files:'] },
            \ { 'type': 'sessions',  'header': ['   Sessions:']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks:']      },
            \ { 'type': 'commands',  'header': ['   Commands:']       },
            \ ]

"" Denite Section:
call denite#custom#option('default', {
            \ 'auto_resize': 1,
            \ 'prompt': '  :',
            \ 'direction': 'rightbelow',
            \ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Shortcuts:

" Abre um painel com um historico de modificacoes
nnoremap <F5> :UndotreeToggle<cr>

" Substitui a palavra sobre o cursor com a ultima palavra copiada.
" Para copiar uma palavra: yiw
nnoremap CC diw"0P

" Coc-yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Corrigir erros de escrita com ctrl+L (Modo de inserção)
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Fix indentation on entire file
noremap <F7> mzgg=G`z

" Remove trailing whitespaces at the end of each line
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F6>   m`:TrimSpaces<CR>``

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ALE quick navigate between errors:
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" AutoStart:
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType tex,gitcommit,text,markdown setlocal spell
autocmd StdinReadPre * let s:std_in=1
autocmd TermOpen * call SetTermOptions()
autocmd VimEnter *
            \   if !argc()
            \ |   setlocal nowrap
            \ |   Startify
            \ | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Functions:
function SetTermOptions()
    setlocal nonumber
    setlocal norelativenumber
    IndentLinesDisable
    startinsert
endfunction

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

"" https://vim.fandom.com/wiki/Remove_unwanted_spaces
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

"" https://vim.fandom.com/wiki/Remove_unwanted_spaces
function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction
