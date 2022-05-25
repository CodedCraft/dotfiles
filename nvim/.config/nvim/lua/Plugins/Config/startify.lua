--              .                          .    o8o   .o88o.
--            .o8                        .o8    `"'   888 `"
--  .oooo.o .o888oo  .oooo.   oooo d8b .o888oo oooo  o888oo  oooo    ooo
-- d88(  "8   888   `P  )88b  `888""8P   888   `888   888     `88.  .8'
-- `"Y88b.    888    .oP"888   888       888    888   888      `88..8'
-- o.  )88b   888 . d8(  888   888       888 .  888   888       `888'
-- 8""888P'   "888" `Y888""8o d888b      "888" o888o o888o       .8'
--                                                           .o..P'
--                                                           `Y8P'

-------------------------------------------------------------------------
-- Todo
-- [] Make Galaxy disappear on startup
-------------------------------------------------------------------------

vim.api.nvim_exec(
	[[let g:startify_lists = [{ 'type': 'files'}, { 'type': 'bookmarks'}, ] ]], true)

vim.api.nvim_exec(
 "let startify_bookmarks = [ { \'J\': \'~/MyFiles/LifeAreas/WrittenDocs/Journal/journal.md' } ]", true)
vim.cmd('let g:startify_center=80')

vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])
