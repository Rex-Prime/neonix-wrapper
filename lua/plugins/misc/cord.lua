return {
  {
    "cord.nvim",
    auto_enable = true,
    event = "UIEnter",
    after = function(plugin)
      require("cord").setup({
        -- log_level = nil,
        display = {
          theme = "void",
        },
        assets = {
          lua = {
            tooltip = "Luaaaaaaaa", -- Custom tooltip for Lua files
          },
          nix = {
            tooltip = "❄️",
          },
        },
        buttons = {
          {
            label = function(opts)
              return opts.repo_url and "View Repository" or "Github"
            end,
            url = function(opts)
              return opts.repo_url or "https://github.com/Rex-Prime/"
            end,
          },
        },
        advanced = {
          plugin = {
            autocmds = true,
            cursor_update = "on_hold",
            match_in_mappings = true,
            debounce = {
              delay = 50,
              interval = 750,
            },
          },
        },
        hooks = {
          post_activity = function(opts, activity)
            local version = vim.version()
            activity.assets.small_text =
              string.format("Neovim %s.%s.%s", version.major, version.minor, version.patch, opts.cursor_line)
            activity.state = string.format("%s | %d:%d", opts.workspace, opts.cursor_line, opts.cursor_char)
          end,
        },
      })
    end,
  },
}
