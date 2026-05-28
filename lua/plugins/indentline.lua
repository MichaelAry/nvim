return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		opts = {
			char = "▏",
			show_trailing_blankline_indent = false,
			show_first_indent_level = true,
			use_treesitter = true,
			-- Настройка цветов под вашу тему
			indent_blankline_char_highlight_list = { "Comment" },
			scope_enabled = true,
			scope_highlight_list = { "CursorLine" },
			-- можно полностью отключить подсветку scope, чтобы оставаться минималистичным
		},
	},
}
