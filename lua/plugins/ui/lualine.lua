return {
  "lualine.nvim",
  auto_enable = true,
  -- cmd = { "" },
  event = "DeferredUIEnter",
  -- ft = "",
  -- keys = "",
  -- colorscheme = "",
  after = function(plugin)
    require("lualine").setup({
      options = {
        icons_enabled = true,
        -- this was throwing an error, because it could detect the theme?
        -- So, i disabled it. It still uses the main colorscheme

        -- theme = nixInfo("auto", "settings", "colorscheme"),
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          { "filename", path = 1, status = true },
        },
        lualine_x = { "filetype" },
      },
      inactive_sections = {
        lualine_b = {
          { "filename", path = 3, status = true },
        },
      },
      tabline = {
        -- this is the thing that appears as the top-bar
        -- lualine_a = { "buffers" },
        -- if you use lualine-lsp-progress, I have mine here instead of fidget
        -- lualine_b = { 'lsp_progress', },
        -- lualine_z = { "tabs" },
      },
    })
  end,
}
