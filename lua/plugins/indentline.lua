return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		opts = {
			-- Настройки для v3
			indent = {
				char = "▏",
				highlight = "Comment",
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				highlight = "CursorLine",
			},
		},
		main = "ibl", -- важно для v3
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},
}
