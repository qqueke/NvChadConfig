local M = {}

M.tmux = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["n"] = { "nzz", "Center search result" },
    ["N"] = { "Nzz", "Center search result" },
    ["j"] = { "jzz", "Move down and center" },
    ["k"] = { "kzz", "Move up and center" },
    ["<Enter>"] = { "o<ESC>zz", "Center search result" },
  },
}

-- Uen
-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {
--       "<cmd> DapToggleBreakpoint <CR>",
--       "Add breakpoint at line",
--     },
--   }
-- }

return M
