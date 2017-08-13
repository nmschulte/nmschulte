execute pathogen#infect()

let base16colorspace=256  " Access colors present in 256 colorspace
"let g:solarized_termtrans = 1

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

set nocompatible
"set backspace=2
"set backspace=eol,indent,start
"set backspace=
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ruler
set number
set nohlsearch
set incsearch

syntax on
colorscheme base16-eighties
set background=dark

" always show the status line
set laststatus=2

" don't show the current mode, airlines will do this instead
set noshowmode
" could never get this to work... requires patched fonts for fontconfig configuration
"let g:airline_powerline_fonts = 1
" disable hunk/diffstat in statusline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
"let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = "python2"

if has("autocmd")
    filetype plugin indent on
endif

set tw=120
"set tw=80

" higlight columns 121 and over
"augroup vimrc_autocmds
"    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"    autocmd BufEnter * match OverLength /\%121v.*/
"augroup END

" close vim if only nerdtree remains
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" bind CTRL+d to open NERDTree
map <C-d> :NERDTreeToggle<CR>

nmap <C-b> :TagbarToggle<CR>

let g:NERDTreeChDirMode = 2

" disable max file limit; may be very slow!
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 200
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }

" recommended syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {"passive_filetypes": ['html']}
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = {"!level": "errors"}
"let g:syntastic_quiet_messages = {"!type": "syntax"}
"
"let g:gitgutter_highlight_lines = 1

autocmd BufNewFile,BufReadPost .eslintrc set filetype=json
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"autocmd FileType html,xml,json :setlocal sw=2 ts=2 sts=2

set listchars=tab:▸\ ,trail:·
set list

highlight ColorColumn ctermbg=magenta
"#call matchadd('ColorColumn', '\%80v', 100)

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"let g:markdown_syntax_conceal = 0

map ; :
