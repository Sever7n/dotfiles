local function setup_dap()
    local path = vim.fn.expand("$MASON/bin/OpenDebugAD7")

    local dap = require("dap")
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = path,
    }

    local function get_conf(t, p)
        return {
            {
                name = "Launch file",
                type = t,
                request = "launch",
                program = p,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
            }
        }
    end

    local function get_rust_bin()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end

    local function get_bin()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end

    local rconf = get_conf("cppdbg", get_rust_bin)
    local cconf = get_conf("cppdbg", get_bin)

    dap.configurations.rust = rconf
    dap.configurations.c = cconf
    dap.configurations.cpp = cconf
end

-- local function setup_dapui()
--     local dap = require("dap")
--     local dapui = require("dapui")
--     dapui.setup()

--     dap.listeners.after.event_initialized["dapui_config"] = dapui.open
--     dap.listeners.after.event_terminated["dapui_config"] = dapui.close
--     dap.listeners.after.event_exited["dapui_config"] = dapui.close
-- end

return {
    {
        "mfussenegger/nvim-dap",
        config = setup_dap,
        dependencies = { "mfussenegger/mason.nvim" },
    },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     config = setup_dapui,
    --     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    -- }
    {
        "igorlfs/nvim-dap-view",
        dependencies = {"mfussenegger/nvim-dap"}
    }
}
