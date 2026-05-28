return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
		},
		config = function()
			vim.g.undotree_WindowLayout = 2 -- вертикальное окно
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}
