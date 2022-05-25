local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

        use "wbthomason/packer.nvim" -- Have packer manage itself
        -- Language Server Related Plugins
		use {
            "neovim/nvim-lspconfig",
            config = [[require('Plugins.Config.lspconfig')]]
        }
        use {
            'williamboman/nvim-lsp-installer',
            config= [[require('Plugins.Config.nvim-lsp-installer')]],
        }
		use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            run = ":TSUpdate",
            config = [[require('Plugins.Config.treesitter')]],
        }
		use {
            "mhartington/formatter.nvim",
            cmd = { "FormatWrite", "Format" },
            config = [[require('Plugins.Config.formatter')]]
        }

        -- Autocomplete
        use {"hrsh7th/nvim-cmp", config = [[require('Plugins.Config.nvim-cmp')]]}
		use {
            "hrsh7th/cmp-buffer", -- Buffer completions
        }
		use {
            "hrsh7th/cmp-path", -- Path completions
        }
		use {
            "hrsh7th/cmp-cmdline", -- Cmdline completions
        }
		use {
            "hrsh7th/cmp-nvim-lsp", -- LSP completions
        }
		use {
            "hrsh7th/cmp-vsnip",
        }
		use {
            "hrsh7th/vim-vsnip",
            config = vim.cmd("let g:vsnip_snippet_dir = '/Users/philip/.config/snippets'")
        }
		use {
            "hrsh7th/vim-vsnip-integ",
        }
		use {
            "tami5/lspsaga.nvim",
            config = [[require('Plugins.Config.lspsaga')]]
        }
		use {
            "onsails/lspkind-nvim",
            config = [[require('Plugins.Config.lspkind')]],
        }

        -- Telescope
		use {
			"nvim-telescope/telescope.nvim",
            --cmd = "Telescope", -- this crashes nvim
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
			config = [[require('Plugins.Config.telescope')]],
		}
		use {
            "nvim-telescope/telescope-fzf-native.nvim",
            --after = "telescope.nvim",
            run = "make"
        }
		--use { 'nvim-telescope/telescope-fzy-native.nvim' }


        -- Visual Plugins
		 use {
             "akinsho/bufferline.nvim",
             config = [[require('Plugins.Config.bufferline')]]
         }
		 use {
             "lukas-reineke/indent-blankline.nvim",
             event = "BufRead",
             config = [[require('Plugins.Config.indent-blankline')]]
         }
        use {
          "folke/zen-mode.nvim",
            config = function()
                  require("zen-mode").setup({
                    plugins = { gitsigns = false, tmux = true, kitty = { enabled = false, font = "+4" } },
                    window = {backdrop = 1.00},
                  })
            end,
        }
		 use {
             "norcalli/nvim-colorizer.lua",
             config = [[require('Plugins.Config.colorizer')]],
         }
		 use {
             "christoomey/vim-tmux-navigator"
         }
		 use {
             "tweekmonster/startuptime.vim",
             cmd = "StartupTime",
         }
		use {
            "mhinz/vim-startify",
            branch = "center",
            config = [[require('Plugins.Config.startify')]]
        }
		use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = [[require('Plugins.Config.nvim-tree')]]
        }
		use {
            "kyazdani42/nvim-web-devicons"
        }
		use {
            "ryanoasis/vim-devicons"
        }
        use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
        }
--        use {
--            'numToStr/Comment.nvim',
--            config = require('Comment').setup()
--        }
		--use {
		--	"NTBBloodbath/galaxyline.nvim",
		--	branch = "main",
		--	config = [[require'Plugins.Config.galaxyline']],
		--	requires = { "kyazdani42/nvim-web-devicons", opt = true },
		--}
        use {
            "sunjon/shade.nvim",
			config = [[require'Plugins.Config.shade']],
            }

        use({
            "catppuccin/nvim",
            as = "catppuccin"
        })
        use {
           'nvim-lualine/lualine.nvim',
		    config = [[require'Plugins.Config.lualine']],
           requires = { 'kyazdani42/nvim-web-devicons', opt = true }
         }


		--
		--
  --       -- Color Schemes
  --       use({
  --           "catppuccin/nvim",
  --           as = "catppuccin"
  --       })
		-- use {
  --           "rose-pine/neovim", -- https://github.com/rose-pine/neovim
  --           as = "rose-pine",
  --           cmd = "colorscheme rose-pine",
  --       }
		 use {
             "matsuuu/pinkmare",
             cmd = "colorscheme pinkmare"
         }

		vim.cmd('colorscheme pinkmare')
		-- --use({ "philip1987/embark" })
		--  use {"embark-theme/vim",
  --            as = "embark",
  --            cmd = "colorscheme embark",
  --        }
		-- use {
  --           "marko-cerovac/material.nvim", -- https://github.com/marko-cerovac/material.nvim
  --           cmd = "colorscheme material",
  --       }
		-- use {
  --           "sainnhe/sonokai", -- https://github.com/sainnhe/sonokai
  --           cmd = "colorscheme sonokai",
  --       }
		-- use {
  --           "sainnhe/edge", -- https://github.com/sainnhe/edge
  --           cmd = "colorscheme edge",
  --       }
		-- use {
  --           "savq/melange", -- https://github.com/savq/melange
  --           cmd = "colorscheme melange",
  --       }
		-- use {
  --           "shaunsingh/moonlight.nvim", -- https://github.com/shaunsingh/moonlight.nvim
  --           cmd= "colorscheme moonlight",
  --       }
		-- use {
  --           "sainnhe/everforest", -- https://github.com/sainnhe/everforest
  --           cmd = "colorscheme everforest",
  --       }
		-- use {
  --           "yashguptaz/calvera-dark.nvim", -- https://github.com/yashguptaz/calvera-dark.nvim
  --           cmd = "colorscheme calvera",
  --       }
		-- use {
  --           "eddyekofo94/gruvbox-flat.nvim",
  --           cmd = "colorscheme gruvbox-flat",
  --           }
		--
		-- -- vim.cmd('colorscheme everforest') vim.g.everforest_background = "soft" --styles: hard, medium, soft
  --       --vim.g.colors_name = "embark"
		-- -- vim.cmd('colorscheme embark')
		-- -- vim.cmd('colorscheme edge') vim.g.edge_style = 'neon' --styles: default, aura, neon
		-- -- vim.cmd('colorscheme sonokai') vim.g.sonokai_style = 'espresso' --styles: default, atlantis, andromeda, shusia, maia, espresso
		-- -- vim.cmd('colorscheme material') vim.g.material_style = "palenight" --styles: oceanic, deep ocean, palenight, darker, lighter
		-- -- vim.cmd('colorscheme rose-pine') vim.g.rose_pine_variant = "base" --styles: base, moon, dawn
		-- vim.cmd('colorscheme pinkmare')
		-- -- vim.cmd('colorscheme catppuccin')
		-- -- vim.cmd('colorscheme moonlight')
		-- -- vim.cmd('colorscheme calvera')
		--
		--
		-- -- vim.cmd('colorscheme melange') vim.cmd('set bg=dark') --styles: dark, light


-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
