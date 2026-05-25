return {
  { import = "plugins.lsp.lspconfig" },
  { import = "plugins.lsp.lsps" },
  { import = "plugins.lsp.mason" },
  { import = "plugins.lsp.lazydev" },
  { import = "plugins.cmp.completion" },

  { import = "plugins.editing.autopairs" },
  { import = "plugins.editing.guess-indent" },
  { import = "plugins.editing.surround" },

  { import = "plugins.git.gitsigns" },

  { import = "plugins.treesitter.treesitter" },

  { import = "plugins.ui.colorschemes" },
  { import = "plugins.ui.fidget" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.ui" },
  { import = "plugins.ui.vim-startup" },
  { import = "plugins.ui.which-key" },

  { import = "plugins.utils.nvim-lint" },
  { import = "plugins.utils.snacks" },

  { import = "plugins.misc.cord" },
  -- Formatting (empty folder, add later)
  -- { import = "plugins.formatting.conform" },
}
