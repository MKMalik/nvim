require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
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
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Autocompletion
})

require("flutter-tools").setup {
  -- flutter = {
  --   -- All default keymaps
  --   keymap = {
  --     -- Flutter Commands
  --     run = "<leader>fr",              -- Run Flutter application
  --     hot_reload = "<leader>fR",       -- Hot reload Flutter application
  --     hot_restart = "<leader>frr",     -- Hot restart Flutter application
  --     stop = "<leader>fs",             -- Stop the running Flutter app
  --     restart = "<leader>fS",          -- Restart Flutter app
  --     
  --     -- Flutter DevTools
  --     dev_tools = "<leader>fd",        -- Open Flutter DevTools
  --     dev_tools_restart = "<leader>fD", -- Restart DevTools
  --     
  --     -- Flutter Clean & Pub
  --     clean = "<leader>fc",            -- Run `flutter clean`
  --     pub_get = "<leader>fp",          -- Run `flutter pub get`
  --     pub_upgrade = "<leader>fu",      -- Run `flutter pub upgrade`
  --     
  --     -- Other Flutter Commands
  --     analyze = "<leader>fa",          -- Run `flutter analyze`
  --     doctor = "<leader>fd",           -- Run `flutter doctor`
  --     
  --     -- More commands (if you use them)
  --     upgrade = "<leader>fu",          -- Run `flutter upgrade`
  --     format = "<leader>ff",           -- Format Flutter project files
  --     devices = "<leader>fd",          -- List connected devices
  --   },
  -- },

  -- Optional: customize the appearance of the flutter tools terminal output
  ui = {
    notification_style = "info",      -- `info`, `warning`, `error`
  },
  
  -- Enable automatically opening dev tools for every Flutter project
  dev_tools = true,
}

