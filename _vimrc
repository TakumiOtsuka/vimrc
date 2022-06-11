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

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('Shougo/neomru.vim')

call dein#add('Shougo/vimproc.vim')

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
call dein#add('junegunn/fzf', { 'do': './install --bin' })
call dein#add('junegunn/fzf.vim')

" 非同期でlinterを実行してくれるプラグイン
call dein#add('dense-analysis/ale')

" プロジェクトのルートを自動で検索する
call dein#add('mattn/vim-findroot')

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
set termguicolors
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" ビープ音を鳴らさない
set visualbell t_vb=
" Gvim時、メニュー、ツールバーを非表示にする
set guioptions-=m
set guioptions-=T
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
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enable = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" Uniteで使用するgrepをripgrepに
if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_opts = '-n --no-heading --color never'
  let g:unite_source_grep_recursive_opt = ''
endif

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

" Windowsの場合フォントをRictyに指定
if has('win32')
  set printfont=Ricty\ Diminished\ Discord:h13.5
  set guifont=Ricty\ Diminished\ Discord:h13.5
" Macの場合はフォントをOsakaフォントに設定
elseif has('mac')
  set printfont=Osaka-Mono:h18
  set guifont=Osaka-Mono:h18
" Linuxの場合はフォントをRictyに指定
elseif has('unix')
  set printfont=Ricty\ Diminished\ Discord\ 13
  set guifont=Ricty\ Diminished\ Discord\ 13
endif

" grepをripgrepをデフォルトに
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
    let s:rc_path = fnamemodify(i, ":h")
  endfor
endfunction

function! s:prj_grep(keyword, path) abort
  if executable('rg')
    execute 'grep' "-i" a:keyword "-g" a:path s:rc_path
  else
    execute 'vimgrep' a:keyword s:rc_path . "**/" . a:path
  endif
  cwindow
endfunction
command! -nargs=+ -complete=file Pgrep call s:prj_grep(<f-args>)

command! -nargs=+ -complete=customlist,CompletionGitCommands Git call GitCommand(<q-args>)
function! CompletionGitCommands(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)
  if l:len_cmd <= 1
    " Commands name completion.
    let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
    return filter(['add', 'bisect', 'branch', 'checkout', 'clone', 'commit', 'diff', 'fetch'
          \'grep', 'init', 'log', 'merge', 'mv', 'pull', 'push', 'rebase', 'reset', 'rm',
          \'show', 'status', 'tag'], l:filter_cmd)
  else
    " Commands argments completion.
    let l:cmdname = l:cmd[1]
    if l:cmdname == 'add' || l:cmdname == 'mv' || l:cmdname == 'rm'
      let l:arg = get(l:cmd, 2, '')
      return split(glob(l:arg, '*'), '\n')
    else
      return[]
endfunction

command! -nargs=+ -complete=customlist,CompletionPgrep Tgrep call s:prj_grep(<q-args>)
function! CompletionPgrep(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)

  if l:len_cmd > 1
    let l:arg = get(l:cmd, 1, '')
    return split(glob(s:rc_path . '/' . l:arg . '*'), '\n')
  else
    return[]
endfunction

" filetypeの自動検出(最後のほうに書いたほうがいいらしい)
filetype on
