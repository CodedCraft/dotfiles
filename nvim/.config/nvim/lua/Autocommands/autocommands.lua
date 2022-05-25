--                           .                                               .o8
--                         .o8                                              "888
--  .oooo.   oooo  oooo  .o888oo  .ooooo.   .ooooo.  ooo. .oo.  .oo.    .oooo888
-- `P  )88b  `888  `888    888   d88' `88b d88' `"Y8 `888P"Y88bP"Y88b  d88' `888
--  .oP"888   888   888    888   888   888 888        888   888   888  888   888
-- d8(  888   888   888    888 . 888   888 888   .o8  888   888   888  888   888
-- `Y888""8o  `V88V"V8P'   "888" `Y8bod8P' `Y8bod8P' o888o o888o o888o `Y8bod88P"
--

-- Autocommand Group that clears previous calls
vim.api.nvim_create_augroup('Clear', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'Clear',
  pattern = '*',
  callback = function()
        vim.highlight.on_yank({timeout = 450})
  end,
  desc = 'Highlight on yank',
})

-- Strip Whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'Clear',
  pattern = '*',
  command = '%s/\\s\\+$//e',
  desc = 'Removes whitespace at the ends of lines before saving',
})

-- Centers current line vertically when entering INSERT mode
-- vim.api.nvim_create_autocmd('InsertEnter', {
--   group = 'Clear',
--   pattern = '*',
--   command = ':norm zz',
--   desc = 'Centers current line vertically when entering INSERT mode',
-- })

-- Disable automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd('FileType', {
  group = 'Clear',
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove 'o'
  end,
  desc = 'Disable automatically insert the current comment leader after hitting "o" or "O" in Normal mode.',
})

-- Automatically start ZenMode when opening the Journal
vim.api.nvim_create_autocmd('VimEnter' , {
    group = 'Clear',
    pattern = 'journal.md',
    command = 'ZenMode',
    desc = 'Automatically start ZenMode when opening the Journal' ,
})


-- Open file at the last position it was edited earlier
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   desc = 'Open file at the last position it was edited earlier',
--   group = 'Clear',
--   pattern = '*',
--   command = 'set formatoptions-=cro',
-- })




-------------------------------------------------------------------------------------------------
-- Transform Vimscript into lua:
-------------------------------------------------------------------------------------------------
-- Sync Packer when load file changes
vim.cmd 'au BufWritePost plugins.lua source ~/.config/nvim/lua/Plugins/plugins.lua | PackerSync'

-- Set textwidth of markdown files to 100 characters and enforce linebreaks
vim.cmd 'au FileType markdown set tw=100 linebreak | setl fo=aw2tq'

-- Turn on spellcheck for markdown files
vim.cmd 'au FileType markdown set spell'

vim.cmd([[
autocmd FileType markdown lua require'cmp'.setup.buffer {
\   completion = {
\        keyword_length = 3,
\    },
\   sources = {
\     { name = 'vsnip' },
\   },
\ }
]])

--vim.cmd 'au BufEnter /Users/philip/MyFiles/LifeAreas/WrittenDocs/Journal/journal.md :ZenMode'


-- Highlight characters that go over 120 characters
--vim.cmd [[au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)]]

-- remremember last cursor position in filename
vim.cmd [[au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- Disable comments on new line => consider setting this in settings.lua
-- vim.cmd [[autocmd BufEnter * set formatoptions-=o]]
