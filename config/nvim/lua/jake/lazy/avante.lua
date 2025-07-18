-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   config = function()
--     local avante = require("avante")
--     avante.setup({
--       provider = "claude",
--       providers = {
--         claude = {
--           model = "claude-sonnet-4-20250514",
--         },
--       },
--       file_selector = {
--         provider = "telescope",
--       },
--       behaviour = {
--         -- auto_suggestions = true,
--         -- auto_suggestions_provider = "supermaven", -- Assuming supermaven is supported
--       },
--       -- Add any other configuration options here
--     })
--
--     vim.keymap.set("n", "<leader>cc", "<cmd>AvanteChat<CR>")
--     vim.keymap.set("n", "<leader>ce", "<cmd>AvanteEdit<CR>")
--   end,
--   lazy = false,
--   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
--   build = "make",
--   dependencies = {
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-telescope/telescope.nvim",
--     "hrsh7th/nvim-cmp",
--     "nvim-tree/nvim-web-devicons",
--     {
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       'MeanderingProgrammer/render-markdown.nvim',
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- for example
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
