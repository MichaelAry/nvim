return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        width = 90,
        options = {
          number = true,
          relativenumber = true,
        },
      },
      plugins = {
        options = { enabled = true },
      },
    },
  },
}
