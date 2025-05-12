plugins = {
  {
    "xiyaowong/transparent.nvim",
    -- event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>dsm", "<cmd>Noice dismiss<CR>",   desc = "Dismiss notifications" },
      { "<leader>dm",  "<cmd>Noice telescope<CR>", desc = "Dismiss notifications" },
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
  },
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    vim.keymap.set(
      "n",
      "<leader>ld",
      "<cmd>LazyDocker<CR>",
      { desc = "Toggle LazyDocker", noremap = true, silent = true }
    ),
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- {
  --   "tpope/vim-fugitive",
  --   lazy = false,
  -- },
  -- {
  --   "tpope/vim-dadbod",
  --   lazy = false,
  -- },
  {
    -- Code actions in telescope UI
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
  {
    -- Move between vim and tmux panes with ctrl-<dir>
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function(_, _)
      require("core.utils").load_mappings "tmux"
    end,
  },
  {
    -- None ls lsp
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>I", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>re", vim.lsp.buf.references, {})
    end,
  },
  {
    -- Mason
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "awk-language-server",
        "bash-language-server",
        "clangd",
        "clang-format",
        "codelldb",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "gopls",
        "hadolint",
        "lua-language-server",
        "sqls",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },
  {
    -- Screenshot utility
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {},
  },
  {
    -- Undo trees
    "mbbill/undotree",
    keys = {
      { "<leader>ut", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1 -- Automatically focus on the undotree window
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
}

return plugins
