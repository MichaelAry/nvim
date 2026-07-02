-- Лидер-клавиши
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Основные опции
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false -- скрываем встроенный индикатор режима
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

-- Настройка диагностики (LSP + линтеры)
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
		source = "if_many",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Цветовая схема (задаётся темой, но фон явно укажем)
vim.opt.background = "light"
vim.opt.termguicolors = true

-- Клавиши
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Below window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Above window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Right window" })

-- Автокоманды
-- Подсветка только что скопированного текста
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

-- Восстановление позиции курсора при открытии файла
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})
-- Горизонтальный и вертикальный сплит
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })

-- Закрыть окно (альтернатива <C-w>q)
vim.keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close window" })

-- Изменение размера окон через Ctrl+стрелки
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Выравнять размеры всех окон
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize window sizes" })
-- В settings.lua
vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Toggle last buffer" })
