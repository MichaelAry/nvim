return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHighlight.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-vitest"),
        },
        summary = {
          enabled = true,
          expand_errors = true,
          follow = true,
        },
        output = {
          enabled = true,
          open_on_run = true,
        },
      })

      vim.keymap.set("n", "<leader>t", function()
        neotest.run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>T", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run all tests in file" })

      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open()
      end, { desc = "Open test output" })

      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, { desc = "Toggle test summary" })
    end,
  },
}
