return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ruff" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Ruff sorts imports first, then formats with Black-compatible output.
        python = { "ruff_organize_imports", "ruff_format" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
      },
    },
  },
}
