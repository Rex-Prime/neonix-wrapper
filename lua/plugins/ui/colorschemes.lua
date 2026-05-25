return {
  {
    nixInfo.lze.load({
      -- lze specs need a name
      "trigger_colorscheme",
      -- lazy loaded colorscheme.
      -- This means you will need to add the colorscheme you want to lze sometime before VimEnter is done
      event = "VimEnter",
      -- Also, lze can load more than just plugins.
      -- The default load field contains vim.cmd.packadd
      -- Here we override it to schedule when our colorscheme is loaded
      load = function(_name)
        -- schedule so it runs after VimEnter
        vim.schedule(function()
          vim.cmd.colorscheme(nixInfo("rose-pine", "settings", "colorscheme"))
          vim.schedule(function()
            -- I like this color. Use vim.schedule again to set it after the colorscheme is finished
            vim.cmd([[hi LineNr guifg=#bb9af7]])
          end)
        end)
      end,
    }),
    {
      "catppuccin-nvim",
      auto_enable = true,
      colorscheme = "catppuccin",
    },
    {
      "rose-pine",
      auto_enable = true,
      after = function(plugin)
        require("rose-pine").setup({
          variant = "moon",
          palette = {
            moon = {
              base = "#0C0C12",
            },
          },
        })
      end,
    },
    {
      "arete",
      auto_enable = true,
      after = function(plugin)
        local arete = require("arete")

        arete.setup({
          -- Enable transparent background for the editor
          transparent = false,

          -- Use the bytecode cache engine (highly recommended for performance)
          -- cache = true,

          -- Set specific styles for specific syntax highlight groups
          -- Can be any valid attr-list value. See `:h nvim_set_hl`
          styles = {
            comments = { italic = true },
            keywords = { bold = true },
            types = { bold = true },
            functions = {},
            variables = {},
          },

          -- Direct, unconditional group overrides
          -- Can be a table or a function returning a table
          groups = {
            -- CustomHighlight = { fg = "#ff0000", bg = "NONE" },
          },

          -- Programmatic highlight overrides based on the loaded theme
          ---@param highlights table
          ---@param name string
          ---@return table
          on_highlights = function(highlights, name)
            -- return {
            --   NormalFloat = { fg = highlights.Normal.fg, bg = "NONE" },
            -- }
            return {} -- empty table for now
          end,
        })

        -- To apply a theme, simply use the standard Neovim colorscheme command
        -- vim.cmd.colorscheme("ef-bio")
      end,
    },
  },
}
