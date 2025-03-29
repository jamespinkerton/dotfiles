return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, {desc = "[B]reakpoint Toggle"})
      vim.keymap.set("n", "<leader>dct", require("dap").continue, {desc = "[D]ap [C]o[n]tinue"})
    end,
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python" }
      })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python", {})
    end
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("dapui").setup()
  --     vim.keymap.set("n", "<leader>dui", require("dapui").toggle)
  --   end,
  -- },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function ()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
}
