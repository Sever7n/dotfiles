local map = vim.keymap.set

map('n', '<leader><leader>', ":so<CR>")

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fe', ":Ex<Cr>", {})
map('n', 'gs', builtin.lsp_document_symbols, {})
map('n', 'gS', builtin.lsp_workspace_symbols, {})
map('n', 'gr', builtin.lsp_references, {})
map('n', 'gD', builtin.lsp_implementations, {})
map('n', '<leader>d', builtin.diagnostics, {})
map('n', 'gb', builtin.buffers, {})

-- debugging
local dap = require("dap")
map('n', '<leader>b', dap.toggle_breakpoint, {})
map('n', '<F5>', dap.continue, {})
map('n', '<F10>', dap.step_over, {})
map('n', '<F11>', dap.step_into, {})
map('n', '<F12>', dap.step_out, {})
