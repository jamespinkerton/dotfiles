return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- See `:help telescope` and `:help telescope.setup()`
      local actions = require "telescope.actions"
      require('telescope').setup {

        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<esc>"] = actions.close,
            },
          },
        },
      }
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzy search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').git_files, { desc = '[S]earch [R]epo' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })

      vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      -- local git_files = function()
      --   require("telescope.builtin").find_files{
      --     -- cwd = vim.fn.expand("$HOME"),
      --     -- find_command = {"sed", vim.fn.expand("s/^/$HOME./"), "git", vim.fn.expand("--git-dir=$HOME/.cfg/"), "ls-files"},
      --     find_command = { "rg", "--files", vim.fn.expand("$HOME/.config")},
      --   }
      -- end
      -- vim.keymap.set('n', '<leader>sq', git_files, { desc = '[S]earch [Q]onfig' })
    end,
  },
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   build = 'make',
  --   -- cond = vim.fn.executable 'make' == 1,
  --   config = function ()
  --     -- Enable telescope fzf native, if installed
  --     require('telescope').load_extension('fzf')
  --   end,
  --   dependencies = {
  --     'junegunn/fzf',
  --     build = './install --bin',
  --   },
  -- },
  -- 'ibhagwan/fzf-lua',
  -- {
  --   'junegunn/fzf',
  --   build = './install --bin',
  --   -- config = function ()
  --   --   vim.keymap.set('n', '<C-p>', ':FZF<enter>')
  --   -- end,
  -- },
}
