return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      -- See `:help gitsigns.txt`
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
          change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map({'n', 'v'}, '<leader>hs', gs.stage_hunk, {desc = "Stage Hunk"})
          map({'n', 'v'}, '<leader>hr', gs.reset_hunk, {desc = "Reset Hunk"})
          map('n', '<leader>hS', gs.stage_buffer, {desc = "Stage Buffer"})
          map('n', '<leader>hu', gs.undo_stage_hunk, {desc = "Undo Stage Hunk"})
          map('n', '<leader>hR', gs.reset_buffer, {desc = "Reset Buffer"})
          map('n', '<leader>hp', gs.preview_hunk_inline, {desc = "Preview Hunk Inline"})
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = "Blame Line"})
          map('n', '<leader>hd', gs.diffthis, {desc = "Diff"})
          map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = "Diff HEAD"})
          map('n', '<leader>ht', gs.toggle_deleted, {desc = "Toggle Show Deleted"})
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = "Select Hunk"})
        end
      }
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    config = function()
      require("lazy").setup("plugins")
      vim.keymap.set('n', '<leader>hg', ':LazyGit<enter>')
    end
  },
}
