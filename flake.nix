{
  outputs = _: let
    module = import ./module.nix;
  in {
    nixosModules = {
      default = module;
      git     = module;
    };
    darwinModules = {
      default = module;
      git     = module;
    };
  };
}
