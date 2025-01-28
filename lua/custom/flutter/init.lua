return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- Optional for enhanced UI
  },
  config = function()
    require("flutter-tools").setup({
      widget_guides = {
        enabled = true, -- Enable widget guides
      },
      lsp = {
        color = {
          enabled = true, -- Enable LSP semantic highlighting
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
        on_attach = function(client, bufnr)
          local bufopts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        end,
      },
    })
  end,
}
