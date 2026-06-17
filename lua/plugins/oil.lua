return {
	{
		"stevearc/oil.nvim",
		opts = {},
		keys = {
			{ "<leader>e", "<cmd>Oil<CR>", desc = "Open file browser" },
			{ "<leader>E", vim.diagnostic.setloclist, desc = "Diagnostics quickfix" },
		},
	},
}
