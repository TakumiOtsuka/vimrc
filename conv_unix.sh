#!/bin/bash

# ファイルの改行コードを変換
perl -pe 's/\r//' _vimrc > tmp_vimrc
# ファイルエンコーディングをShiftJISからUTF-8へ変換
iconv -f CP932 -t utf-8 tmp_vimrc > .vimrc
# テンポラリファイルを削除
rm -f tmp_vimrc
