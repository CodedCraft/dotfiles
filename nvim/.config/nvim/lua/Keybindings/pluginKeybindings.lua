-- `888
--  888  oooo   .ooooo.  oooo    ooo ooo. .oo.  .oo.    .oooo.   oo.ooooo.
--  888 .8P'   d88' `88b  `88.  .8'  `888P"Y88bP"Y88b  `P  )88b   888' `88b
--  888888.    888ooo888   `88..8'    888   888   888   .oP"888   888   888
--  888 `88b.  888    .o    `888'     888   888   888  d8(  888   888   888
-- o888o o888o `Y8bod8P'     .8'     o888o o888o o888o `Y888""8o  888bod8P'
--                       .o..P'                                   888
--                       `Y8P'                                   o888o

---------------------------------------------------------------------------------------------------
-- Todo:
-- [] Refactor LSPsaga commands to lua format: vim.api.nvim_set_keymap(...
-- [] Create a visual keymap for all bindings
-- [ ] Remap <leader>q to :bd if mutliple buffers are open
-- [ ] Remap <leader>wq to :w & :bd if mutliple buffers are open
-- [x] Figlet Title
---------------------------------------------------------------------------------------------------

-- Neovim-Keybindings -----------------------------------------------------------------------------

    -- Set Leader key to 'Space'
    vim.g.mapleader = " "

    -- Window movement with Ctrl-h/j/k/l
    vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })


    -- Navigate open buffers with Tab & Shift-Tab
    vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })


    -- Move selected lines / blocks up and down with K and J (<--captial letters)
    vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })


    -- Map :w , :q and :q! to Ctrl-w Ctrl-q and Shift-Ctrl-q
    --vim.api.nvim_set_keymap('n', '<Leader>q', "len(getbufinfo({'buflisted':1}))>1 ? ':q<CR>' : ':bd<CR>'", { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>qq', ':q!<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })


-- Nvim-Compe -------------------------------------------------------------------------------------

    --vim.api.nvim_set_keymap("i", "<Tab>", "compe#complete()", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
    vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


-- Telescope --------------------------------------------------------------------------------------

    -- Keybindings to launch Telescope-Files, -Grep, -Buffers, -Help respectively
    local opt = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('n', '<leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opt)
    vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opt)
    vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opt)
    vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opt)
    vim.api.nvim_set_keymap('n', '<leader>vv', "<cmd>lua require('Plugins.Config.telescope').search_dotfiles()<cr>", opt)


    -- Remap 'Next Item' & ''Previous Item' in Telescope insert mode to: Ctrl-j / Ctrl-k
    local actions = require('telescope.actions')
    require('telescope').setup{
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      }
    }


-- LSPsaga ----------------------------------------------------------------------------------------

    -- lsp provider to find the cursor word definition and reference
        vim.api.nvim_set_keymap('n', 'gh', "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", {silent = true})
    -- code action
	vim.cmd('nnoremap <silent><leader>ca :Lspsaga code_action<CR>')
            -- nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
            -- vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
        -- show hover doc
            vim.cmd([[nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]])
        -- scroll down hover doc or scroll in definition preview
            -- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
        -- scroll up hover doc
            -- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
    -- -- rename
            -- nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
    -- -- float terminal also you can pass the cli command in open_float_terminal function
             vim.cmd([[nnoremap <silent><leader>tt <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>]]) -- or open_float_terminal('lazygit')<CR>
             vim.cmd([[tnoremap <silent><leader>tt <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]])

	-- show diagnostics
	vim.cmd([[nnoremap <silent><leader>sd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]])
	-- jump diagnostic
	vim.cmd([[nnoremap <silent> <leader>p <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]])
	vim.cmd([[nnoremap <silent> <leader>n <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]])


-- Nvim Tree --------------------------------------------------------------------------------------

    -- Toggle NvimTree - leader + e
    vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Packer -----------------------------------------------------------------------------------------
    -- Update plugins -> leader + pu
    vim.api.nvim_set_keymap('n', '<Leader>pu', ':PackerUpdate<CR>', {noremap = true, silent = true})

-- TrueZen ----------------------------------------------------------------------------------------
    -- Toggle TrueZen's Ataraxis Mode aka my zen mode - leader + z
    vim.api.nvim_set_keymap("n", "<Leader>z", [[<Cmd>TZAtaraxis<CR>]], opt)
