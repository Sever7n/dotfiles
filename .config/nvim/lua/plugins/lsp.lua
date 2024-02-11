local mason_opts = {
    ensure_installed = { "rust_analyzer", "lua_ls" },
    automatic_installation = true,
    handlers = {
        function (server)
            require("lspconfig")[server].setup({})
        end,
    }
}

local function setup_lsp()
end

return {
    {
        "neovim/nvim-lspconfig",
        config = setup_lsp,
    },
    {
        "williamboman/mason.nvim",
        config = true,
        dependencies = { "neovim/nvim-lspconfig" }
    },
    {
        "williamboman/mason-lspconfig",
        opts = mason_opts,
        dependencies = { "williamboman/mason.nvim" },
    },
}
