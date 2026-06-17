return {
	{
		"Saghen/blink.cmp",
		version = "*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-space>"] = { "show", "hide" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			snippets = {
				preset = "luasnip",
			},
			sources = {
				default = { "lsp", "path", "buffer" }, -- было "npm" убрали
				per_filetype = {
					javascript = { "lsp", "path", "buffer" },
					typescript = { "lsp", "path", "buffer" },
					tsx = { "lsp", "path", "buffer" },
					jsx = { "lsp", "path", "buffer" },
				},
			},
		},
	},
}
