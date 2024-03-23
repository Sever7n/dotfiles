local lualine_opts = {
    theme = "catppuccin",
    options = {
        component_separators = " ",
        section_separators = { left = "", right = "" },
    },
}

return {
    {
        'nvim-lualine/lualine.nvim',
        opts = lualine_opts,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    }
}
