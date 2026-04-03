{pkgs, ...}: {
  environment = {
    etc = {
      gitconfig.text = builtins.readFile ./gitconfig;
      gitignore.text = builtins.readFile ./gitignore;
    };

    variables.GIT_CONFIG_SYSTEM = "/etc/gitconfig";

    systemPackages = [
      pkgs.delta
      pkgs.git
      pkgs.tig
    ];
  };
}
