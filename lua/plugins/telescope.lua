return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					-- необязательно, но улучшает совместимость с монохромной темой
					path_display = { "truncate" },
				},
			})
			pcall(telescope.load_extension, "fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in project" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Open buffers" })
		end,
	},
}
