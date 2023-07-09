{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-23.05;
    nixpkgs-darwin.url = github:nixos/nixpkgs/nixpkgs-23.05-darwin;
  };

  outputs = inputs: let
    module = import ./module.nix;
  in {
    formatter = {
      aarch64-darwin = inputs.nixpkgs-darwin.legacyPackages.aarch64-darwin.alejandra;
      x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };

    nixosModules.default = module;
    darwinModules.default = module;
  };
}
