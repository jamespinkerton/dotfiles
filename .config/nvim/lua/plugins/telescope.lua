return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.nop,
              ["<C-p>"] = actions.nop,
              ["<esc>"] = actions.close,
            },
          },
        },
      }

      local function map(keys, func, desc)
        vim.keymap.set("n", keys, func, {desc = "Telescope: " .. desc})
      end

      local builtin = require("telescope.builtin")
      map("<leader>?", builtin.oldfiles, "Find recently opened files")
      map("<leader><space>", builtin.buffers, "Find existing buffers")
      map("<leader>/", builtin.current_buffer_fuzzy_find, "Fuzzy search in current buffer")
      map("<leader>sr", builtin.git_files, "[S]earch [R]epo")
      map("<leader>sm", builtin.keymaps, "[S]earch [M]appings")
      map("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
      map("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
      map("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
      map("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
      map("<leader>sc", builtin.commands, "[S]earch [C]ommands")
      map("<leader>st", vim.cmd.Telescope, "[S]earch [T]elescope")
      map("<leader>sf", builtin.find_files, "[S]earch [F]iles")
      map("<C-p>", builtin.find_files, "[S]earch [F]iles")
      map("<leader>p", builtin.find_files, "[S]earch [F]iles")
      map("<leader>gs", builtin.git_status, "[G]it [S]tatus")
      map("<leader>gb", builtin.git_branches, "[G]it [B]ranches")
      map("<leader>gc", builtin.git_commits, "[G]it [C]ommits")
      map("<leader>gC", builtin.git_bcommits, "[G]it Buffer [C]ommits")
      map("<leader>gst", builtin.git_stash, "[G]it [St]ash")
    end,
  },
}
