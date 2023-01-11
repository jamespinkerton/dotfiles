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

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup("plugins")

-- [[ Setting options ]]

vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#3B4252', fg = '#5E81AC' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#3B4252' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#3B4252' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#3B4252' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#3B4252' })

vim.o.hlsearch = true
vim.wo.signcolumn = 'number'
vim.o.mouse = ''
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.completeopt = 'menuone,noselect'
vim.o.confirm = true
vim.o.inccommand = 'split'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ttimeoutlen = 200

-- Keymaps for leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Personal settings
vim.keymap.set('i', '<C-z>', '<esc><C-z>')
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)
