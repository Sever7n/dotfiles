local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- require('lazy').setup({
--   'wbthomason/packer.nvim',
--   'neovim/nvim-lspconfig',
--   "williamboman/mason.nvim",
--   "williamboman/mason-lspconfig.nvim",
--   {
--     "j-hui/fidget.nvim",
--     config = function()
--       require("fidget").setup()
--     end
--   },
--   "hrsh7th/nvim-cmp",
--   -- cmp LSP completion
--   "hrsh7th/cmp-nvim-lsp",
--   -- cmp Snippet completion
--   "hrsh7th/cmp-vsnip",
--   -- cmp Path completion
--   "hrsh7th/cmp-path",
--   "hrsh7th/cmp-buffer",

--   'hrsh7th/vim-vsnip',

--   'simrat39/rust-tools.nvim',

--   {
--     "rust-lang/rust.vim",
--     ft = "rust",
--     init = function()
--       vim.g.rustfmt_autosave = 1
--     end
--   },

--   'nvim-lua/popup.nvim',
--   'nvim-lua/plenary.nvim',
--   'nvim-telescope/telescope.nvim',
--   {
--     'ahmedkhalf/project.nvim',
--     config = function()
--       require("project_nvim").setup {
--         patterns = { "Cargo.toml" },
--         exclude_dirs = { "~/.cargo/*" }
--       }
--     end
--   },

--   'tpope/vim-fugitive',
--   'tpope/vim-sensible',
--   'tpope/vim-commentary',
--   'tpope/vim-surround',
--   'tpope/vim-eunuch',

--   {
--     'saecki/crates.nvim',
--     config = function()
--         require('crates').setup()
--     end,
--   },

--   "nvim-telescope/telescope-file-browser.nvim",
--   'nvim-telescope/telescope-ui-select.nvim',

--   'mfussenegger/nvim-dap',
--   "rcarriga/nvim-dap-ui",

--   'mfussenegger/nvim-lint',
--   'tikhomirov/vim-glsl',
--   'nvim-treesitter/nvim-treesitter',

--   'nvim-tree/nvim-web-devicons',

--   {
-- 	"windwp/nvim-autopairs",
--     config = function() require("nvim-autopairs").setup {} end
--   },

--   'nvim-lualine/lualine.nvim',

--   { "catppuccin/nvim", name = "catppuccin" }
-- })
