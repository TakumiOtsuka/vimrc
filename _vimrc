" ������vi�݊��ł͂Ȃ��AVim�̃f�t�H���g�ݒ�ɂ���
set nocompatible " Be iMproved
" ��U�t�@�C���^�C�v�֘A�𖳌�������
filetype off

set runtimepath+=~/.vim/bundle/dein.vim

" Required:
call dein#begin(expand('~/.vim/bundle/dein.vim'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" �t�@�C���I�[�v����֗���
call dein#add('Shougo/unite.vim')
" Unite.vim�ōŋߎg�����t�@�C����\���ł���悤�ɂ���
call dein#add('Shougo/neomru.vim')
" �t�@�C����tree�\�����Ă����
call dein#add('scrooloose/nerdtree')
" Git��֗��Ɏg��
call dein#add('tpope/vim-fugitive')

" �R�����gON/OFF����y�Ɏ��s
call dein#add('tomtom/tcomment_vim')
" �V���O���N�I�[�g�ƃ_�u���N�I�[�g����ւ���
call dein#add('tpope/vim-surround')

" �C���f���g�ɐF�����Č����₷������
call dein#add('nathanaelkane/vim-indent-guides')
" ���O�t�@�C����F�Â����Ă����
call dein#add('vim-scripts/AnsiEsc.vim')
" �s���̔��p�X�y�[�X������
call dein#add('bronson/vim-trailing-whitespace')
" less�p��syntax�n�C���C�g
call dein#add('KohPoll/vim-less')

call dein#end()

" Required:
filetype plugin indent on

"""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" �e��I�v�V�����̐ݒ�
"""""""""""""""""""""""""""""""
" �^�O�t�@�C���̎w��
set tags=~/.tags
" �X���b�v�t�@�C���͎g�p���Ȃ�
set noswapfile
" �J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler
" �R�}���h���C���Ɏg�����ʏ�̍s��
set cmdheight=2
" �G�f�B�^�E�B���h�E�̖�������2�s�ڂɃX�e�[�^�X���C�����펞�\��������
set laststatus=2
" �X�e�[�^�X�s�ɕ\����������̎w��
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" �X�e�[�^�X�s�Ɍ��݂�git�u�����`��\������
set statusline+=%{fugitive#statusline()}
" �E�B���h�E�̃^�C�g���o�[�Ƀt�@�C���̃p�X���Ȃǂ�\������
set title
" �R�}���h���C�����[�h��<tab>�L�[�ɂ��t�@�C�����⊮��L���ɂ���
set wildmenu
" ���͒��̃R�}���h��\������
set showcmd
" �o�b�N�A�b�v�f�B���N�g���̎w��
set backupdir=$HOME/.vimbackup
" �A���h�D�t�@�C���f�B���N�g���̎w��
set undodir=$HOME/.vimundo
" �o�b�t�@�ŊJ���Ă���t�@�C���̃f�B���N�g���ŃG�N�X�v���[�����J�n����
set browsedir=buffer
" �������݂̂Ō��������Ƃ��ɑ啶���������𖳎�����
set smartcase
" �������ʂ��n�C���C�g�\������
set hlsearch
" �Â��w�i�F�ɂ��킹���z�F�ɂ���
set background=dark
" �^�u���͂𕡐��̋󔒓��͂ɒu��������
set expandtab
" �������[�h�̍ŏ��̕�������͂������_�Ō������J�n����
set incsearch
" �ۑ�����Ă��Ȃ��t�@�C��������Ƃ��ł��ʂ̃t�@�C�����J����悤�ɂ���
set hidden
" �s��������\�����Ȃ�
set nolist
" �^�u�ƍs�̑�������������
set listchars=tab:>\ ,extends:<
" �s�ԍ���\������
set number
" �Ή����銇�ʂ�u���[�X��\������
set showmatch
" �J�Ǝ��ɑO�̍s�̃C���f���g���p������
set autoindent
" ���s���ɓ��͂��ꂽ�Ƃ̖����ɍ��킹�Ď��̍s�̃C���f���g�𑝌�����
set smartindent
" �^�u�����̕\����
set tabstop=2
" Vim��}������C���f���g�̕�
set shiftwidth=2
" �s���̗]������ Tab ��ł����ނƁA'shiftwidth'�̐������C���f���g����
set smarttab
" �J�[�\�����s���A�s���łƂ܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]
" �\�����ɕ����F��ω�������
syntax on
" �J���[�X�L�[�}�̎w��
colorscheme desert
" �s�ԍ��̐F
highlight LineNr ctermfg=darkyellow
" �r�[�v����炳�Ȃ�
set visualbell t_vb=
"""""""""""""""""""""""""""""""

" vim�𗧂��グ���Ƃ��ɁA�����I��vim-indent-guides���I���ɂ���
let g:indent_guides_enable_on_vim_startup = 1

"--------------------------------------------------------------------------
"���ꖈ�̃C���f���g�ݒ�
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


" Windows�̏ꍇ�t�H���g��Ricty�Ɏw��
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

" filetype�̎������o(�Ō�̂ق��ɏ������ق��������炵��)
filetype on

