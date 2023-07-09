{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-23.05;
    nixpkgs-darwin.url = github:nixos/nixpkgs/nixpkgs-23.05-darwin;
  };

  outputs = inputs: let
    module = import ./module.nix;

    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter = {
      aarch64-darwin = inputs.nixpkgs-darwin.legacyPackages.aarch64-darwin.alejandra;
      x86_64-linux = pkgs.alejandra;
    };

    checks.x86_64-linux.integration = pkgs.nixosTest {
      nodes.machine = _: {
        imports = [ inputs.self.nixosModules.default ];
      };

      testScript = ''
        start_all()

        machine.wait_for_unit("multi-user.target")
      '';
    };

    nixosModules.default = module;
    darwinModules.default = module;
  };
}
