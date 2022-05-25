local M = {}
M.themeChanger = function() --(theme)
    local sedCmd = string.format([[sed -i "" -e "s#^colors: \*.*#colors: *%s#g" $HOME/.config/alacritty/colors.yml]], "embark")
    --local vimCmd = string.format('colorscheme %s', "embark")
    --vim.cmd(vimCmd)
    vim.cmd('colorscheme embark')
    os.execute(sedCmd)
end
