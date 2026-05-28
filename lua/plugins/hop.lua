return {
  {
    "smoka7/hop.nvim",
    branch = "master",
    opts = {},
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "s", "<cmd>HopChar2<CR>", { desc = "Jump to spot" })
    end,
  },
}
