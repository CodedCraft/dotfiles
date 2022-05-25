--    o8o               o8o      .       oooo
--    `"'               `"'    .o8       `888
--    ooo  ooo. .oo.   oooo  .o888oo      888  oooo  oooo   .oooo.
--    888  `888P"Y88b  `888    888        888  `888  `888  `P  )88b
--    888   888   888   888    888        888   888   888   .oP"888
--    888   888   888   888    888 . .o.  888   888   888  d8(  888
--    888o o888o o888o o888o   "888" Y8P o888o  `V88V"V8P' `Y888""8o
--
---------------------------------------------------------------------------------------------------
-- Sourcing Plugins, Settings, Keymappings & Autocommands in the following directories:
-- ~/.config/nvim/lua/*/*.lua => where */* gets replaced with e.g. Settings/settings
---------------------------------------------------------------------------------------------------

require ('Settings/settings')

require ('Plugins/plugins')

--require ('Plugins/colorSchemes')

require ('Keybindings/keybindings')

require ('Autocommands/autocommands')
