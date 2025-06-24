require("nvim-autopairs").setup({})

local Rule = require('nvim-autopairs.rule')
local pairs = require('nvim-autopairs')

pairs.add_rule(Rule("$","$","tex, latex, typst"))
pairs.add_rule(Rule("$$","$$","tex, latex, typst"))
