return {
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      -- See `:help gitsigns.txt`
      require('gitsigns').setup {
        signs = {
          add = {hl = '', text = '+' },
          change = {hl = '', text = '~' },
          delete = {hl = '', text = '_' },
          topdelete = {hl = '', text = '‾' },
          changedelete = {hl = '', text = '~' },
        },
      }
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    config = function ()
      require("lazy").setup("plugins")
      vim.keymap.set('n', '<leader>gg', ':LazyGit<enter>')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      -- Enable nvim-tree
      require("nvim-tree").setup()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set('n', '<leader>n', require('nvim-tree').toggle, { desc = '[?] Toggle nvim tree' })
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  },
  { -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    config = function ()
      -- Set lualine as statusline
      -- See `:help lualine.txt`
      require('lualine').setup {
        options = {
          icons_enabled = false,
          -- theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      }
    end,
  },
  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end,
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'alexghergh/nvim-tmux-navigation',
    config = function ()
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
}
