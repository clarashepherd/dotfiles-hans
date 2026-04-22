{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    config = {
      user.name  = "Clara Shepherd";
      user.email = "clsh@bang-olufsen.dk";

      init.defaultBranch = "main";
    };
  };

  environment.systemPackages = with pkgs; [
    gh
    lazygit
  ];
}
