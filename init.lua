-- ========================================================================== --
-- 1. SPEED, BEHAVIOR, AND MONOCHROME (Basic settings)
-- ========================================================================== --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true

vim.opt.background = "light"
vim.opt.termguicolors = true

-- ========================================================================== --
-- 2. KEYMAPS (basic)
-- ========================================================================== --
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Below window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Above window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Right window" })

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

-- Remember last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- ========================================================================== --
-- 3. PLUGIN MANAGER (lazy.nvim)
-- ========================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- Easy commenting
		{ "numToStr/Comment.nvim", opts = {} },

		-- Telescope
		{
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			branch = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in project" })
				vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Open buffers" })
			end,
		},

		-- Hop (fast movement)
		{
			"smoka7/hop.nvim",
			branch = "master",
			opts = {},
			config = function()
				require("hop").setup()
				vim.keymap.set("n", "s", "<cmd>HopChar2<CR>", { desc = "Jump to spot" })
			end,
		},

		-- Conform (auto-formatting)
		{
			"stevearc/conform.nvim",
			event = "BufWritePre",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					typescript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					python = { "isort", "black" },
					rust = { "rustfmt" },
					["*"] = { "lsp_format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			},
		},

		-- Blink.cmp (completion)
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
					default = { "lsp", "path", "buffer" },
				},
			},
		},

		-- Zen Mode
		{
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			keys = {
				{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
			},
			opts = {
				window = {
					width = 90,
					options = {
						number = true,
						relativenumber = true,
					},
				},
				plugins = {
					options = { enabled = true },
				},
			},
		},

		-- zenbones theme
		{
			"mcchrish/zenbones.nvim",
			lazy = false,
			priority = 1000,
			dependencies = { "rktjmp/lush.nvim" },
			config = function()
				vim.cmd("colorscheme zenwritten")
				local hl = vim.api.nvim_set_hl
				hl(0, "Normal", { bg = "#eeebe6", fg = "#242422" })
				hl(0, "NormalFloat", { bg = "#e4e1db", fg = "#242422" })
				hl(0, "FloatBorder", { bg = "#e4e1db", fg = "#7f7f7f" })
				hl(0, "Comment", { fg = "#7a7772", italic = true })
				hl(0, "Keyword", { fg = "#111111", bold = true })
				hl(0, "Statement", { fg = "#111111", bold = true })
				hl(0, "String", { fg = "#4a4742" })
				hl(0, "Function", { fg = "#242422" })
				hl(0, "Type", { fg = "#111111", underline = true })
				hl(0, "Constant", { fg = "#444440" })
				hl(0, "LineNr", { fg = "#a5a29d", bg = "#eeebe6" })
				hl(0, "CursorLineNr", { fg = "#111111", bg = "#eeebe6", bold = true })
				hl(0, "SignColumn", { bg = "#eeebe6" })
				hl(0, "CursorLine", { bg = "#e5e2dc" })
				hl(0, "Visual", { bg = "#d7d4ce" })
				hl(0, "Search", { bg = "#ccd8cc", fg = "#111111" })
				hl(0, "WinSeparator", { fg = "#c5c2bc", bg = "#eeebe6" })
			end,
		},

		-- Mini Statusline (minimal, default settings)
		{
			"echasnovski/mini.statusline",
			version = false,
			config = function()
				require("mini.statusline").setup()
			end,
		},

		-- LSP, Mason, and keymaps
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
			config = function()
				require("mason").setup()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
				})

				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(event)
						local map = function(keys, func, desc)
							vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
						end
						map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")
						map("gr", require("telescope.builtin").lsp_references, "Find references")
						map("K", vim.lsp.buf.hover, "Documentation under cursor")
						map("<leader>rn", vim.lsp.buf.rename, "Rename variable")
						map("<leader>ca", vim.lsp.buf.code_action, "Code actions / Fixes")
						map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
						map("]d", vim.diagnostic.goto_next, "Next diagnostic")
						map("<leader>e", vim.diagnostic.open_float, "Show diagnostic float")
					end,
				})
			end,
		},

		-- Gitsigns
		{
			"lewis6991/gitsigns.nvim",
			event = "BufReadPre",
			opts = {
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "▎" },
					topdelete = { text = "▎" },
					changedelete = { text = "▎" },
				},
				signcolumn = true,
				numhl = true,
			},
		},

		-- Which-Key
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				delay = vim.o.timeoutlen,
			},
		},

		-- Oil (file explorer)
		{
			"stevearc/oil.nvim",
			opts = {},
			keys = {
				{ "<leader>e", "<cmd>Oil<CR>", desc = "Open file browser" },
			},
		},

		-- NeoScroll (smooth scrolling)
		{ "karb94/neoscroll.nvim", opts = {} },

		-- Colorizer (preview hex colours)
		{ "norcalli/nvim-colorizer.lua", event = "BufReadPre", opts = {} },

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
					auto_install = true,
					highlight = { enable = true },
				})
			end,
		},
	},
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🔑",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
