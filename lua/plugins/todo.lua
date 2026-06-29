return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {
      signs = true,
      highlight = {
        keyword = "wide_bg",
      },
      keywords = {
        FIX = { icon = "🪲", color = "error" },
        TODO = { icon = "✓", color = "info" },
        HACK = { icon = "⚡", color = "warning" },
        WARN = { icon = "⚠", color = "warning" },
        PERF = { icon = "⚙", color = "warning" },
        NOTE = { icon = "·", color = "hint" },
      },
    },
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Search todos" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev todo" },
    },
  },
}
