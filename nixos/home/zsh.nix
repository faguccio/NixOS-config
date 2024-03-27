{
  config,
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/share/zsh"];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  #   environment.systemPackages = [
  #   pkgs.zsh-prezto
  # ];

  home-manager.users.f4g4 = {
    # home.packages = with pkgs; [
    # ];

    programs.zsh = {
      enableCompletion = true;
      #autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history.size = 10000;
      #history.path = "${config.xdg.dataHome}/zsh/history";
      initExtra = ''
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh
      '';
    };

    programs.zsh.prezto.enable = true;
  };
}
