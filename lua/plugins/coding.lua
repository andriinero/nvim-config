return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      -- Avoid repeatedly invoking a linter that is not installed.
      local eslint_d = vim.fn.executable("eslint_d") == 1 and { "eslint_d" } or nil
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        javascript = eslint_d,
        typescript = eslint_d,
        typescriptreact = eslint_d,
        javascriptreact = eslint_d,
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
}
