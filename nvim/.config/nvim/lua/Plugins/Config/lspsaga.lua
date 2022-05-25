-- oooo
-- `888
--  888   .oooo.o oo.ooooo.   .oooo.o  .oooo.    .oooooooo  .oooo.
--  888  d88(  "8  888' `88b d88(  "8 `P  )88b  888' `88b  `P  )88b
--  888  `"Y88b.   888   888 `"Y88b.   .oP"888  888   888   .oP"888
--  888  o.  )88b  888   888 o.  )88b d8(  888  `88bod8P'  d8(  888
-- o888o 8""888P'  888bod8P' 8""888P' `Y888""8o `8oooooo.  `Y888""8o
--                 888                          d"     YD
--                o888o                         "Y88888P'

---------------------------------------------------
-- Todo
-- [] Cleanup comments
-- [] Add short documentation
---------------------------------------------------
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "", -- '🔥'
  warn_sign = "", -- '❕'
  hint_sign = "", -- '💡'
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}
