{pkgs, ...}: {
  environment = {
    etc = {
      gitconfig.text = builtins.readFile ./gitconfig;
      gitignore.text = builtins.readFile ./gitignore;
    };

    systemPackages = [
      pkgs.delta
      pkgs.git
      pkgs.tig
    ];
  };
}
