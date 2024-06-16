local function setup_cmp()
    local cmp = require("cmp")
    cmp.setup({
        preselect = cmp.PreselectMode.None,
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            -- Add tab support
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "path" },
            { name = "buffer" },
            {
                name = "lazydev",
                group_index = 0,
            },
        }
    })
end

return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        config = setup_cmp,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    }
}
