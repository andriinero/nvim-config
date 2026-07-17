return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        fd_opts = [[--color=never --type f --type l --exclude .git --exclude .jj --exclude 'prisma/migrations']],
        rg_opts = [[--color=never --files -g '!.git' -g '!.jj' -g '!**/prisma/migrations/**']],
        find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.jj/*' \! -path '*/prisma/migrations/*']],
      },
    },
  },
  {
    "folke/twilight.nvim",
    keys = {
      { "<leader>ct", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
}
