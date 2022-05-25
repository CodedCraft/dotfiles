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
local fileinfo = require('galaxyline.provider_fileinfo')
local gls = gl.section
gl.short_line_list = { }

-- local normal_fg = hex({ name = "Normal", attribute = "fg" })
-- local normal_bg = hex({ name = "Normal", attribute = "bg" })
-- local string_fg = hex({ name = "String", attribute = "fg" })

local colors = {
    bg = vim.api.nvim_eval("g:terminal_color_8"), --#3E3859
    line_bg = vim.api.nvim_eval("g:terminal_color_8"), --"#3E3859",
    fg = "#D8DEE9", --vim.api.nvim_eval("g:terminal_color_7"), -- "#D8DEE9",
    fg_green = vim.api.nvim_eval("g:terminal_color_2"), --"#A1EFD3",
    yellow = vim.api.nvim_eval("g:terminal_color_3"),--"#ffe6b3",
    cyan = vim.api.nvim_eval("g:terminal_color_6"), --"#3C4048",
    darkblue = vim.api.nvim_eval("g:terminal_color_12"), --"#65b2ff",
    green = vim.api.nvim_eval("g:terminal_color_10"), --"#62d196",
    orange = vim.api.nvim_eval("g:terminal_color_11"), -- "#F2B482",
    purple = vim.api.nvim_eval("g:terminal_color_5"), --"#d4bfff",
    magenta = vim.api.nvim_eval("g:terminal_color_13"), --"#c678dd", -- #a37acc, #F02E6E,
    blue = vim.api.nvim_eval("g:terminal_color_4"), --"#22262C",
    red = vim.api.nvim_eval("g:terminal_color_1"), --"#F48FB1",
    lightbg = vim.api.nvim_eval("g:terminal_color_8"), --"#3E3859",
    nord = vim.api.nvim_eval("g:terminal_color_4"),
    greenYel = vim.api.nvim_eval("g:terminal_color_3"), --"#EBCB8B"
}

gls.left[1] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        -- highlight = {colors.nord, colors.bg}
        highlight = 'Normal',
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            return "      "
        end,
        highlight = {colors.bg, colors.nord},
        separator = " ",
        separator_highlight = {colors.lightbg, colors.lightbg}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.lightbg}
    }
}


local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.greenYel, colors.line_bg}
    }
}

gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.orange, colors.line_bg}
    }
}

gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.red, colors.line_bg}
    }
}

gls.left[8] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = {colors.line_bg, colors.line_bg},
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        -- highlight = {colors.red, colors.bg}
        highlight = 'Normal',
    }
}

gls.left[10] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[11] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "   ",
        highlight = {colors.yellow, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[3] = {
    SiMode = {
        provider = function()
            local alias = {
                n = "  NORMAL ",
                i = "  INSERT ",
                c = "  COMMAND ",
                V = "  VISUAL ",
                [""] = "  VISUAL ",
                v = "  VISUAL ",
                R = "  REPLACE "
            }
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.bg, colors.yellow}
    }
}

gls.right[4] = {
	LineInfo = {
            provider = function() return string.format('   %s ', fileinfo.line_column()) end,
            highlight = {colors.cyan, colors.nord},
        },
}

gls.right[5] = {
    PerCent = {
        provider = "LinePercent",
	separator = " ",
        separator_highlight = {colors.red, colors.fg},
        highlight = {colors.fg, colors.bg}
    }
}
