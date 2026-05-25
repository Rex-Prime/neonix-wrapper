# Neovim module

This is config is based on the [neovim module](https://birdeehub.github.io/nix-wrapper-modules/wrapperModules/neovim.html)

It makes use of the tips in the [tips and tricks](https://birdeehub.github.io/nix-wrapper-modules/wrapperModules/neovim.html#tips-and-tricks) section of the documentation.

To see what directories you can put stuff in, see: [:help 'rtp'](https://neovim.io/doc/user/options.html#'rtp')

This config uses [lze](https://github.com/BirdeeHub/lze) for lazy loading of the configuration.

You may also be interested in [lz.n](https://github.com/lumen-oss/lz.n) for this purpose.

To initialize this flake into the current directory, run:

```bash
nix run github:Rex-Prime/neonix-wrapper
```

It will not replace existing files.

To build it from that directory

```bash
nix build github:Rex-Prime/neonix-wrapper
```
It exports a package! (and other things)

If you don't want your config in a separate flake, just call the `module.nix` file like:

```nix
inputs: # <-- get the library somehow
{ pkgs, ... }: {
  # call the module and install the package (nixos example)
  environment.systemPackages = [ (inputs.nix-wrapper-modules.lib.evalPackage [ ./module.nix { inherit pkgs; } ]) ];
}
```

There are a lot of other ways to install it as well, see [the getting started documentation](https://birdeehub.github.io/nix-wrapper-modules/md/getting-started.html)

---

If you wanted as simple as possible, you could use something more like the following as your `module.nix`

```nix
{ wlib, config, pkgs, lib, ... }:
  imports = [ wlib.wrapperModules.neovim ];
  specs.general = with pkgs.vimPlugins; [
    # plugins which are loaded at startup ...
  ];
  specs.lazy = {
    lazy = true;
    data = with pkgs.vimPlugins; [
      # plugins which are not loaded until you vim.cmd.packadd them ...
    ];
  };
  extraPackages = with pkgs; [
    # lsps, formatters, etc...
  ];
  settings.config_directory = ./.; # or lib.generators.mkLuaInline "vim.fn.stdpath('config')";
}
```

At the same time, you may find that the `module.nix` file from this template is not massively more complex than that either,
and contains some useful tricks and information.
