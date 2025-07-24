local o = vim.opt -- For the opt
local g = vim.g -- For the globals

-- views can only be fully collapsed with the global statusline
o.laststatus = 3
o.spelllang = "en,pt"
o.spell = true
o.swapfile = false
g.copilot_enabled = false
vim.g.lazyvim_prettier_needs_config = false
