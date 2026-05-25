return {
  {
    -- name of the lsp
    "lua_ls",
    for_cat = "lua",
    -- provide a table containing filetypes,
    -- and then whatever your functions defined in the function type specs expect.
    -- in our case, it just expects the normal lspconfig setup options,
    -- but with a default on_attach and capabilities
    lsp = {
      -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
      -- (meaning it doesn't call the callback function we defined in the main init.lua)
      filetypes = { "lua" },
      settings = {
        Lua = {
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { "nixInfo", "vim" },
            disable = { "missing-fields" },
          },
        },
      },
    },
    -- also these are regular specs and you can use before and after and all the other normal fields
  },
  {
    "nixd",
    enabled = nixInfo.isNix, -- mason doesn't have nixd
    for_cat = "nix",
    lsp = {
      filetypes = { "nix" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = [[import <nixpkgs> {}]],
          },
          options = {},
          formatting = {
            command = { "nixfmt" },
          },
          diagnostic = {
            suppress = {
              "sema-escaping-with",
            },
          },
        },
      },
    },
  },
  {
    "pyright",
    for_cat = "python",
    lsp = {
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    },
  },
  {
    "clangd",
    for_cats = "c",
    lsp = {
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      settings = {
        clangd = {
          cmd = { "clangd" },
        },
      },
    },
  },
  {
    "jdtls",
    for_cats = "java",
    lsp = {
      filetypes = { "java" },
      settings = {
        jdtls = {
          cmd = { "jdtls" },
        },
      },
    },
  },
  {
    "bashls", -- this needs to be the name of the lsp, not just any name
    for_cats = "bash",
    lsp = {
      filetypes = { "sh" },
      settings = {
        bash = {},
        formatting = {
          cmd = { "shfmt" },
        },
      },
    },
  },
}
