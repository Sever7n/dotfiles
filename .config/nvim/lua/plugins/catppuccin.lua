local catppuccin_opts = {
    transparent_background = true,
    show_end_of_buffer = false,
    integrations = {
        harpoon = true,
    },
}

local function setup_theme()
    require("catppuccin").setup(catppuccin_opts)
    vim.cmd.colorscheme "catppuccin-macchiato"
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = setup_theme,
    },
}
