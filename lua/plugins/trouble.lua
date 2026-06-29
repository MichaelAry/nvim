return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble: diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: buffer diagnostics" },
      { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Trouble: quickfix" },
      { "<leader>xt", "<cmd>Trouble todos toggle<CR>", desc = "Trouble: todos" },
    },
  },
}
