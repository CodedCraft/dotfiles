--     .             oooo
--   .o8             `888
-- .o888oo  .ooooo.   888   .ooooo.   .oooo.o  .ooooo.   .ooooo.  oo.ooooo.   .ooooo.
--   888   d88' `88b  888  d88' `88b d88(  "8 d88' `"Y8 d88' `88b  888' `88b d88' `88b
--   888   888ooo888  888  888ooo888 `"Y88b.  888       888   888  888   888 888ooo888
--   888 . 888    .o  888  888    .o o.  )88b 888   .o8 888   888  888   888 888    .o
--   "888" `Y8bod8P' o888o `Y8bod8P' 8""888P' `Y8bod8P' `Y8bod8P'  888bod8P' `Y8bod8P'
--                                                                 888
--                                                                o888o

require("telescope").setup({
	defaults = {
		prompt_prefix = "🔭  ",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			width = 0.9,
			preview_width = 0.5,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
			color_devicons = true,
		},
	},
})
require("telescope").load_extension("fzf")

-- require('telescope').setup {
--   defaults = {
--     prompt_prefix = "🔭  ",
--     sorting_strategy = "ascending",
--   },
--     extensions = {
--         fzy_native = {
--             override_generic_sorter = true,
--             override_file_sorter = true,
--         }
--     }
-- }
-- require('telescope').load_extension('fzy_native')

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
			},
		},
	},
})

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "Neovim",
		cwd = "$HOME/.config/nvim",
		path_display = { "shorten", "tail" },
		hidden = true,
	})
end

M.search_any = function()
	require("telescope.builtin").find_files({
		prompt_title = "My Files",
		search_dirs = { "$HOME/.config", "HOME/.scripts", "$HOME/Downloads", "$HOME/Code", "HOME/Desktop" },
		path_display = { "shorten = 2" },
		hidden = true,
	})
end

M.help = function()
	require("telescope.builtin").help_tags({
		attach_mappings = function()
			actions.select_default:replace(actions.select_vertical)
			return true
		end,
	})
end

return M
