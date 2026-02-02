local startup_lsp = function()
  vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end)
  vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
  vim.diagnostic.config({
    severity_sort = false,
    underline = false,
    virtual_text = false,
  })

  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("<leader>f", vim.lsp.buf.format, "[F]ormat buffer")
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  local servers = {
    -- pyright = {},
    -- basedpyright = {},
    -- rust_analyzer = {},
    clangd = { { semanticTokens = { enable = false } } },
    pylsp = {},
    -- pyright = {},
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }

  -- vim.cmd("PylspInstall pylsp-mypy")
  -- vim.cmd("PylspInstall python-lsp-ruff")

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.semanticTokensProvider = nil
  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup {
    automatic_installation = true,
    ensure_installed = vim.tbl_keys(servers),
  }

  vim.lsp.config('*', {
    capabilities = capabilities,
  })

  vim.lsp.config('clangd', {
    cmd = { "/mnt/disks/condaman/mamba/bin/clangd" },
    settings = servers.clangd,
  })

  vim.lsp.config('lua_ls', {
    settings = servers.lua_ls,
  })

  vim.lsp.enable(vim.tbl_keys(servers))

end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          PATH = "append",
        },
        config = function()
          require("mason").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
    },
    config = startup_lsp,
  },
}
