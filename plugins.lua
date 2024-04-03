local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = { -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  }, -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  }, -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "custom.configs.cmp"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "rmagatti/auto-session",
    init = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_enable_last_session =true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }

      require("core.utils").load_mappings "autosession"
       -- todo add keymap manager
      -- vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, {
      --   noremap = true,
      -- })
    end,
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}
return plugins
