{
  config,
  pkgs,
  ...
}: {
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.f4g4 = {
    # home.packages = with pkgs; [
    # ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      #autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history.size = 10000;
      #history.path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
