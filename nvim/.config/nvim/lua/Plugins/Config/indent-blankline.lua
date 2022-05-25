--  o8o                    .o8                            .
--  `"'                   "888                          .o8
-- oooo  ooo. .oo.    .oooo888   .ooooo.  ooo. .oo.   .o888oo
-- `888  `888P"Y88b  d88' `888  d88' `88b `888P"Y88b    888
--  888   888   888  888   888  888ooo888  888   888    888   8888888
--  888   888   888  888   888  888    .o  888   888    888 .
-- o888o o888o o888o `Y8bod88P" `Y8bod8P' o888o o888o   "888"
--  .o8       oooo                        oooo        oooo   o8o
-- "888       `888                        `888        `888   `"'
--  888oooo.   888   .oooo.   ooo. .oo.    888  oooo   888  oooo  ooo. .oo.    .ooooo.
--  d88' `88b  888  `P  )88b  `888P"Y88b   888 .8P'    888  `888  `888P"Y88b  d88' `88b
--  888   888  888   .oP"888   888   888   888888.     888   888   888   888  888ooo888
--  888   888  888  d8(  888   888   888   888 `88b.   888   888   888   888  888    .o
--  `Y8bod8P' o888o `Y888""8o o888o o888o o888o o888o o888o o888o o888o o888o `Y8bod8P'



vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus'}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
}
