return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "javascript", "typescript", "tsx", "css", "json" },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
}
