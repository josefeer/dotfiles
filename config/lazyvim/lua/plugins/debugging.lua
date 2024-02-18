return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python"
  },
  keys = {
    { "<leader>d", desc = "Debugger" },
    { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require('dap').continue() end, desc = "Continue" },
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")
    local dap_python = require("dap-python")

    dap_ui.setup()
    dap_python.setup('~/.venvs/debugpy/bin/python')

    dap.listeners.before.attach.dap_ui_config = function()
      dap_ui.open()
    end

    dap.listeners.before.launch.dap_ui_config = function()
      dap_ui.open()
    end

    dap.listeners.before.event_terminated.dap_ui_config = function()
      dap_ui.close()
    end

    dap.listeners.before.event_exited.dap_ui_config = function()
      dap_ui.close()
    end

  end,
}
