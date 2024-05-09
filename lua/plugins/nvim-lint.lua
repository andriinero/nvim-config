return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- ["*"] = { "eslint" },
        typescriptreact = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        markdown = { "eslint_d" },
      },
    },
  },
}
