local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- Configure Dart LSP
lspconfig.dartls.setup {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    on_attach = function(client, bufnr)
        print("Dart LSP attached")
    end,
}
