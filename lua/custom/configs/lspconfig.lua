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
  cmd = {
    "clangd",
    -- "--background-index",
    -- "-j=12",
    -- "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    -- "--clang-tidy-checks=*",
    -- "--all-scopes-completion",
    -- "--cross-file-rename",
    -- "--completion-style=detailed",
    -- "--header-insertion-decorators",
    -- "--header-insertion=iwyu",
    -- "--pch-storage=memory",
  },
  on_attach = function(client, bufnr)
    -- Ensure that we retain your existing on_attach logic
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr) -- Call the base on_attach function
  end,
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
