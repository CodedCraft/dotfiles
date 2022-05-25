--  .o8                    .o88o.  .o88o.
-- "888                    888 `"  888 `"
--  888oooo.  oooo  oooo  o888oo  o888oo   .ooooo.  oooo d8b
--  d88' `88b `888  `888   888     888    d88' `88b `888""8P
--  888   888  888   888   888     888    888ooo888  888     8888888
--  888   888  888   888   888     888    888    .o  888
--  `Y8bod8P'  `V88V"V8P' o888o   o888o   `Y8bod8P' d888b

-- oooo   o8o
-- `888   `"'
--  888  oooo  ooo. .oo.    .ooooo.
--  888  `888  `888P"Y88b  d88' `88b
--  888   888   888   888  888ooo888
--  888   888   888   888  888    .o
-- o888o o888o o888o o888o `Y8bod8P'

-------------------------------------------------------------
-- Todo
-- [ ] Add short documentation
-- [ ] Adjust Highlights for maximum contrast
-- [ ] Figure out how to access highlight groups
-- [ ] Remove bar in Startify
-------------------------------------------------------------

require('bufferline').setup {
  options = {
    -- mappings = true ,--| false,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

    max_name_length = 18,
    --max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 24,

    diagnostics = "nvim_lsp", --false
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return ""
    end,

custom_filter = function(buf_number)
if vim.fn.bufname(buf_number) ~= "[No Name]" then
        return true
      end
end,
    offsets = {
        {
        filetype = "NvimTree",
        text = "",
        padding = 1,
        -- text2 = function()
        --     return vim.fn.getcwd()
        -- end,
        text_align = "left",
        highlight = "Directory"
        }
    },

    show_close_icon = false, -- | false,

    show_tab_indicators = true, -- | false,

    separator_style = "thick", --  slant, padded slant, thick, thin, { 'any', 'any' }

},
highlights = {
    fill = {
        guibg = {
            attribute = "fg",
            highlight = "VertSplit"
        }
        -- guibg = vim.fn.synIDattr(vim.fn.hlID('PMenu'),'bg'),
        -- attribute = "guibg",
        -- highlight = "PMenu",
    },
    background = {
        guibg = vim.fn.synIDattr(vim.fn.hlID('PMenuSbar'),'bg'), --VertSplit, PMenuSbar, PMenuThumb, CurorColumn, CursorLine, ColorColumn, MatchParen, LspDiagnosticsError
    },
    close_button = {
        guibg = vim.fn.synIDattr(vim.fn.hlID('PMenuSbar'),'bg'), --"#A1EFD3",
    },
    separator = {
        guibg = vim.fn.synIDattr(vim.fn.hlID('PMenuSbar'),'bg'), --"#A1EFD3",
    },
}


-- custom_areas = {
--   right = function()
--     local result = {}
--     local error = vim.lsp.diagnostic.get_count(0, [[Error]])
--     local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
--     local info = vim.lsp.diagnostic.get_count(0, [[Information]])
--     local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

--     if error ~= 0 then
--       table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
--     end
--     if warning ~= 0 then
--       table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
--     end

--     if hint ~= 0 then
--       table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
--     end

--     if info ~= 0 then
--       table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
--     end
--     return result
--   end,
-- },

        -- highlights = {
--             fill = {
--                 guibg = '#3E3859'
-- 		},
--             background = {
--                 --guifg = '#3E3859',
--                 guibg = '#3E3859'
--             },
--             separator = {
--                 guifg = '#3E3859',
--                 guibg = '#3E3859'
--             },
--             buffer_selected = {
--                 guifg = '#30ffff',
--                 --guibg = '<color-value-here>',
--                 gui = "italic"
--             },
--             modified = {
--                 --guifg = '<color-value-here>',
--                 guibg = '#3E3859'
--             },
	-- },
    -- highlights = {
    --     fill = {
    --         guifg = {
    --             attribute = "bg",
    --             highlight = "Search",
    --         },
    --         guibg = {
    --             attribute = "bg",
    --             highlight = "Search",
    --         }
    --     },
    --     separator = {
    --         guibg = {
    --             attribute = "bg",
    --             highlight = "Search",
    --         }
    --     },
    --     duplicate = {
    --         guibg = {
    --             attribute = "bg",
    --             highlight = "Search",
    --         }
    --     },
    --     separator_visible = {
    --         guibg = {
    --             attribute = "bg",
    --             highlight = "Search",
    --         }
    --     },
    -- },
}
