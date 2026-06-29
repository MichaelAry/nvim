return {
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "i", "s" }, "<C-e>", function()
        return vim.fn["emmet#expandAbbr"](vim.fn.getline("."), vim.fn.getpos("."))
      end, { expr = true, desc = "Expand emmet abbreviation" })
    end,
  },
}
