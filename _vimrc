" 挙動をvi互換ではなく、Vimのデフォルト設定にする
set nocompatible " Be iMproved
" プラグインの読み込みが完了するまでファイルタイプ検出を停止する
filetype off

" vim-plugのプラグイン宣言を開始する
call plug#begin()

" 非同期補完の基盤
Plug 'prabirshrestha/asyncomplete.vim'
" vim-lspの補完候補をasyncompleteへ渡す
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Language Server Protocolのクライアント
Plug 'prabirshrestha/vim-lsp'
" filetypeに対応するLanguage Serverの登録とインストールを補助する
Plug 'mattn/vim-lsp-settings'
" vim-lspの診断情報をsign columnへアイコン表示する
Plug 'mattn/vim-lsp-icons'

" VSCode形式のスニペットを展開する
Plug 'hrsh7th/vim-vsnip'
" vim-lspやasyncompleteとvim-vsnipを連携する
Plug 'hrsh7th/vim-vsnip-integ'

" 選択範囲の区切り文字を基準にテキストを整列する
Plug 'junegunn/vim-easy-align'

" VimからGitコマンドを実行し、リポジトリ情報を参照する
Plug 'tpope/vim-fugitive'

" filetypeに応じてコメントの追加・解除を行う
Plug 'tomtom/tcomment_vim'
" 括弧、クォート、HTMLタグなどの囲み文字を追加・変更・削除する
Plug 'tpope/vim-surround'
" Markdownをブラウザでプレビューする
Plug 'mattn/previm'

" インデントの深さを色分けして表示する
Plug 'nathanaelkane/vim-indent-guides'
" 行末の不要な空白を強調表示し、削除コマンドを提供する
Plug 'bronson/vim-trailing-whitespace'
" PlantUMLファイルのsyntaxハイライトを追加する
Plug 'aklt/plantuml-syntax'
" todo.txt形式のsyntax、補完、操作コマンドを追加する
Plug 'freitass/todo.txt-vim'
" Pythonのインデント判定をPEP 8に合わせて改善する
Plug 'Vimjas/vim-python-pep8-indent'

" fzf本体のVim連携関数を提供する（fzf実行ファイルは別途必要）
Plug 'junegunn/fzf'
" :Files、:GFiles、:Rgなどのfzf検索コマンドを追加する
Plug 'junegunn/fzf.vim'

" ファイルを開いたときにcwdをプロジェクトルートへ自動変更する
Plug 'mattn/vim-findroot'

" Vue Single File Componentのsyntaxハイライトを追加する（現在は非活発）
Plug 'posva/vim-vue'

" プラグイン宣言を終了し、runtimepathを更新する
call plug#end()

" filetypeごとのプラグインとインデント設定を有効にする
" plug#end()でも有効になるが、ここでは意図を明示している
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
" 'ignorecase'との併用時、大文字を含む検索では大文字小文字を区別する
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
" 'list'を有効にしたときのタブと行末以降の表示文字を指定する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" C言語風の構文を判定して改行後のインデントを調整する
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
" Vim起動時からインデントガイドを有効にする
let g:indent_guides_enable_on_vim_startup = 1

" ---------------------
" vim-easy-align
" ---------------------
" 独自マッピングの先頭キーをカンマにする
let mapleader = ','
" NormalモードまたはVisualモードの,aでEasyAlignを開始する
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"---------
" vim-lsp / asyncomplete
"---------
" Language Serverが有効になったバッファへ補完・診断・キーマップを設定する
function! s:on_lsp_buffer_enabled() abort
  " Vim標準のオムニ補完からvim-lspの候補を利用する
  setlocal omnifunc=lsp#complete
  " 診断アイコンを表示する列を常に確保する
  setlocal signcolumn=yes
  if exists('+tagfunc')
    " Ctrl-]などのタグジャンプをLSPの定義検索へ接続する
    setlocal tagfunc=lsp#tagfunc
  endif

  " 定義、参照、説明、診断、リネームのショートカット
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  " vim-lspがバッファで有効になったときだけバッファローカル設定を適用する
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" 詳細ログを有効にし、ホームディレクトリのlsp.logへ出力する
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" Language Serverから受信した診断を表示する
let g:lsp_diagnostics_enabled = 1
" カーソル行の診断内容をコマンドラインへ表示する
let g:lsp_diagnostics_echo_cursor = 1
" 入力中に補完候補を自動表示する
let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
" 補完候補を表示するまで200ミリ秒待つ
let g:asyncomplete_popup_delay = 200
" Language Serverから受信したテキスト編集を適用する
let g:lsp_text_edit_enabled = 1

" Vueファイルを開いたとき、使用中のpreprocessorだけを検出して読み込む
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

" 現在のバッファを基準に、最も近いプロジェクトルートを取得する
function! s:project_root() abort
  " ファイルを開いていない場合は現在の作業ディレクトリから探索する
  let l:dir = expand('%:p:h')
  if empty(l:dir)
    let l:dir = getcwd()
  endif

  " 各マーカーを現在位置から親ディレクトリへ向かって探索する
  for l:marker in ['.git', '.hg', '.svn', 'package.json', 'pyproject.toml', 'Cargo.toml', 'go.mod']
    " .gitなど、ディレクトリとして存在するマーカーを確認する
    let l:marker_path = finddir(l:marker, l:dir . ';')
    if !empty(l:marker_path)
      return fnamemodify(l:marker_path, ':p:h:h')
    endif

    " pyproject.tomlなど、ファイルとして存在するマーカーを確認する
    let l:marker_path = findfile(l:marker, l:dir . ';')
    if !empty(l:marker_path)
      return fnamemodify(l:marker_path, ':p:h')
    endif
  endfor

  " マーカーが見つからなければ現在の作業ディレクトリを使用する
  return getcwd()
endfunction

" プロジェクトルートを検索対象にして、指定パス内をgrepする
function! s:prj_grep(keyword, path) abort
  " rgのglobとして扱いやすいようにパス区切りをスラッシュへ統一する
  let l:path = substitute(a:path, '\\', '/', 'g')
  " ディレクトリが指定された場合は、その配下すべてを検索対象にする
  if l:path =~# '/$'
    let l:path .= '**'
  endif
  " keywordを検索し、pathはプロジェクトルートからのglobとして絞り込む
  execute 'grep' '-i' shellescape(a:keyword) '-g' shellescape(l:path) shellescape(s:project_root())
  " 検索結果がある場合だけquickfixウィンドウを開く
  cwindow
endfunction
" :Pgrep {keyword} {path}。pathはプロジェクトルートからの相対パス
command! -nargs=+ -complete=customlist,CompletionPgrep Pgrep call s:prj_grep(<f-args>)

" 既存の:Tgrepも:Pgrepと同じ処理を使用する
command! -nargs=+ -complete=customlist,CompletionPgrep Tgrep call s:prj_grep(<f-args>)

" 入力中のパスに一致するファイルとディレクトリを補完候補として返す
function! s:complete_project_path(arglead) abort
  " 比較と切り出しを単純にするため、ルートを末尾スラッシュ付きに統一する
  let l:root = substitute(fnamemodify(s:project_root(), ':p'), '\\', '/', 'g')
  if l:root !~# '/$'
    let l:root .= '/'
  endif

  let l:lead = substitute(a:arglead, '\\', '/', 'g')
  let l:candidates = []
  " プロジェクトルートと入力済み文字列を連結して候補を列挙する
  for l:path in glob(l:root . l:lead . '*', 0, 1)
    let l:normalized = substitute(fnamemodify(l:path, ':p'), '\\', '/', 'g')
    " 念のためプロジェクトルート外の候補を除外する
    if stridx(l:normalized, l:root) != 0
      continue
    endif

    " grepへ渡せるよう、補完候補はフルパスではなくルート相対にする
    let l:relative_path = l:normalized[len(l:root):]
    if empty(l:relative_path)
      continue
    endif
    " ディレクトリは末尾に/を付け、続きの階層を補完できるようにする
    if isdirectory(l:path) && l:relative_path !~# '/$'
      let l:relative_path .= '/'
    endif
    call add(l:candidates, l:relative_path)
  endfor

  return sort(l:candidates)
endfunction

" :Pgrepと:Tgrepの第2引数でプロジェクト内のパスを補完する
function! CompletionPgrep(ArgLead, CmdLine, CursorPos)
  " keywordの入力が終わるまではパス補完を行わない
  if a:CmdLine !~# '^\S\+\s\+\S\+\s'
    return []
  endif

  return s:complete_project_path(a:ArgLead)
endfunction

" filetypeの自動検出(最後のほうに書いたほうがいいらしい)
filetype on
