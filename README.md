# Vimium Nixos

Config [Vimium](https://github.com/philc/vimium) with Nix!

## Features

This Home Manager module allows you to declaratively define Vimium settings using Nix.

> [!NOTE]
> This module does **NOT** automatically apply the settings to Vimium (as automatic programmatic configuration is currently not supported by Vimium — see [issue #4600](https://github.com/philc/vimium/issues/4600)).

Instead, it generates a `vimium-options.json` file that you can manually import into Vimium via the extension settings.

## Home Manager Module

### Add Flack input

In your `flake.nix`, add:

```
inputs.vimium-options.url = "github:uimataso/vimium-nixos";
```

### Import the module

In your Home Manager configuration:

```nix
{
  imports = [
    inputs.vimium-options.homeManagerModules.vimium-options
  ];

  home.vimiumOptions = {
    enable = true;

    # Some config example
    outputFilePath = ".cache/vimium-options.json";

    keyMappings = {
      unmapAll = true;
      map = {
        j = "scrollDown";
        k = "scrollUp";
      };
    };

    searchEngines = {
      s = "https://search.uimataso.com/search?q=%s Searx";
      np = "https://search.nixos.org/packages?type=packages&query=%s NixOS Search - Packages";
      nm = "https://mynixos.com/search?q=%s MyNixOS";
    };
  };
}
```

After running `home-manager switch`, the generated file will appear at `home.vimiumOptions.outputFilePath` (default is `.cache/vimium-options.json`).
Then you can import this file to Vimium!

## Options

Please read [Options Doc](./options-doc.md)

## TODO

- Non Flake support?
- Vimium versioning
- MkDocs site
