return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "nvim_lsp_signature_help" })
    end,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        }
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
      })
    end,
  }
}
