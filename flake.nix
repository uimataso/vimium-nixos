{
  description = "Config Vimium with Nix!";

  outputs =
    { self }:
    {
      homeManagerModules.default = self.homeManagerModules.vimium-options;
      homeManagerModules.vimium-options = import ./home-manager.nix;
    };
}
