return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = false },
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      package.loaded["async"] = require("plenary.async")
      require("refactoring").setup({})

      vim.keymap.set("x", "<leader>rf", function()
        require("refactoring").refactor("Extract Function")
      end, { desc = "Refactor: extract function" })

      vim.keymap.set("x", "<leader>rv", function()
        require("refactoring").refactor("Extract Variable")
      end, { desc = "Refactor: extract variable" })

      vim.keymap.set("n", "<leader>ri", function()
        require("refactoring").refactor("Inline Variable")
      end, { desc = "Refactor: inline variable" })
    end,
  },
}
