return {

	"cjodo/convert.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local convert = require("convert")

		convert.setup({
			keymaps = {
				focus_next = { "j", "<Tab>" },
				focus_prev = { "k", "<S-Tab>" },
				close = { "<Esc>", "q" },
				submit = { "<CR>" },
			},
			modes = { "color", "size" },
		})

		-- KEYMAPS
		local map = vim.keymap.set

		map("n", "<leader>cn", "<cmd>ConvertFindNext<CR>", { desc = "Find Next Unit" })
		map("n", "<leader>cc", "<cmd>ConvertFindCurrent<CR>", { desc = "Convert Current Line" })

		map({ "n", "v" }, "<leader>ca", "<cmd>ConvertAll<CR>", { desc = "Convert All in Buffer/Selection" })
	end,
}
