return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end)
  end,
}
