" 挙動をvi互換ではなく、Vimのデフォルト設定にする
set nocompatible " Be iMproved
" 一旦ファイルタイプ関連を無効化する
filetype off

set runtimepath+=~/.vim/bundle/dein.vim

" Required:
call dein#begin(expand('~/.vim/bundle/dein.vim'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('Shougo/neomru.vim')
" ファイルをtree表示してくれる
call dein#add('scrooloose/nerdtree')
" Gitを便利に使う
call dein#add('tpope/vim-fugitive')

" コメントON/OFFを手軽に実行
call dein#add('tomtom/tcomment_vim')
" シングルクオートとダブルクオート入れ替え等
call dein#add('tpope/vim-surround')

" インデントに色をつけて見えやすくする
call dein#add('nathanaelkane/vim-indent-guides')
" ログファイルを色づけしてくれる
call dein#add('vim-scripts/AnsiEsc.vim')
" 行末の半角スペースを可視化
call dein#add('bronson/vim-trailing-whitespace')
" less用のsyntaxハイライト
call dein#add('KohPoll/vim-less')

call dein#end()

" Required:
filetype plugin indent on

"""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" 各種オプションの設定
"""""""""""""""""""""""""""""""
" タグファイルの指定
set tags=~/.tags
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
" 開業時に前の行のインデントを継続する
set autoindent
" 改行時に入力された業の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vim画挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
" カーソルを行頭、行末でとまらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" ビープ音を鳴らさない
set visualbell t_vb=
"""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"--------------------------------------------------------------------------
"言語毎のインデント設定
"--------------------------------------------------------------------------
augroup vimrc
autocmd FileType perl   setlocal smartindent ts=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType python setlocal smartindent
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=8 expandtab
"autocmd FileType python setlocal foldmethod=syntax
autocmd FileType python setlocal commentstring=#%s
autocmd FileType python :inoremap # X#
autocmd FileType c      setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType cpp    setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType cc     setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType java   setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby   setlocal smartindent ts=2 shiftwidth=2 tabstop=2 expandtab
augroup END


" Windowsの場合フォントをRictyに指定
if has('win32')
  set printfont=Ricty\ Diminished\ Discord:h13.5
  set guifont=Ricty\ Diminished\ Discord:h13.5
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
  endfor
endfunction

" filetypeの自動検出(最後のほうに書いたほうがいいらしい)
filetype on

