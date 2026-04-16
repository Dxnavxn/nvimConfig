return {
	{
		"3rd/image.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			backend = "ueberzug",
			processor = "magick_cli",
			-- Forces the plugin to tell ueberzugpp to use a black canvas
			background_color = "#000000",
			processor_options = {
				magick_cli = {
					all = {
						"-background",
						"black",
						"-alpha",
						"remove",
						"-flatten",
					},
				},
			},
			max_width = 100,
			max_height = 12,
			window_overlap_clear_enabled = true,
			editor_only_render_when_focused = false,
			zindex = 20,
			clean_graphics_on_exit = true,
		},
		config = function(_, opts)
			local image = require("image")
			image.setup(opts)

			local function render_neotree_image()
				if vim.bo.filetype ~= "neo-tree" then
					return
				end
				local success, manager = pcall(require, "neo-tree.sources.manager")
				if not success then
					return
				end

				local state = manager.get_state("filesystem")
				if not (state and state.tree) then
					return
				end
				local node = state.tree:get_node()

				if not (node and node.path) then
					image.clear()
					return
				end

				local path = node.path:lower()
				local is_image = path:match("%.png$")
					or path:match("%.jpg$")
					or path:match("%.jpeg$")
					or path:match("%.webp$")
					or path:match("%.svg$")
					or path:match("%.gif$")

				if is_image then
					-- Attempt to force a clear and re-render
					image.clear()
					local ok, img = pcall(function()
						return image.from_file(node.path)
					end)

					if ok and img then
						vim.defer_fn(function()
							-- We call render with the forced background color option
							img:render({
								x = 42,
								y = 2,
								width = 50,
								height = 20,
								background_color = "#000000",
							})
						end, 15) -- Slightly longer delay for st/ueberzug stability
					end
				else
					image.clear()
				end
			end

			-- Autocmds
			vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter" }, {
				group = vim.api.nvim_create_augroup("NeoTreeImageHover", { clear = true }),
				callback = function()
					vim.schedule(function()
						pcall(render_neotree_image)
					end)
				end,
			})

			vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
				callback = function()
					pcall(image.clear)
				end,
			})
		end,
	},
}
