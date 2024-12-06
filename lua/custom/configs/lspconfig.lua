local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require "lspconfig"

local cmp = require "cmp"

lspconfig.clangd.setup {
  --  on_attach = function(client, bufnr)
  --    client.server_capabilities.signatureHelpProvider = false
  --    on_attach(client, bufnr)
  --  end,
  --  capabilities = capabilities,
}

lspconfig.lua_ls.setup {}

lspconfig.gopls.setup {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

lspconfig.ts_ls.setup {}

--lspconfig.tailwindcss.setup {}

lspconfig.sqlls.setup {}

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
