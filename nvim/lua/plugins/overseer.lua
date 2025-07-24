local prettier_format = {
	name = "🎨 Format with Prettier",
	builder = function()
		local file = vim.api.nvim_buf_get_name(0)
		local relative_file = vim.fn.fnamemodify(file, ":.")
		return {
			cmd = { "prettier" },
			args = { relative_file, "--write" },
			components = { "default" },
		}
	end,
	condition = {
		-- Opcional: só ativa se o buffer atual tiver nome
		callback = function()
			local file = vim.api.nvim_buf_get_name(0)
			return file ~= ""
		end,
	},
}

local bun_install = {
	name = "🍘 bun install",
	builder = function()
		return {
			cmd = { "bun" },
			args = { "install" },
			components = { "default" },
		}
	end,
}
local tray_watch = {
	name = "👁️ tray watch",
	builder = function()
		return {
			cmd = { "tray" },
			args = { "watch" },
			components = { "default" },
		}
	end,
}

return {
	{
		"stevearc/overseer.nvim",
		lazy = false,
		opts = {
			-- Configuração do estilo da janela flutuante
			task_list = {
				direction = "bottom", -- Pode ser "left", "right", "bottom", "top" (posição do painel)
				min_width = 30,
				max_width = 80,
				-- Define o estilo da janela flutuante
				win_opts = {
					border = "rounded", -- Estilo da borda ("none", "single", "double", "rounded")
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder", -- Estilos de destaque
				},
			},
			bundles = {
				save_task_opts = {
					bundleable = true,
				},
				autostart_on_load = true,
			},
		},
		config = function()
			local overseer = require("overseer")
			overseer.setup({
				templates = { "builtin" },
			})
			overseer.register_template(bun_install)
			overseer.register_template(tray_watch)
			overseer.register_template(prettier_format)
		end,
	},
}
