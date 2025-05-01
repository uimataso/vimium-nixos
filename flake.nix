{
  description = "Config Vimium with Nix!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    {
      homeManagerModules.default = self.homeManagerModules.vimium-options;
      homeManagerModules.vimium-options = import ./home-manager.nix;

      packages.x86_64-linux.default =
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
        in
        pkgs.callPackage ./generate-doc.nix { };
    };
}
