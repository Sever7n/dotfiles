local function setup_harpoon()
    local harpoon = require("harpoon")

    harpoon:setup()
end

return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = setup_harpoon,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}
