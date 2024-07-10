local function init_vimtex()
    vim.g.vimtex_view_method = 'zathura'
end

return {
    {
        "lervag/vimtex",
        init = init_vimtex(),
        ft = { "tex", "bib" },
    },
}
