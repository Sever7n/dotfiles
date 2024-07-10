local capabilities = require("cmp_nvim_lsp").default_capabilities()
local mason_opts = {
    ensure_installed = { "rust_analyzer", "lua_ls" },
    automatic_installation = true,
    handlers = {
        function(server)
            require("lspconfig")[server].setup({
                capabilities = capabilities
            })
        end,
        ["rust_analyzer"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities 
            }
        end
    }
}

local function setup_lsp()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            local opts = { buffer = ev.buffer }

            local function set(k, a)
                vim.keymap.set("n", k, a, opts)
            end

            set("ga", vim.lsp.buf.code_action)
            set("gd", vim.lsp.buf.definition)
            set("gi", vim.lsp.buf.implementation)
            set("<leader>rn", vim.lsp.buf.rename)
            set("<leader>rf", function()
                vim.lsp.buf.format { async = true }
            end)
        end
    })
end

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "Bilal2453/luvit-meta",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        config = setup_lsp,
    },
    {
        "williamboman/mason.nvim",
        config = true,
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "williamboman/mason-lspconfig",
        opts = mason_opts,
        dependencies = { "williamboman/mason.nvim" },
    },
}
