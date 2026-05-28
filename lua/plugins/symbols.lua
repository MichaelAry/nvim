return {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>o", "<cmd>SymbolsOutline<CR>", desc = "Toggle symbols outline" },
    },
    opts = {
      position = "right",
      width = 40,
      show_numbers = true,
      show_guides = true,
      filter_filetype = {
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "lua",
        "python",
        "html",
        "css",
      },
      keymaps = {
        hover = "K",
        goto_location = "<Cr>",
        focus_location = "o",
      },
    },
  },
}
