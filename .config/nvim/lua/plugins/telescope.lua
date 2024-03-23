local telescope_opts = {
    defaults = {
        file_ignore_patterns = { "target/*" },
    },
}

return {
    {
        "nvim-telescope/telescope.nvim",
        opts = telescope_opts,
    },
}
