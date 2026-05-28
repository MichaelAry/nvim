return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")
          map("gr", require("telescope.builtin").lsp_references, "Find references")
          map("K", vim.lsp.buf.hover, "Documentation under cursor")
          map("<leader>rn", vim.lsp.buf.rename, "Rename variable")
          map("<leader>ca", vim.lsp.buf.code_action, "Code actions / Fixes")

          -- Диагностика: клавиши [d и ]d теперь предоставляет mini.bracketed,
          -- поэтому здесь мы их НЕ задаём, чтобы не дублировать.
          -- Но можно оставить отдельный float для подробностей:
          map("gl", vim.diagnostic.open_float, "Show diagnostic float")
        end,
      })
    end,
  },
}
