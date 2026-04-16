return {
	-- 1. Closes (), {}, [], and ""
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true, -- This runs the default setup automatically
	},

	-- 2. Closes <div></div> and renames pairs
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "xml" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
