local cmp_kinds = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

return {
  {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          tailwindcss = {},
        },
      },
    },
    -- {
    --   "pmizio/typescript-tools.nvim",
    --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --   opts = {
    --     settings = {
    --       tsserver_plugins = {
    --         "@styled/typescript-styled-plugin",
    --       },
    --     },
    --   },
    -- },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {
        user_default_options = {
          tailwind = true,
        },
      },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      },
      opts = function(_, opts)
        local format_kinds = opts.formatting.format
        opts.formatting.format = function(entry, cmp_item)
          cmp_item.kind = " " .. (cmp_kinds[cmp_item.kind] or "") .. cmp_item.kind -- cmp_item.kind = (cmp_kinds[cmp_item.kind] or "") .. string.sub(cmp_item.kind, 0, 2)
          format_kinds(entry, cmp_item)
          return require("tailwindcss-colorizer-cmp").formatter(entry, cmp_item)
        end
      end,
    },
  },
}
