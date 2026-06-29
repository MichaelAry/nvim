return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- 1. Map your favorite formatters to file types
			formatters_by_ft = {

				lua = { "stylua" },
				python = { "isort", "black" }, -- Runs isort, then black
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				jsx = { "prettier" },
				tsx = { "prettier" },
			},
			-- 2. Enable automatic format-on-save
			format_on_save = function(bufnr)
				return {
					timeout_ms = 500,
					lsp_fallback = true,
				}
			end,
		},
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", config = true }, -- <-- гарантирует инициализацию Mason
			"stevearc/conform.nvim",
		},
		config = function()
			require("mason-conform").setup()
		end,
	},
}
