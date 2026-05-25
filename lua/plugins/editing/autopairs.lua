return {
  "nvim-autopairs",
  auto_enable = true,
  event = "InsertEnter",
  after = function(plugin)
    require("nvim-autopairs").setup({
      check_ts = true,
    })
  end,
}
