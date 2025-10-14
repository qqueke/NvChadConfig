local M = {}

M.tmux = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["n"] = { "nzz", "Center search result" },
    ["N"] = { "Nzz", "Center search result" },
    ["<C-a>"] = { "ggVG", "select all" },
    -- ["j"] = { "jzz", "Move down and center" },
    -- ["k"] = { "kzz", "Move up and center" },
    ["<Enter>"] = { "o<ESC>", "Center search result" },
  },
}

M.general = {
  n = {
    ["x"] = { '"_x', "Delete without yank" },
    ["c"] = { '"_c', "Change without yank" },
    ["D"] = { '"_D', "Delete to end without yank" },
    ["C"] = { '"_C', "Change to end without yank" },
  },

  v = {
    ["<CR>"] = { "<Esc>", "Exit visual mode" },
    ["~"] = { "<Esc>", "Exit visual mode" },
    ["x"] = { '"_x', "Delete without yank" },
    ["c"] = { '"_c', "Change without yank" },
    ["p"] = { "P", "Paste without overwriting clipboard" },
  },
}

return M
