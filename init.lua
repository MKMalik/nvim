require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim! if not vim.loop.fs_stat(lazypath) then
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { "~/.config/nvim/snippets" }
})


require('lspconfig').dartls.setup({
  on_attach = function(client, bufnr)
    -- Enable LSP keybindings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Autocompletion
});



require('lspconfig').jdtls.setup({});

require('custom.ts_ls');

-- Configure Dart LSP
require('lspconfig').dartls.setup({
  on_attach = function(client, bufnr)
    print("Dart LSP attached to buffer " .. bufnr)
  end,
  root_dir = require('lspconfig.util').root_pattern("pubspec.yaml", ".git"),
});

require("flutter-tools").setup({
  flutter = {},

  -- Optional: customize the appearance of the flutter tools terminal output
  ui = {
    notification_style = "info", -- `info`, `warning`, `error`
  },

  -- Enable automatically opening dev tools for every Flutter project
  dev_tools = true,
});


require('lspconfig').lua_ls.setup({});

vim.opt.relativenumber = true
vim.opt.number = true

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    if stats.count == 0 then
      vim.cmd("Alpha")
    end
  end,
});

require('lspconfig').jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
-- Configure output buffer settings
vim.g.vrc_output_buffer_name = "__OUTPUT__.json" -- Name of the output buffer
vim.g.vrc_auto_format_response_patterns = {
  json = "jq",                                   -- Use `jq` for JSON formatting
}

-- Sync Neovim's $PATH with the system's $PATH
vim.opt.shell = "bash" -- or your preferred shell
vim.opt.shellcmdflag = "-c"
vim.env.PATH = vim.fn.getenv("PATH")
