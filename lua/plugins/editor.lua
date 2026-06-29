return {
  -- Статуслайн
  {
    "echasnovski/mini.statusline",
    version = false,
    config = function()
      require("mini.statusline").setup()
    end,
  },

  -- Плавная прокрутка
  { "karb94/neoscroll.nvim", opts = {} },

  -- Подсветка hex-цветов
  { "norcalli/nvim-colorizer.lua", event = "BufReadPre", opts = {} },

  -- Умные текстовые объекты (ia, aa и т.п.) — очень рекомендую!
  { "echasnovski/mini.ai", version = false, config = true },

  -- Окружение: sa, sd, sr (скобки, кавычки, теги)
  { "echasnovski/mini.surround", version = false, config = true },

  -- Автозакрытие парных символов
  { "echasnovski/mini.pairs", version = false, config = true },

  -- Навигация по диагностикам, буферам, quickfix через [ и ]
  {
    "echasnovski/mini.bracketed",
    version = false,
    config = true,
    -- При желании можно переопределить клавиши, но по умолчанию:
    -- [d/]d – диагностики, [b/]b – буферы, [q/]q – quickfix, [t/]t – теги
  },
}
