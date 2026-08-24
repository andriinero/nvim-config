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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace",
              },
            },
          },
          on_attach = function(client)
            -- Rope handles Python renames across package re-exports.
            client.server_capabilities.renameProvider = false
          end,
        },
        pylsp = {
          cmd_env = {
            PYTHONPATH = vim.fn.stdpath("data") .. "/pylsp-rope",
          },
          settings = {
            pylsp = {
              plugins = {
                pylsp_rope = { enabled = true, rename = true },
                jedi_rename = { enabled = false },
                rope_rename = { enabled = false },
                autopep8 = { enabled = false },
                black = { enabled = false },
                flake8 = { enabled = false },
                mccabe = { enabled = false },
                pycodestyle = { enabled = false },
                pydocstyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                rope_autoimport = {
                  enabled = true,
                  completions = { enabled = false },
                  code_actions = { enabled = true },
                },
                yapf = { enabled = false },
              },
            },
          },
          on_attach = function(client)
            -- Keep pylsp as a dedicated Rope rename provider. Pyright and
            -- Conform remain responsible for every other Python feature.
            local capabilities = client.server_capabilities
            capabilities.completionProvider = nil
            capabilities.definitionProvider = false
            capabilities.documentFormattingProvider = false
            capabilities.documentRangeFormattingProvider = false
            capabilities.documentSymbolProvider = false
            capabilities.hoverProvider = false
            capabilities.referencesProvider = false
            capabilities.signatureHelpProvider = nil
          end,
        },
        vtsls = {
          settings = {
            vtsls = {
              typescript = {
                format = {
                  tabSize = 2,
                  indentSize = 2,
                  convertTabsToSpaces = true,
                },
              },
              javascript = {
                format = {
                  tabSize = 2,
                  indentSize = 2,
                  convertTabsToSpaces = true,
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" }

      opts.appearance = opts.appearance or {}
      opts.appearance.kind_icons = cmp_kinds

      opts.sources = opts.sources or {}
      opts.sources.default = vim.tbl_filter(function(source)
        return source ~= "snippets"
      end, opts.sources.default or {})
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
}
