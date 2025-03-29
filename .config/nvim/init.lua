--
-- [[ Settings ]]
--

vim.cmd("colorscheme vim")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

--
-- [[ Plugins ]]
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("plugins")
require("lazy").setup({
  { import = "plugins.misc" },
  { import = "plugins.nvim_cmp" },
  { import = "plugins.dap" },
  { import = "plugins.gitsigns" },
  { import = "plugins.nvim_lspconfig" },
  { import = "plugins.telescope" },
  { import = "plugins.nvim_treesitter" },
})

vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, {desc = "[L]azy plugin manager"})

--
-- [[ Settings ]]
--

vim.o.mouse = ""
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.ttimeoutlen = 200
vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true
vim.o.inccommand = "split"
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("i", "<C-z>", "<esc><C-z>")
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {desc = "[e]rror toggle"})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
vim.api.nvim_set_hl(0, "SignColumn", { bg = nil })

-- vim.lsp.config.clangd = {
--   cmd = { "clangd", "--background-index" },
--   root_markers = { "compile_commands.json", "compile_flags.txt" },
--   filetypes = { "c", "cpp" },
-- }
--
-- vim.lsp.enable({"clangd"})
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method("textDocument/completion") then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
