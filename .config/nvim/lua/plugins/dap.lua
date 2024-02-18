local function setup_dap()
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    local path = codelldb:get_install_path() .. "/extension/adapter/codelldb"

    local dap = require("dap")
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = path,
            args = { "--port", "${port}" },
        }
    }

    local function get_conf(t, p)
        return {
            {
                name = "Launch file",
                type = t,
                request = "launch",
                program = p,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            }
        }
    end

    local function get_rust_bin()
       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end

    local function get_bin()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end

    local rconf = get_conf("codelldb", get_rust_bin)
    local cconf = get_conf("codelldb", get_bin)

    dap.configurations.rust = rconf
    dap.configurations.c = cconf
    dap.configurations.cpp = cconf
end

local function setup_dapui()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.after.event_terminated["dapui_config"] = dapui.close
    dap.listeners.after.event_exited["dapui_config"] = dapui.close
end

return {
    {
        "mfussenegger/nvim-dap",
        config = setup_dap,
        dependencies = { "mfussenegger/mason.nvim" },
    },
    {
        "rcarriga/nvim-dap-ui",
        config = setup_dapui,
        dependencies = { "mfussenegger/nvim-dap" },
    }
}
