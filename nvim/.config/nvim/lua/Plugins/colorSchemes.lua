return require('packer').startup({
    function(use)
        -- Color Schemes
        use({
            "catppuccin/nvim",
            as = "catppuccin"
        })
		use {
            "rose-pine/neovim", -- https://github.com/rose-pine/neovim
            as = "rose-pine",
            cmd = "colorscheme rose-pine",
        }
		use {
            "matsuuu/pinkmare",
            cmd = "colorscheme pinkmare"
        }
		--use({ "philip1987/embark" })
		 use {"embark-theme/vim",
             as = "embark",
             cmd = "colorscheme embark",
         }
		use {
            "marko-cerovac/material.nvim", -- https://github.com/marko-cerovac/material.nvim
            cmd = "colorscheme material",
        }
		use {
            "sainnhe/sonokai", -- https://github.com/sainnhe/sonokai
            cmd = "colorscheme sonokai",
        }
		use {
            "sainnhe/edge", -- https://github.com/sainnhe/edge
            cmd = "colorscheme edge",
        }
		use {
            "savq/melange", -- https://github.com/savq/melange
            cmd = "colorscheme melange",
        }
		use {
            "shaunsingh/moonlight.nvim", -- https://github.com/shaunsingh/moonlight.nvim
            cmd= "colorscheme moonlight",
        }
		use {
            "sainnhe/everforest", -- https://github.com/sainnhe/everforest
            cmd = "colorscheme everforest",
        }
		use {
            "yashguptaz/calvera-dark.nvim", -- https://github.com/yashguptaz/calvera-dark.nvim
            cmd = "colorscheme calvera",
        }
		use {
            "eddyekofo94/gruvbox-flat.nvim",
            cmd = "colorscheme gruvbox-flat",
            }

		-- vim.cmd('colorscheme everforest') vim.g.everforest_background = "soft" --styles: hard, medium, soft
        --vim.g.colors_name = "embark"
		-- vim.cmd('colorscheme embark')
		-- vim.cmd('colorscheme edge') vim.g.edge_style = 'neon' --styles: default, aura, neon
		-- vim.cmd('colorscheme sonokai') vim.g.sonokai_style = 'espresso' --styles: default, atlantis, andromeda, shusia, maia, espresso
		-- vim.cmd('colorscheme material') vim.g.material_style = "palenight" --styles: oceanic, deep ocean, palenight, darker, lighter
		-- vim.cmd('colorscheme rose-pine') vim.g.rose_pine_variant = "base" --styles: base, moon, dawn
		vim.cmd('colorscheme pinkmare')
		-- vim.cmd('colorscheme catppuccin')
		-- vim.cmd('colorscheme moonlight')
		-- vim.cmd('colorscheme calvera')
		-- vim.cmd('colorscheme melange') vim.cmd('set bg=dark') --styles: dark, light
end
})
