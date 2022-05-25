--                         .       .    o8o
--                       .o8     .o8    `"'
--   .oooo.o  .ooooo.  .o888oo .o888oo oooo  ooo. .oo.    .oooooooo  .oooo.o
--  d88(  "8 d88' `88b   888     888   `888  `888P"Y88b  888' `88b  d88(  "8
--  `"Y88b.  888ooo888   888     888    888   888   888  888   888  `"Y88b.
--  o.  )88b 888    .o   888 .   888 .  888   888   888  `88bod8P'  o.  )88b
--  8""888P' `Y8bod8P'   "888"   "888" o888o o888o o888o `8oooooo.  8""888P'
--                                                       d"     YD
--                                                       "Y88888P'

-------------------------------------------------------------------------------
-- Todo
-- [ ] Move the 'undo' variable to a separate file
-- [x] Delete the commented defaults
-- [x] Move the autocommands at the bottom to a separate file
-------------------------------------------------------------------------------

local undo=os.getenv("XDG_CACHE_HOME")..'/nvim/undo'  -- sets the undo dir to ~/.cache/nvim/undo
vim.cmd("let &fcs='eob:.'")                           -- Change marker for nonexsitent lines from ~ to .
vim.cmd("set spellfile=~/.config/nvim/spell/en.utf-8.add")
vim.cmd("let g:loaded_matchparen=1")

-- Functional Settings
vim.o.backup            = false                       -- Disable backups of your files
vim.o.clipboard         = "unnamedplus"               -- Enable copy-paste of your OS in vim
vim.o.errorbells        = false                       -- Disable warning sounds
vim.o.hidden            = true                        -- Keep buffers open in the background
vim.o.history           = 2000                        -- Cap command history to 2000 entries
vim.o.shortmess         = "aoOTIcF"                   -- Shorten messages ("aoOTIcF" are message flags)
vim.o.swapfile          = false                       -- Disable temporary saving of the current file
vim.o.timeoutlen        = 600                         -- Wait 600 ms for mapped sequence to complete
vim.o.ttimeoutlen       = 0                           -- Wait 0 ms after pressing key code sequences (e.g. ESC)
vim.o.undodir           = undo                        -- Set undo histroy file directory
vim.o.undofile          = true                        -- Save undo history to file
vim.o.updatetime        = 50                          -- Lower update time when finished typing to 50ms


-- Visual Settings
vim.o.cmdheight         = 2                           -- Number of lines in the command section (at the bottom)
vim.o.pumblend          = 7                           -- Transparency of Popup Menus (0 - 100% transparent)
vim.o.pumheight         = 10                          -- Max number of lines in Popup Menus
vim.o.showmode          = false                       -- Hide current mode in the satus line (normal, insert etc.)
vim.o.showtabline       = 2                           -- Show all open buffers as tabs at the top
vim.o.winblend          = 7                           -- Transparency of overlay windows (0 - 100% transparent)
vim.o.wrap              = false                       -- Turn off line wrapping
--vim.wo.colorcolumn      =  "100"                      -- Column at 100 characters (to encourage short line length)
vim.wo.cursorline       = true                        -- Highlight the line where the cursor is currently
vim.wo.cursorlineopt    = "number"                    -- Sets what part of a line is being highlighted
-- vim.wo.list             = true
-- vim.o.listchars        = "trail:·"
vim.wo.number           = true                        -- Absolute line number of the current line
vim.wo.relativenumber   = true                        -- Line numbers relative to the cursor position
vim.wo.signcolumn       = "yes"                       -- Add a column on left for symbols (gutter)


-- Window handling
vim.o.mouse             = "a"                         -- Enable mouse for all modes
vim.o.scrolloff         = 8                           -- Begin scrolling when 8 lines away from top or bottom
vim.o.splitbelow        = true                        -- New split is at the bottom when splitting horizontally
vim.o.splitright        = true                        -- New split is on the right when splitting vertically
vim.o.termguicolors     = true                        -- Enable 24bit RGB color support
vim.o.title             = true                        -- Display the file name of every buffer at the top
vim.o.laststatus        = 3                           -- Global status bar for splits

-- Text Formatting
vim.bo.smartindent     = true                         -- Smart auto-indentation based on syntax
vim.o.expandtab        = true                          -- Convert tabs into spaces
vim.o.indentexpr       = "lisp"                        -- Set indent expression to LSP
vim.o.shiftwidth       = 4                             -- Number of spaces used for indentation
vim.o.softtabstop      = 4                             -- Not really necessary with expandtab on
vim.o.tabstop          = 4                             -- Set tabs to 4 spaces' width
vim.o.virtualedit      = "block"                       -- Always form perfect blocks in Visual Block mode
-- vim.o.spell            = true
vim.o.spelllang        = "en_us"
--vim.cmd("set formatoptions-=cro")
--vim.bo.formatoptions    = vim.bo.formatoptions - "cro" -- Auto-formatting options


-- Search
vim.o.hlsearch          = false                       -- Disable highlight after search is finished
vim.o.ignorecase        = true                        -- Search is not case sensitive for lower case searches
vim.o.path              = "**"                        -- Expand file search scope to all subdirectories
vim.o.smartcase         = true                        -- Case sensitive search when search starts with capitals


-- Language Server Protocol
vim.o.completeopt       = "menu,menuone,noselect"     -- Display auto completion menu (for 1+ results)
vim.o.foldexpr          = "nvim_treesitter#foldexpr()"-- Use Treesitter for the fold logic
vim.o.foldlevelstart    = 99                          -- Unfold all folds when opening a file
vim.o.foldmethod        = "expr"                      -- Foldmethod used by Treesitter for better folding
