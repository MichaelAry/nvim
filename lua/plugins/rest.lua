return {
  {
    "mistweaverco/kulala.nvim",
    cmd = "Kulala",
    opts = {
      default_view = "body",
      icons = {
        inlay = {
          loading = "⏳",
          done = "✓",
          error = "✗",
        },
      },
    },
    keys = {
      { "<leader>rr", "<cmd>Kulala<CR>", desc = "Rest: run request" },
      { "<leader>rp", "<cmd>lua require('kulala').preview()<CR>", desc = "Rest: preview" },
      { "<leader>rl", "<cmd>lua require('kulala').replay()<CR>", desc = "Rest: re-run last" },
    },
  },
}
