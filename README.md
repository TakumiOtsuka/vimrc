# vimrc

個人用の Vim 設定です。Windows 版 Vim と Linux/macOS の Vim で利用できます。

## Quick Start

### 1. 必要なコマンドを用意する

必須:

- Vim
- Git

推奨:

- [ripgrep](https://github.com/BurntSushi/ripgrep): `:grep`、`:Pgrep`、`:Tgrep`で使用
- [fzf](https://github.com/junegunn/fzf): `:Files`などで使用

WindowsではWinGetからインストールできます。

```powershell
winget install BurntSushi.ripgrep.MSVC
winget install junegunn.fzf
```

### 2. 設定ファイルを配置する

Windows:

```powershell
Copy-Item .\_vimrc $HOME\_vimrc
Copy-Item .\_gvimrc $HOME\_gvimrc
```

Linux/macOS:

```sh
cp _vimrc ~/.vimrc
cp _gvimrc ~/.gvimrc
```

`_gvimrc` / `.gvimrc`はGUI版のVimでのみ読み込まれます。フォントが
インストールされていない場合は、環境に合わせて`guifont`を変更してください。

### 3. vim-plugをインストールする

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force $HOME\vimfiles\autoload | Out-Null
Invoke-WebRequest `
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim `
  -OutFile $HOME\vimfiles\autoload\plug.vim
```

Linux/macOS:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows版Vimは`$HOME/vimfiles`、Linux/macOS版Vimは`$HOME/.vim`を
標準の`runtimepath`として参照します。そのため、配下の
`autoload/plug.vim`が`plug#begin()`の呼び出し時に自動で読み込まれます。
この`autoload`の探索はVim本体の仕組みです。一方、引数なしの
`plug#begin()`がWindowsでは`~/vimfiles/plugged`、Linux/macOSでは
`~/.vim/plugged`を選ぶのはvim-plug側の既定動作です。

### 4. プラグインをインストールする

Vimを起動して次を実行します。

```vim
:PlugInstall
```

以後の管理には次のコマンドを使用します。

```vim
:PlugUpdate
:PlugStatus
:PlugClean
:PlugUpgrade
```

### 5. 作業用ディレクトリを作成する

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force $HOME\.vimbackup | Out-Null
New-Item -ItemType Directory -Force $HOME\.vimundo | Out-Null
```

Linux/macOS:

```sh
mkdir -p ~/.vimbackup ~/.vimundo
```

`.vimundo`には永続undoファイルが保存されます。

## Python LSP

Pythonファイルを開いて、language serverをインストールします。

```vim
:LspInstallServer
```

起動状況は次のコマンドで確認できます。

```vim
:LspStatus
:verbose LspStatus
```

主なキーマッピング:

- `Ctrl-]` / `gd`: 定義へ移動
- `gr`: 参照箇所を表示
- `K`: シンボルの情報を表示
- `[g` / `]g`: 前後の診断へ移動
- `F2`: シンボルをリネーム

Pythonのlint設定はプロジェクトルートの`setup.cfg`などに記述します。

```ini
[pycodestyle]
max-line-length = 120
```

## Search

```vim
:Files
:Files %:h
:GFiles
:Rg keyword
:Pgrep keyword path-pattern
```

`:Pgrep`と`:Tgrep`は、現在のファイルから`.git`などのマーカーを上方向に
検索し、見つけたプロジェクトルートを基準にripgrepを実行します。カレント
ディレクトリは変更しません。

## References

- [vim-plug](https://github.com/junegunn/vim-plug)
- [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
- [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
