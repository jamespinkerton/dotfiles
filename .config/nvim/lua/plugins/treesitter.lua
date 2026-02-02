return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "python", "c", "cpp", "lua", "rust", "vim", "vimdoc",
        },
        auto_install = true,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select_ts = require("nvim-treesitter-textobjects.select").select_textobject
      vim.keymap.set({ "x", "o" }, "aa", function() select_ts("@parameter.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ia", function() select_ts("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "af", function() select_ts("@function.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "if", function() select_ts("@function.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ac", function() select_ts("@class.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ic", function() select_ts("@class.inner", "textobjects") end)

      local move = require("nvim-treesitter-textobjects.move")
      vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)

      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner") end)
      vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.inner") end)
    end,
  },
}
