--                      oooo
--                      `888
--  .oooooooo  .oooo.    888   .oooo.   oooo    ooo oooo    ooo
-- 888' `88b  `P  )88b   888  `P  )88b   `88b..8P'   `88.  .8'
-- 888   888   .oP"888   888   .oP"888     Y888'      `88..8'   8888888
-- `88bod8P'  d8(  888   888  d8(  888   .o8"'88b      `888'
-- `8oooooo.  `Y888""8o o888o `Y888""8o o88'   888o     .8'
-- d"     YD                                        .o..P'
-- "Y88888P'                                        `Y8P'

-- oooo   o8o
-- `888   `"'
--  888  oooo  ooo. .oo.    .ooooo.
--  888  `888  `888P"Y88b  d88' `88b
--  888   888   888   888  888ooo888
--  888   888   888   888  888    .o
-- o888o o888o o888o o888o `Y8bod8P'

-------------------------------------------------------------------------
-- Todo
-- [] Create a Short Status Line for Nvim-Tree etc.
-- [] Check out other designs and implement one
-------------------------------------------------------------------------


local gl = require("galaxyline")
--local fileinfo = require('galaxyline.provider_fileinfo')
local gls = gl.section
gl.short_line_list = {
    'startify',
    'packer',
    'NvimTree',
}
-- Horizontal seperator line
vim.cmd("highlight! StatusLineNC gui=underline guibg=NONE guifg=#100E23")

-- --     light_green = vim.fn.synIDattr(vim.fn.hlID("SpellCap"),"fg"), --"#A1EFD3",
-- --     yellow = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),--"#ffe6b3",
local colors = {
    bg = vim.fn.synIDattr(vim.fn.hlID("Normal"),"bg"),
    white = vim.fn.synIDattr(vim.fn.hlID("Normal"),"fg"),
    section_bg = vim.fn.synIDattr(vim.fn.hlID("VertSplit"),"fg"),
    fg = vim.fn.synIDattr(vim.fn.hlID("PMenu"),"bg"),
    light_green = vim.fn.synIDattr(vim.fn.hlID("Cyan"),"fg"), --"#A1EFD3",
    blue = vim.fn.synIDattr(vim.fn.hlID("Purple"),"fg"), --"#A1EFD3",
    yellow = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"), --"#ffe6b3",
    orange =  vim.fn.synIDattr(vim.fn.hlID("Todo"), "fg"), --"#F2B482",
    magenta = vim.fn.synIDattr(vim.fn.hlID("Identifier"), "fg"),
    red = vim.fn.synIDattr(vim.fn.hlID("Error"), "fg"),
    cyan = "#3C4048",
    darkblue = "#65b2ff",
    green = "#62d196",
    purple = "#d4bfff",
    lightbg = "#3E3859",
    nord = "#65b2ff",
}
--
-- --vim.fn.synIDattr(vim.fn.hlID('Normal'),'bg')

-- -- colors
-- -- local colors = {
-- --     bg = vim.fn.synIDattr(vim.fn.hlID("Normal"),"bg"),
-- --     light_bg = vim.fn.synIDattr(vim.fn.hlID("PMenu"),"bg"), --"#3E3859",
-- --     section_bg = vim.fn.synIDattr(vim.fn.hlID("PMenu"),'bg'), --"#3E3859",
-- --     fg = "#D8DEE9", --vim.api.nvim_eval("g:terminal_color_7"), -- "#D8DEE9",
-- --     light_green = vim.fn.synIDattr(vim.fn.hlID("SpellCap"),"fg"), --"#A1EFD3",
-- --     yellow = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),--"#ffe6b3",
-- --     cyan = vim.api.nvim_eval("g:terminal_color_6"), --"#3C4048",
-- --     darkblue = vim.api.nvim_eval("g:terminal_color_12"), --"#65b2ff",
-- --     green = vim.api.nvim_eval("g:terminal_color_10"), --"#62d196",
-- --     orange = vim.api.nvim_eval("g:terminal_color_11"), -- "#F2B482",
-- --     purple = vim.api.nvim_eval("g:terminal_color_5"), --"#d4bfff",
-- --     magenta = vim.api.nvim_eval("g:terminal_color_13"), --"#c678dd", -- #a37acc, #F02E6E,
-- --     blue = vim.api.nvim_eval("g:terminal_color_4"), --"#22262C",
-- --     red = vim.api.nvim_eval("g:terminal_color_1"), --"#F48FB1",
-- --     lightbg = vim.api.nvim_eval("g:terminal_color_8"), --"#3E3859",
-- --     nord = vim.api.nvim_eval("g:terminal_color_4"),
-- --     greenYel = vim.api.nvim_eval("g:terminal_color_3"), --"#EBCB8B"
-- -- }



-- -- local buffer_not_empty = function()
-- --   return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
-- -- end

local mode_color = function()
  local mode_colors = {
    n = colors.light_green,
    i = colors.blue,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode gui=bold,italic guibg='..mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return '  '..alias_mode..' '
    end,
    separator = ' ',
    highlight = { colors.section_bg, colors.section_bg },
    separator_highlight = {colors.white, colors.section_bg },
  },
}
gls.right[1] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = " ",
    highlight = { colors.red, colors.section_bg },
  },
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = " ",
    highlight = { colors.orange, colors.section_bg },
  },
}
gls.right[3] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = { colors.yellow, colors.section_bg },
  },
}

gls.right[4] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = " ",
    highlight = { colors.blue, colors.section_bg },
  },
}

gls.right[5]= {
  LineColumn = {
    provider = function ()
      vim.api.nvim_command('hi GalaxyLineColumn guibg='..mode_color())
      local max_lines = vim.fn.line('$')
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format(" LINE:%3d/%d  COL:%d ", line, max_lines, column)
    end,
    separator = ' ',
    highlight = { colors.section_bg, mode_color(), 'bold,italic' },
    separator_highlight = { colors.white, colors.section_bg },
  }
}
