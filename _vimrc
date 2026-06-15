" 挙動をvi互換ではなく、Vimのデフォルト設定にする
set nocompatible " Be iMproved
" 一旦ファイルタイプ関連を無効化する
filetype off

" プラグインマネージャの設定
set runtimepath+=~/.vim/bundle/dein.vim

" Required:
call dein#begin(expand('~/.vim/bundle/dein.vim'))

call dein#add('Shougo/dein.vim')


" vim-lsp関係
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('mattn/vim-lsp-icons')

call dein#add('hrsh7th/vim-vsnip')
call dein#add('hrsh7th/vim-vsnip-integ')

" 整形ツール
call dein#add('junegunn/vim-easy-align')

" Gitを便利に使う
call dein#add('tpope/vim-fugitive')

" コメントON/OFFを手軽に実行
call dein#add('tomtom/tcomment_vim')
" シングルクオートとダブルクオート入れ替え等
call dein#add('tpope/vim-surround')
" Markdownプレビュー用
call dein#add('mattn/previm')

" インデントに色をつけて見えやすくする
call dein#add('nathanaelkane/vim-indent-guides')
" 行末の半角スペースを可視化
call dein#add('bronson/vim-trailing-whitespace')
" PlantUML用のsyntaxハイライト
call dein#add('aklt/plantuml-syntax')
" todo.txt用のプラグイン
call dein#add('freitass/todo.txt-vim')
" pythonのコードをpep8のインデントに対応
call dein#add('Vimjas/vim-python-pep8-indent')

" あいまい検索用プラグイン
call dein#add('junegunn/fzf', { 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'merged': 0 })

" プロジェクトのルートを自動で検索する
call dein#add('mattn/vim-findroot')

" Vue用syntax
call dein#add('posva/vim-vue')

call dein#end()

" 未インストールのものがあればインストールする
if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on

"""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" 各種オプションの設定
"""""""""""""""""""""""""""""""
" スワップファイルは使用しない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウィンドウのタイトルバーにファイルのパス情報などを表示する
set title
" コマンドラインモードで<tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定
set backupdir=$HOME/.vimbackup
" アンドゥファイルディレクトリの指定
set undodir=$HOME/.vimundo
" 永続アンドゥ設定
set undofile
" バッファで開いているファイルのディレクトリでエクスプローラを開始する
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色にあわせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示しない
set nolist
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
" カーソルを行頭、行末でとまらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 挿入モード時、カーソル位置より前の文字を削除できるようにする
set backspace=indent,eol,start
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
silent! set termguicolors
colorscheme desert
" 全角文字幅の設定
set ambiwidth=double
" 行番号の色
highlight LineNr ctermfg=darkyellow
" ビープ音を鳴らさない
set visualbell t_vb=
" Gvim時、メニュー、ツールバーを非表示にする
"set guioptions-=m
"set guioptions-=T
"""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------------
" 各プラグインの設定
"-----------------------------------------------------------------------------
" ------------------
" vim-indent-guides
" ------------------
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ---------------------
" vim-easy-align
" ---------------------
vmap <Enter> <Plug>(EasyAlign)

"---------
" Lsp設定
"---------
" LSP関連のショートカット設定
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc')
    setlocal tagfunc=lsp#tagfunc
  endif

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" vim-vueの設定
let g:vue_pre_processors = 'detect_on_enter'
"--------------------------------------------------------------------------
"言語毎の設定
"--------------------------------------------------------------------------
augroup vimrc
autocmd FileType perl   setlocal smartindent ts=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal smartindent softtabstop=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType python setlocal commentstring=#%s
autocmd FileType c      setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType cpp    setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType cc     setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType java   setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby   setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType Makefile setlocal smartindent ts=4 shiftwidth=4 tabstop=4 noexpandtab
augroup END


" grepをripgrepをデフォルトに
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


function! s:project_root() abort
  let l:dir = expand('%:p:h')
  if empty(l:dir)
    let l:dir = getcwd()
  endif

  for l:marker in ['.git', '.hg', '.svn', 'package.json', 'pyproject.toml', 'Cargo.toml', 'go.mod']
    let l:marker_path = finddir(l:marker, l:dir . ';')
    if !empty(l:marker_path)
      return fnamemodify(l:marker_path, ':p:h:h')
    endif

    let l:marker_path = findfile(l:marker, l:dir . ';')
    if !empty(l:marker_path)
      return fnamemodify(l:marker_path, ':p:h')
    endif
  endfor

  return getcwd()
endfunction

function! s:prj_grep(keyword, path) abort
  let l:path = substitute(a:path, '\\', '/', 'g')
  if l:path =~# '/$'
    let l:path .= '**'
  endif
  execute 'grep' '-i' shellescape(a:keyword) '-g' shellescape(l:path) shellescape(s:project_root())
  cwindow
endfunction
command! -nargs=+ -complete=customlist,CompletionPgrep Pgrep call s:prj_grep(<f-args>)

command! -nargs=+ -complete=customlist,CompletionPgrep Tgrep call s:prj_grep(<f-args>)
function! s:complete_project_path(arglead) abort
  let l:root = substitute(fnamemodify(s:project_root(), ':p'), '\\', '/', 'g')
  if l:root !~# '/$'
    let l:root .= '/'
  endif

  let l:lead = substitute(a:arglead, '\\', '/', 'g')
  let l:candidates = []
  for l:path in glob(l:root . l:lead . '*', 0, 1)
    let l:normalized = substitute(fnamemodify(l:path, ':p'), '\\', '/', 'g')
    if stridx(l:normalized, l:root) != 0
      continue
    endif

    let l:relative_path = l:normalized[len(l:root):]
    if empty(l:relative_path)
      continue
    endif
    if isdirectory(l:path) && l:relative_path !~# '/$'
      let l:relative_path .= '/'
    endif
    call add(l:candidates, l:relative_path)
  endfor

  return sort(l:candidates)
endfunction

function! CompletionPgrep(ArgLead, CmdLine, CursorPos)
  if a:CmdLine !~# '^\S\+\s\+\S\+\s'
    return []
  endif

  return s:complete_project_path(a:ArgLead)
endfunction

" filetypeの自動検出(最後のほうに書いたほうがいいらしい)
filetype on
