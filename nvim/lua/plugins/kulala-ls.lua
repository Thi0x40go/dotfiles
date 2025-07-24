return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local nvim_lsp = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local servers = {
				"kulala_ls",
			}
			for _, lsp in ipairs(servers) do
				if nvim_lsp[lsp] ~= nil then
					if nvim_lsp[lsp].setup ~= nil then
						nvim_lsp[lsp].setup({
							capabilities = capabilities,
						})
					else
						vim.notify("LSP server " .. lsp .. " does not have a setup function", vim.log.levels.ERROR)
					end
				end
			end
		end,
	},
}
