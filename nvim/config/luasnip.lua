local ls = require("luasnip")

ls.config.setup({ enable_autosnippets = true })

vim.keymap.set({"i", "s"}, "<C-i>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-u>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

