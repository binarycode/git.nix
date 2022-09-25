{ pkgs, ... }: {
  environment = {
    etc = {
      gitconfig.source = ./gitconfig;
      gitignore.source = ./gitignore;
    };

    systemPackages = [
      pkgs.delta
      pkgs.git
    ];
  };
}
