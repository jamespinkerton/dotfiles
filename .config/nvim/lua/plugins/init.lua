return {
  'dstein64/vim-startuptime',
  'metakirby5/codi.vim',
  'liuchengxu/vista.vim',
  {
    'ojroques/vim-oscyank',
    config = function ()
      vim.g.oscyank_term = 'default'
      vim.keymap.set('v', '<leader>c', ':OSCYank<CR>')
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end,
  },
  {'nvim-tree/nvim-web-devicons'},
  -- {
  --   'akinsho/bufferline.nvim',
  --   config = function ()
  --     vim.opt.termguicolors = true
  --     require("bufferline").setup({
  --       options = {
  --       }
  --     })
  --   end,
  --   dependencies = 'nvim-tree/nvim-web-devicons'
  -- },
  {
    'rcarriga/nvim-notify',
    config = function()
      -- vim.o.termguicolors = true
      require("notify").setup({
        background_colour = "#000000",
        stages = "static",
      })
      require("telescope").load_extension("notify")
      vim.keymap.set('n', '<leader>sn', require('telescope').extensions.notify.notify, { desc = '[S]earch [N]otifications' })
    end,
  },
  -- {
  --   'gelguy/wilder.nvim',
  --   config = function()
  --     local wilder = require('wilder')
  --     wilder.setup({modes = {':', '/', '?'}})
  --   end,
  --   build = ':UpdateRemotePlugins',
  -- },
  -- {
  --   'kevinhwang91/nvim-hlslens',
  --   config = function ()
  --     require('hlslens').setup({
  --       nearest_only = true,
  --     })
  --   end
  -- },
  -- {
  --   "folke/trouble.nvim",
  --   config = function()
  --     require("trouble").setup {
  --       position = "right",
  --       mode = "workspace_diagnostics",
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --     vim.keymap.set('n', '<leader>t', require('trouble').toggle, { desc = '[T]rouble Toggle' })
  --   end
  -- },
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      -- Enable nvim-tree
      require("nvim-tree").setup()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set('n', '<leader>n', require('nvim-tree').toggle, { desc = 'Nvim tree' })
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree" })
    end
  },
  { -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    config = function()
      -- Set lualine as statusline
      -- See `:help lualine.txt`
      require('lualine').setup {
        options = {
          icons_enabled = false,
          component_separators = '|',
          section_separators = '',
        },
      }
    end,
  },
  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      nvim_tmux_nav.setup { disable_when_zoomed = true }
      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  {
    {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
          window = {
            position = "top",
          }
        })
        local wk = require("which-key")
        wk.register({
          s = "[S]earch Telescope",
          w = "[W]orkspace",
          h = "Git commands",
        }, { prefix = "<leader>" })
      end,
    },
  },
}
