-- oooo                      oooo         o8o                    .o8
-- `888                      `888         `"'                   "888
--  888   .oooo.o oo.ooooo.   888  oooo  oooo  ooo. .oo.    .oooo888
--  888  d88(  "8  888' `88b  888 .8P'   `888  `888P"Y88b  d88' `888
--  888  `"Y88b.   888   888  888888.     888   888   888  888   888
--  888  o.  )88b  888   888  888 `88b.   888   888   888  888   888
-- o888o 8""888P'  888bod8P' o888o o888o o888o o888o o888o `Y8bod88P"
--                 888
--                o888o

local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

      -- before = function (entry, vim_item)
      --   ...
      --   return vim_item
      -- end
    })
  }
}
