--                          o8o
--                          `"'
-- ooo. .oo.   oooo    ooo oooo  ooo. .oo.  .oo.
-- `888P"Y88b   `88.  .8'  `888  `888P"Y88bP"Y88b
--  888   888    `88..8'    888   888   888   888  8888888
--  888   888     `888'     888   888   888   888
-- o888o o888o     `8'     o888o o888o o888o o888o

-- oooo
-- `888
--  888  oooo   .ooooo.  oooo    ooo  .oooo.o
--  888 .8P'   d88' `88b  `88.  .8'  d88(  "8
--  888888.    888ooo888   `88..8'   `"Y88b.
--  888 `88b.  888    .o    `888'    o.  )88b
-- o888o o888o `Y8bod8P'     .8'     8""888P'
--                       .o..P'
--                       `Y8P'

---------------------------------------------
-- Todo
-- [x] Figlet Title
-- [ ] Remap <leader>q to :bd if mutliple buffers are open
-- [ ] Remap <leader>wq to :w & :bd if mutliple buffers are open
---------------------------------------------
-- Set Leader key to 'Space'
vim.g.mapleader = " "

-- Window movement with Ctrl-h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })


-- Navigate open buffers with Tab & Shift-Tab
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })


-- Move selected lines / blocks up and down with K and J (<--captial letters)
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })


-- Map :w , :q and :q! to Ctrl-w Ctrl-q and Shift-Ctrl-q
--vim.api.nvim_set_keymap('n', '<Leader>q', "len(getbufinfo({'buflisted':1}))>1 ? ':q<CR>' : ':bd<CR>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>qq', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

