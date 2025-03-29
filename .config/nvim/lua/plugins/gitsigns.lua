return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- See `:help gitsigns.txt`
      require("gitsigns").setup {
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        signs_staged_enable = false,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, {buffer = bufnr, desc = "Gitsigns: " .. desc})
          end

          map("n", "]c", function() gs.nav_hunk("next") end, "Next Hunk")
          map("n", "[c", function() gs.nav_hunk("prev") end, "Prev Hunk")
          map({"n", "v"}, "<leader>hs", gs.stage_hunk, "Stage Hunk")
          map({"n", "v"}, "<leader>hr", gs.reset_hunk, "Reset Hunk")
          map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>hi", gs.preview_hunk_inline, "Preview Hunk Inline")
          map("n", "<leader>hb", function() gs.blame_line{full=true} end, "Blame Line")
          map("n", "<leader>hd", gs.diffthis, "Diff")
          map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff HEAD")
          map("n", "<leader>ht", gs.toggle_deleted, "Toggle Show Deleted")
          map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
          map("n", "<leader>hQ", function() gs.setqflist("all") end, "Set all qf list")
          map("n", "<leader>hq", gs.setqflist, "Set qf list")
        end
      }
    end,
  },
}
