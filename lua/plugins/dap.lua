return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "js-debug-adapter", "debugpy" },
        handlers = {},
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.after.event_terminated["dapui_config"] = dapui.close
      dap.listeners.after.event_exited["dapui_config"] = dapui.close

      require("nvim-dap-virtual-text").setup()

      vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "Debug: start/continue" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: step over" })
      vim.keymap.set("n", "<leader>dO", dap.step_into, { desc = "Debug: step into" })
      vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: terminate" })
      vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: restart" })
    end,
  },
}
