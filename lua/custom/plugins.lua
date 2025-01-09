plugins = {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = {
      lsp = {
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    lazy = false,
  },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.dadbod"
  --   end,
  -- },
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
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("gitsigns").setup()
    end,

    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {}),
    vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {}),
  },
  {
    "tpope/vim-dadbod",
    lazy = false,
  },
  {
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
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function(_, _)
      require("core.utils").load_mappings "tmux"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<leader>dc", dap.continue, {})
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "clangd",
        "clang-format",
        "codelldb",
        "gopls",
        "sqls",
        "tailwindcss-language-server",
      },
    },
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {},
  },
}

return plugins
