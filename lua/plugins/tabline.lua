return {
	{
		"echasnovski/mini.tabline",
		version = false,
		config = function()
			require("mini.tabline").setup({
				show_icons = false,
				set_vim_settings = true,
				tabpage_section = "none",
			})
		end,
	},
}
