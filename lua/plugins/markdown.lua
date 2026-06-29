return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      local dir = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim"
      vim.fn.system({ "npm", "install", "--prefix", dir .. "/app" })
      vim.fn.system({ "git", "-C", dir, "checkout", "--", "app/yarn.lock" })
    end,
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown: preview" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "Markdown: stop preview" },
    },
  },
}
