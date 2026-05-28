-- Лидер-клавиши
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Основные опции
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false            -- скрываем встроенный индикатор режима
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
