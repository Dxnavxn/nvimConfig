return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- HTML/CSS/JS/JSON 
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },

			-- Python 
			python = { "black" },

			-- Lua 
			-- lua = { "stylua" },
		},
		-- Format on save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
