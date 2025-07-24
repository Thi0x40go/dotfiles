return {
  {
    "mgastonportillo/js-playground.nvim",
    dependencies = { "rcarriga/nvim-notify" }, -- optional: custom notifications
    cmd = "JSPlayground",
    init = function()
      -- example mappings
      vim.keymap.set("n", "<leader>jp", "<cmd>JSPlayground<CR>", { desc = "Run JSPlayground" })
      vim.keymap.set("n", "<leader>jx", "<cmd>JSPlayground stop<CR>", { desc = "Stop JSPlayground" })
    end,
    opts = {}, -- or config = true
  }
}
