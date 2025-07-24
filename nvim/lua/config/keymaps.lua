local wk = require("which-key")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local conf = {
	preset = "modern",
	presets = {
		operators = true,
		motions = false,
		text_objects = true,
		windows = true,
		nav = false,
		z = true,
		g = false,
	},
	delay = 1000,
}

wk.setup(conf)

if pcall(require, "obsidian") then
	wk.add({
		{ "<leader>o", group = "Obsidian" },
		{ "<leader>ot", vim.cmd.ObsidianTomorrow, desc = "Obsidian tomorrow note" },
		{ "<leader>od", vim.cmd.ObsidianToday, desc = "Obsidian daily note" },
		{ "<leader>oy", vim.cmd.ObsidianYesterday, desc = "Obsidian yesterday note" },
		{ "<leader>oc", vim.cmd.ObsidianTemplate, desc = "Complete with template" },
		{ "<leader>of", vim.cmd.ObsidianQuickSwitch, desc = "Jump to another note" },
		{ "<leader>os", vim.cmd.ObsidianSearch, desc = "Search in notes" },
		{
			"<leader>oP",
			function()
				vim.cmd("ObsidianPasteImg " .. vim.fn.input("Image Name: "))
			end,
			desc = "Obsidian paste image",
		},
	})
end

-- Overseer Key maps
if pcall(require, "overseer") then
	wk.add({
		{ "<leader>o", group = "Overseer", icon = "", icon_hl = "Function" },
		{
			"<leader>oo",
			"<cmd>OverseerToggle<CR>",
			desc = "Toggle",
			icon = { icon = "", color = "green", hl = "Boolean" },
		},
		{
			"<leader>or",
			"<cmd>OverseerRun<CR>",
			desc = "Run",
			icon = { icon = "", color = "green", hl = "Keyword" },
		},
	})
end

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Move Lines
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
