return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
          },
        },
        lualine_z = { { "encoding" } },
      },
    },
  },
  {
    "echasnovski/mini.animate",
    opts = function()
      local animate = require("mini.animate")
      return {
        scroll = {
          enable = false,
          timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
        },
      }
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      -- options = {
      --   indicator = {
      --     style = "none",
      --   },
      -- separator_style = "slant",
      -- },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function()
      local logo = [[
 ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
 ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
 ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
 ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
 ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
 ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
 ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
 ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
 ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
 ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
 ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
 ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
 ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
 ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
  ]]

      --    local logo = [[
      --                                              
      --       ████ ██████           █████      ██
      --      ███████████             █████ 
      --      █████████ ███████████████████ ███   ███████████
      --     █████████  ███    █████████████ █████ ██████████████
      --    █████████ ██████████ █████████ █████ █████ ████ █████
      --  ███████████ ███    ███ █████████ █████ █████ ████ █████
      -- ██████  █████████████████████ ████ █████ █████ ████ ██████
      --    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
      -- stylua: ignore
      center = {
        -- { action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
        { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
        { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
        -- { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
        { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
        { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
        { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
        { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
        { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
      },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        -- Js
        js = {
          icon = "",
          color = "#f7df1c",
          cterm_color = "#f7df1c",
          name = "Js",
        },
        ["test.js"] = {
          icon = "󰂖",
          color = "#f7df1c",
          cterm_color = "#f7df1c",
          name = "TestJs",
        },
        ["spec.js"] = {
          icon = "󰂖",
          color = "#f7df1c",
          cterm_color = "#f7df1c",
          name = "SpecJs",
        },
        -- JavaScriptReact
        jsx = {
          icon = "󰜈",
          color = "#57c4dc",
          ctrm_color = "#57c4dc",
          name = "JavaScriptReact",
        },
        ["test.jsx"] = {
          icon = "󰂖",
          color = "#57c4dc",
          cterm_color = "#57c4dc",
          name = "JavaScriptReactTest",
        },
        ["spec.jsx"] = {
          icon = "󰂖",
          color = "#57c4dc",
          cterm_color = "#57c4dc",
          name = "JavaScriptReactSpec",
        },
        -- Ts
        ts = {
          icon = "󰛦",
          color = "#3077C6",
          cterm_color = "#3077C6",
          name = "Ts",
        },
        ["test.ts"] = {
          icon = "󰂖",
          color = "#3077C6",
          cterm_color = "#3077C6",
          name = "TestTs",
        },
        ["spec.ts"] = {
          icon = "󰂖",
          color = "#3077C6",
          cterm_color = "#3077C6",
          name = "SpecTs",
        },
        -- TypeScriptReact
        tsx = {
          icon = "󰜈",
          color = "#3077C6",
          ctrm_color = "#3077C6",
          name = "TypeScriptReact",
        },
        ["test.tsx"] = {
          icon = "󰂖",
          color = "#3077C6",
          cterm_color = "#3077C6",
          name = "TypeScriptReactTest",
        },
        ["spec.tsx"] = {
          icon = "󰂖",
          color = "#3077C6",
          cterm_color = "#3077C6",
          name = "TypeScriptReactSpec",
        },
      },
    },
  },
}
