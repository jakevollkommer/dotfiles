return {
  {
    "stevearc/oil.nvim",
    config = function()
      require('oil').setup({
        show_hidden = true
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
