return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { },
  config = function()
    local trouble = require("trouble")

    vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = 'Toggle Trouble' })
    vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end, { desc = 'Toggle workspace diagnostics' })
    vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end, { desc = 'Toggle document diagnostics' })
    vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = 'Toggle quickfix' })
    vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = 'Toggle loclist' })
    vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = 'Toggle LSP references' })

    vim.keymap.set("n", "]t", function() trouble.next({skip_groups = true, jump = true}) end, { desc = 'Jump to next item' })
    vim.keymap.set("n", "[t", function() trouble.previous({skip_groups = true, jump = true}) end, { desc = 'Jump to previous item' })
  end,
}
