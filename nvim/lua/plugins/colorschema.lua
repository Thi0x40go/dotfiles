return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
				saturation = 1,
				overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
					return {
						["@keyword.repeat.twig"] = {
							fg = colors.purple,
							bold = true,
						},
						["@keyword.conditional.twig"] = { fg = colors.pink, bold = true },
						["@keyword.twig"] = { fg = colors.pink, bold = true },
						["@tag.twig"] = { fg = colors.pink, bold = true },
						Identifier = { fg = colors.pink },
					}
				end,
			})
		end,
	},
}
