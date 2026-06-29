return {
  {
    "monaqa/dial.nvim",
    keys = {
      { "g<C-a>", desc = "Dial: increment" },
      { "g<C-x>", desc = "Dial: decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y-%m-%d"],
          augend.hexcolor.new({ uppercase = false }),
          augend.hexcolor.new({ uppercase = true }),
          augend.semver.alias.semver,
          augend.constant.alias.bool,
          augend.constant.new({ elements = { "let", "const", "var" } }),
          augend.constant.new({ elements = { "true", "false" } }),
        },
      })
    end,
  },
}
