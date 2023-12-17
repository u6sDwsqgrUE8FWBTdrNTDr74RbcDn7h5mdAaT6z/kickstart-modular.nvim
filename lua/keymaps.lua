-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move selected chunk
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Paste without overwritting register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Quickfix navigation
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

-- Tabs
vim.keymap.set('n', '<leader><tab>', '<cmd>tabnew<CR>')

-- Choose changes
vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<CR>', { desc = 'Get left changes' })
vim.keymap.set('n', '<leader>gl', '<cmd>diffget //3<CR>', { desc = 'Get right changes' })

-- Toggle filetree
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim: ts=2 sts=2 sw=2 et
