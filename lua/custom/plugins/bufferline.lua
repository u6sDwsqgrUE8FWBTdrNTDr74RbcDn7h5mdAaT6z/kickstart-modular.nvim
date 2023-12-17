-- https://github.com/ThePrimeagen/harpoon/issues/352#issuecomment-1841252180

return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',

    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = function()
      -- local colors = require('vscode.colors').get_colors()
      -- vim.api.nvim_set_hl(0, 'MyBufferSelected', { fg = colors.vscSelection, bg = colors.base09 })
      -- vim.api.nvim_set_hl(0, 'MyHarpoonSelected', { fg = colors.vscSelection, bg = colors.base0B })
      return {
        options = {
          mode = "tabs",
          show_buffer_close_icons = false,
          show_close_icon = false,
          custom_areas = {
            left = function()
              local result = {}
              local items = require('harpoon'):list().items
              for i = 1, #items do
                local fn = items[i].value
                local fullpath = vim.fn.fnamemodify(fn, ':p')
                local name = ' ' .. i .. ' ' .. vim.fn.fnamemodify(fn, ':t') .. ' '
                -- local activename = ' ' .. i .. '>* ' .. vim.fn.fnamemodify(fn, ':t') .. ' '
                if fullpath == vim.fn.expand('%:p') then
                  -- table.insert(result, { text = '│', link = 'BufferLineIndicatorSelected' })
                  table.insert(result, { text = name, link = 'MyHarpoonSelected' })
                  -- table.insert(result, { text = activename, link = 'BufferLineBufferVisible' })
                  table.insert(result, { text = '│', link = 'BufferLineIndicatorSelected' })
                else
                  -- print('inactive: ' .. name)
                  table.insert(result, { text = name, link = 'BufferLineBufferVisible' })
                end
              end
              -- if #items ~= 0 then
              --   table.insert(result, { text = ' ', link = 'BufferLineWarningSelected' })
              -- end
              return result
            end
          },
        }
      }
    end
}

-- return {
--     'akinsho/bufferline.nvim',
--     event = 'VeryLazy',
--
--     opts = function()
--       local colors = require('vscode.colors').get_colors()
--       vim.api.nvim_set_hl(0, 'MyBufferSelected', { fg = colors.base01, bg = colors.base09 })
--       vim.api.nvim_set_hl(0, 'MyHarpoonSelected', { fg = colors.base01, bg = colors.base0B })
--       return {
--         options = {
--           custom_areas = {
--             left = function()
--               local result, items, labels = {}, require('harpoon'):list().items, { '󰲠 ', '󰲢 ', '󰲤 ', '󰲦 ' }
--               for i = 1, math.min(4, #items) do
--                 local fn = items[i].value
--                 local fullpath = vim.fn.fnamemodify(fn, ':p')
--                 local name = ' ' .. labels[i] .. '' .. vim.fn.fnamemodify(fn, ':t') .. ' '
--                 -- local activename = ' ' .. i .. '>* ' .. vim.fn.fnamemodify(fn, ':t') .. ' '
--                 if fullpath == vim.fn.expand('%:p') then
--                   table.insert(result, { text = name, link = 'MyHarpoonSelected' })
--                 else
--                   table.insert(result, { text = name, link = 'BufferLineBufferVisible' })
--                 end
--               end
--               if #items ~= 0 then
--                 table.insert(result, { text = ' ║', link = 'BufferLineWarningSelected' })
--               end
--               return result
--             end
--           },
--         },
--       }
--     end
-- }
