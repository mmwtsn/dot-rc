"
" M. Maxwell Watson's
" Vim Configuration File
" @mmwtsn
"

" Display line relative numbers
set number
set relativenumber

set ic
set hlsearch
set nocp
set encoding=utf-8

" Text width and formatting
set linebreak

" Indentation / Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent

" TODO - these were used by an old plug-in; still needed?
filetype indent on
filetype plugin on

" Fix delete issue in Linux
set backspace=2"

" Open new horizontally split windows to the right
set splitright

" CloseTag configuration for HTML and ERB filetypes
"autocmd FileType html,erb let b:closetag_html_style=1
"autocmd FileType html,erb source ~/.vim/bundle/closetag/plugin/closetag.vim

" Always show the status bar so Powerline is visible in single windows
set laststatus=2

" Set Powerline colorscheme
let g:Powerline_colorscheme = 'maxwell'

" Call ctrl-p plug-in
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Start in current directory
let g:ctrlp_working_path_mode = 0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Disable caching in CtrlP because ag is that fast
  let g:ctrlp_use_caching = 0
endif

" Bind K to grep (ag) word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Do not display start screen
set shortmess+=I

set t_Co=256
set background=dark
hi TabLineFill term=bold cterm=bold ctermbg=0

" Vertical and horizontal cursor settings
"set cuc cul
set cul

" Set filetypes for various file formats for correct syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass
au BufRead,BufNewFile *.erb set filetype=eruby.html
au BufREad,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.coffee set filetype=javascript
au BufRead,BufNewFile *.rake set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby

au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Rakefile set filetype=ruby
au BufRead,BufNewFile Gruntfile set filetype=javascript

au BufRead,BufNewFile .bash_* set filetype=sh

" Do not create swap files
set noswapfile

" Add closing `}`, new line and auto-indent when requested
inoremap {<CR> {<CR>}<Esc><S-o>

" Speaking of curly brackets, allow mustache.vim's helper abbreviations
let g:mustache_abbreviations = 1

" map ij to exit insertion mode
imap jj <Esc>

" tab switching
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

" split switching
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sk <C-w>k

" Disable folding because it's driving me crazy
set nofoldenable

" Toggle paste mode to avoid :set paste
map <C-j> :set paste<CR>
map <C-k> :set nopaste<CR>

" Hide library, package and other misc. files from Vim/Ctrl-P
set wildignore+=*/vendor/*,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*/dist/*,*/_site/*

" Pathogen settings for plug-in management
filetype off
call pathogen#infect('~/.vim/bundle')
call pathogen#helptags()
syntax on

" Color scheme
colors tomorrow-night

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=darkblue guibg=darkblue
match ExtraWhitespace /\(\S\+\)\@<=\s\+$/

" Refreshing Vimroom settings when the window is resized
autocmd VimResized * VimroomToggle
autocmd VimResized * VimroomToggle

" Start scrolling the buffer before top or bottom is reached
set scrolloff=5
