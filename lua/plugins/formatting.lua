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
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				jsx = { "prettierd", "prettier", stop_after_first = true },
				tsx = { "prettierd", "prettier", stop_after_first = true },
			},
			-- 2. Enable automatic format-on-save
			format_on_save = function(bufnr)
				return {
					timeout_ms = 500,
					lsp_fallback = true,
				}
			end, -- FIXED: Added missing end for function
		}, -- FIXED: Added missing closing brace for opts
	}, -- FIXED: Replaced trailing comma with closing brace for conform table
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
