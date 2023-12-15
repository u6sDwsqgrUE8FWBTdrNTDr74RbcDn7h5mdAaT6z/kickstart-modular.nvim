return {
  'hiphish/rainbow-delimiters.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    vim.cmd [[
      highlight RainbowDelimiterYellow guifg=#FFD700
      highlight RainbowDelimiterViolet guifg=#DA70D6
      highlight RainbowDelimiterBlue guifg=#179FFF
    ]]

    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterViolet',
        'RainbowDelimiterBlue',
      }
    }
  end,
}
