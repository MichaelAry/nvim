return {
  {
    "mcchrish/zenbones.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd("colorscheme zenwritten")

      local hl = vim.api.nvim_set_hl
      hl(0, "Normal", { bg = "#eeebe6", fg = "#242422" })
      hl(0, "NormalFloat", { bg = "#e4e1db", fg = "#242422" })
      hl(0, "FloatBorder", { bg = "#e4e1db", fg = "#7f7f7f" })
      hl(0, "Comment", { fg = "#7a7772", italic = true })
      hl(0, "Keyword", { fg = "#111111", bold = true })
      hl(0, "Statement", { fg = "#111111", bold = true })
      hl(0, "String", { fg = "#4a4742" })
      hl(0, "Function", { fg = "#242422" })
      hl(0, "Type", { fg = "#111111", underline = true })
      hl(0, "Constant", { fg = "#444440" })
      hl(0, "LineNr", { fg = "#a5a29d", bg = "#eeebe6" })
      hl(0, "CursorLineNr", { fg = "#111111", bg = "#eeebe6", bold = true })
      hl(0, "SignColumn", { bg = "#eeebe6" })
      hl(0, "CursorLine", { bg = "#e5e2dc" })
      hl(0, "Visual", { bg = "#d7d4ce" })
      hl(0, "Search", { bg = "#ccd8cc", fg = "#111111" })
      hl(0, "WinSeparator", { fg = "#c5c2bc", bg = "#eeebe6" })
    end,
  },
}
