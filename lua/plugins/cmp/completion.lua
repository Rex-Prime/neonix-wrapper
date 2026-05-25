return {
  {
    "conform.nvim",
    auto_enable = true,
    -- cmd = { "" },
    -- event = "",
    -- ft = "",
    keys = {
      { "<leader>FF", desc = "[F]ormat [F]ile" },
    },
    -- colorscheme = "",
    after = function(plugin)
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          -- NOTE: download some formatters
          -- and configure them here
          lua = nixInfo(nil, "settings", "cats", "lua") and { "stylua" } or nil,
          -- go = { "gofmt", "golint" },
          -- templ = { "templ" },
          -- Conform will run multiple formatters sequentially
          python = nixInfo(nil, "settings", "cats", "python") and { "isort", "black" } or nil,
          -- Use a sub-list to run only the first available formatter
          -- javascript = { { "prettierd", "prettier" } },
          c = nixInfo(nil, "settings", "cats", "c") and { "clang-format" } or nil,
          java = nixInfo(nil, "settings", "cats", "java") and { "google-java-format" } or nil,
          bash = nixInfo(nil, "settings", "cats", "bash") and { "shfmt" } or nil,
        },
        formatters = {
          stylua = {
            command = "stylua",
            args = {
              "--stdin-filepath",
              "$FILENAME",
              "--search-parent-directories",
              "-",
            },
          },
          ["google-java-format"] = {
            prepend_args = { "--aosp" },
          },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>FF", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "[F]ormat [F]ile" })
    end,
  },
}
