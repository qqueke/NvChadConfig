local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  -- sources = {
  --   null_ls.builtins.hover.dictionary,
  --   null_ls.builtins.hover.printenv,
  --   null_ls.builtins.formatting.clang_format,
  --   null_ls.builtins.diagnostics.eslint,
  --   null_ls.builtins.completion.spell,
  --   null_ls.builtins.code_actions.gitsigns,
  -- },

  sources = {
    -- null_ls.builtins.formatting.clang_format.with({
    --   extra_args = { "--style=Google" },  -- You can replace "Google" with other styles (e.g., "LLVM", "Mozilla")
    -- }),
    null_ls.builtins.formatting.clang_format.with {
      extra_args = {
        "--style=Google", -- You can choose other styles like LLVM, Mozilla, etc.
      },
    },

    -- null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.gofmt,
    --null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.completion.spell,
    null_ls.builtins.hover.printenv,
    null_ls.builtins.hover.dictionary,
    -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format { bufnr = bufnr }
      --   end,
      -- })
    end
  end,
}

return opts
