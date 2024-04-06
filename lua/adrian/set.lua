--Primeagean inspired---------------------------------------
--Fat cursor
vim.opt.guicursor = ""
--Numbering
vim.opt.nu=true
vim.opt.relativenumber=true
--Tabs
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
--Indents
vim.opt.smartindent=true
vim.opt.wrap=false
--Disable backups
vim.opt.swapfile=false
vim.opt.backup=false
--Disable highlight search but enable incremental search
vim.opt.hlsearch=false
vim.opt.incsearch=true
--Not sure
vim.opt.termguicolors=true
--Maintain a 8 line width for scrolling
vim.opt.scrolloff=8
--Show sign column
vim.opt.signcolumn="yes"
--Other
vim.opt.isfname:append("@-@")
--This will display a color column at 80 char width
-- vim.opt.colorcolumn="80"
--Fast update
vim.opt.updatetime=50
--end Primeagean inspired---------------------------------------
--

-- from kickstart
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
-- vim.o.undofile = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- END KICKSTART

--My stuff-----------------------------------------------------------------
--yank on highlight
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
--Color Scheme
vim.cmd("colorscheme nightfox")
--Ignore case when searching
vim.opt.ignorecase=true
--But don't ignore when searching with Uppercase chars
vim.opt.smartcase=true



--Dir containing various usr generated files
local usr_generated=os.getenv("HOME").."/.config/nvim/usr_generated"
if  vim.fn.isdirectory(usr_generated) <=0 then 
    vim.fn.mkdir(usr_generated)
end

--sessions dir--------------
local usr_sessions=usr_generated.."/sessions"
vim.g.usr_sessions=usr_sessions
if  vim.fn.isdirectory(usr_sessions) <=0 then 
    vim.fn.mkdir(usr_sessions)
end

--Save Load global and custom sessions
vim.cmd([[
" we close nerdtree otherwise error
:exec "nnoremap <leader>ss :NERDTreeClose<CR> <bar> :mks! " . g:usr_sessions . "/GLOB_SESS.vim<CR>" 
:exec "nnoremap <leader>s<S-s> :NERDTreeClose<CR> <bar> : mks! " . g:usr_sessions . "/*.vim<C-D><BS><BS><BS><BS><BS>"

:exec "nnoremap <leader>s<S-l> : so " . g:usr_sessions . "/*.vim<C-D><BS><BS><BS><BS><BS>"
:exec "nnoremap <leader>sl :so " . g:usr_sessions . "/GLOB_SESS.vim<CR><CR>"

]])


--Save session on exit, load it on startup

-- vim.cmd([[
-- fu! SaveSess()
--     execute "NERDTreeClose<CR> <bar> :mks! " . g:usr_sessions . "/LAST_SESS.vim"
-- endfunction

-- fu! RestoreSess()
-- if filereadable(g:usr_sessions . "/LAST_SESS.vim")
--     execute 'so ' . g:usr_sessions . "/LAST_SESS.vim"
-- endif
-- endfunction 

-- autocmd VimLeave * call SaveSess()
-- autocm VimEnter * call RestoreSess()
-- ]])


vim.cmd([[
" Status line for fugitive whithin lightline
let g:lightline = {
			\ 'colorscheme': 'powerline',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }

]])


-- Load custom keys
-- let g:temp_map_dir="/home/me/scripts/vim/temp_map/"
-- :exec "nnoremap <F2> : so " . g:temp_map_dir . "/*.vim<C-D><BS><BS><BS><BS><BS><BS>"



-- format on save here
-- for go files
-- vim.cmd([[
-- function! GoFmt()
--   let saved_view = winsaveview()
--   silent %!gofmt
--   if v:shell_error > 0
--     cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
--     silent undo
--     cwindow
--   endif
--   call winrestview(saved_view)
-- endfunction

-- autocmd BufWritePre *.go :call GoFmt()
-- ]])


































