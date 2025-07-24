return {
	{
		"ahmedkhalf/project.nvim",
		lazy = false, -- ou true, se preferir carregar sob demanda
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", "Makefile", "package.json" }, -- padrões para detectar projetos
			})
			require("telescope").load_extension("projects")
		end,
	},
}
