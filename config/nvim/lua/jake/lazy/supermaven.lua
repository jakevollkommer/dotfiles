return {
  "supermaven-inc/supermaven-nvim",
  -- dir = '~/.config/nvim/plugins/supermaven-nvim',
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
      },
    })
  end,
}
