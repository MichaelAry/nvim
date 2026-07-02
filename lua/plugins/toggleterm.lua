local LiveServer

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{
				"<leader>lv",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					if not LiveServer then
						LiveServer = Terminal:new({ cmd = "live-server .", direction = "float" })
					end
					LiveServer:toggle()
				end,
				desc = "Toggle live-server",
			},
		},
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
