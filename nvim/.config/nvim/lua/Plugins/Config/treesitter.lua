--     .
--   .o8
-- .o888oo oooo d8b  .ooooo.   .ooooo.
--   888   `888""8P d88' `88b d88' `88b
--   888    888     888ooo888 888ooo888 8888888
--   888 .  888     888    .o 888    .o
--   "888" d888b    `Y8bod8P' `Y8bod8P'

--           o8o      .       .
--           `"'    .o8     .o8
--  .oooo.o oooo  .o888oo .o888oo  .ooooo.  oooo d8b
-- d88(  "8 `888    888     888   d88' `88b `888""8P
-- `"Y88b.   888    888     888   888ooo888  888
-- o.  )88b  888    888 .   888 . 888    .o  888
-- 8""888P' o888o   "888"   "888" `Y8bod8P' d888b

------------------------------------------------------
-- Todo
-- [] Add short documentation/comments of settings
-- [] Format file
------------------------------------------------------


    require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained",
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true
      },
      autotag = {enable = true},
      rainbow = {enable = false}
    }
