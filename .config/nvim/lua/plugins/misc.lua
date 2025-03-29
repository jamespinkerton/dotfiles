return {
  "dstein64/vim-startuptime",
  -- "tpope/vim-sleuth",
  "ojroques/vim-oscyank",
  "sindrets/diffview.nvim",

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        merge_duplicates = true,
        background_colour = "#000000",
        stages = "static",
      })
      require("telescope").load_extension("notify")
      vim.keymap.set("n", "<leader>sn", require("telescope").extensions.notify.notify, { desc = "[S]earch [N]otifications" })
      vim.notify = require("notify")
    end,
  },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- Enable nvim-tree
      require("nvim-tree").setup()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle, { desc = "[N]vim Tree" })
    end,
  },

  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree" })
    end
  },

  { -- Fancier statusline
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = false,
          component_separators = "|",
          section_separators = "",
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },

  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<leader>hg", ":LazyGit<enter>")
    end
  },
}
