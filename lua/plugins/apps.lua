return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>al", "<cmd>Leet<cr>", desc = "LeetCode" },
    },
    opts = {
      plugins = {
        non_standalone = true,
      },
      picker = {
        provider = "snacks-picker",
      },
    },
  },
}
