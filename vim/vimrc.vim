" General Vim settings
	syntax on
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber 
	set number
	set nowrap
	set background=dark
	set splitright

	filetype on
	filetype plugin on
	filetype indent on

	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

" Configurações relacionadas com vim-go
	map <C-n> :cnext<CR>
	map <C-m> :cprevious<CR>
	nnoremap <leader>a :cclose<CR>
	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
"	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Pugins
	" Setting Pathogen uo
		execute pathogen#infect()

" Language Specific
	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>

	" Typescript
		let g:typescript_compiler_binary = 'tsc'
		let g:typescript_compiler_options = ''
		autocmd QuickFixCmdPost [^l]* nested cwindow
		autocmd QuickFixCmdPost    l* nested lwindow

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Future stuff
	"Swap line
	"Insert blank below and above

