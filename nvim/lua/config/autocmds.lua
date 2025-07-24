local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function asdf_version_selector(plugin)
	print("Running asdf_version_selector for plugin:", plugin)
	local handle = io.popen("asdf list " .. plugin)
	if not handle then
		print("Failed to open handle for asdf list command")
		return
	end

	local result = handle:read("*a")
	handle:close()

	if not result or result == "" then
		print("No versions found for plugin:", plugin)
		return
	end

	local versions = {}
	for version in result:gmatch("[^\r\n]+") do
		table.insert(versions, version)
	end

	print("Versions found:", table.concat(versions, ", "))

	pickers
		.new({}, {
			prompt_title = "Select ASDF Version",
			finder = finders.new_table({ results = versions }),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function()
					local selection = action_state.get_selected_entry()
					if not selection then
						print("No selection made")
						return
					end
					actions.close(_)
					local command = "asdf set " .. plugin .. " " .. selection[1]
					print("Running command:", command)
					vim.fn.system(command)
					print("ASDF version set to:", selection[1])
				end)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<leader>av", function()
	asdf_version_selector("nodejs")
end, { desc = "Set ASDF Node.js Version" })
