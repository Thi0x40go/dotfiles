return {
	{
		"snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					pick = function(cmd, opts)
						return LazyVim.pick(cmd, opts)()
					end,
					header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
        Bem-vindo Thiago!
 ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "p", desc = "Projetos",   action = ":Telescope projects"  },
            { icon = " ", key = "n", desc = "Novo Arquivo", action = ":ene | startinsert" },
            { icon = "", key = "o", desc = "Obsidian Abrir Arquivo", action = ":ObsidianQuickSwitch" },
            { icon = "", key = "O", desc = "Obsidian Novo Arquivo", action = ":ObsidianNew" },
            { icon = " ", key = "f", desc = "Procurar Arquivo", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Procurar Texto", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "c", desc = "Configuração", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restaurar Sessão", section = "session" },
            { icon = " ", key = "x", desc = "Extras do Lazy", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Sair", action = ":qa" },
          },
				},
			},
		},
	},
}
