return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				kulala = {
					command = "kulala-fmt",
					args = { "format", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				http = { "kulala" },
			},
			format_on_save = true,
		})
	end,
}
