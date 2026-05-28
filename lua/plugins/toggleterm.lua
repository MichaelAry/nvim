return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 20,
			open_mapping = [[<C-\>]], -- Ctrl+\ для открытия/закрытия терминала
			hide_numbers = true,
			start_in_insert = true,
			persist_mode = true,
			direction = "float",
			float_opts = {
				border = "single",
			},
		},
	},
}
