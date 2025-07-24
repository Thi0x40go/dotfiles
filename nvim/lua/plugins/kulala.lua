return {
	{
		"mistweaverco/kulala.nvim",
		lazy = false,
		keys = {
			{ "<leader>rs", desc = "send request" },
			{ "<leader>ra", desc = "send all requests" },
			{ "<leader>rb", desc = "open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			-- your configuration comes here
			global_keymaps = true,
		},
		config = function()
			require("kulala").setup()
		end,
	},
}
