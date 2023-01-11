return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
      vim.keymap.set("n", "<leader>dct", require("dap").continue)
      vim.keymap.set("n", "<F1>", require("dap").continue)
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      require("dap-python").setup("python", {})
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    -- config = function ()
    --   require("nvim-dap-virtual-text").setup()
    -- end,
  },
}
