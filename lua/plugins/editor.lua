return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "artemave/workspace-diagnostics.nvim",
    config = function()
      require("lspconfig").tsserver.setup({
        on_attach = function(client, bufnr)
          require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
        end,
      })
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
