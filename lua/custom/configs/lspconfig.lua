local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require "lspconfig"

local cmp = require "cmp"

vim.diagnostic.config {
  virtual_text = false, -- Disable inline messages
  float = {
    border = "rounded",
    source = "always",
  },
}

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    -- "--background-index",
    -- "-j=12",
    -- "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--clang-tidy-checks=*",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr) -- Call the base on_attach function
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<Leader>d",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      { noremap = true, silent = true }
    )
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
-- Not sure about this one
-- lspconfig.docker_compose_ls.setup {}

lspconfig.yamlls.setup {}

lspconfig.dockerls.setup {}

lspconfig.ts_ls.setup {}

lspconfig.sqlls.setup {}

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

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
