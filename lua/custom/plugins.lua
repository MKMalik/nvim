local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "astro-language-server",
        "prettierd",
      }
    }
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function ()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "astro",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
      }
      return opts
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   "okuuva/auto-save.nvim",
  --   cmd = "ASToggle",                       -- optional for lazy loading on command
  --   event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  --   opts = {
  --     -- your config goes here
  --     -- or just leave it empty :)
  --   },
  -- },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Add Dart/Flutter-specific plugins
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          on_attach = require("custom.configs.lsp").on_attach,
          capabilities = require("custom.configs.lsp").capabilities,
        },
        indent = {
          enable = true,
          disable = {
            "dart"
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- LSP setup
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.dartls.setup({
        on_attach = require("custom.configs.lsp").on_attach,
        capabilities = require("custom.configs.lsp").capabilities,
      })
    end,
  },
}

return plugins
