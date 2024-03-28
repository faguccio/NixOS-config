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
      # autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history.size = 10000;
      #history.path = "${config.xdg.dataHome}/zsh/history";
      initExtra = ''
        bindkey "''${key[Up]}" up-line-or-search
      '';
      zplug = {
        enable = true;
        plugins = [
          {name = "zsh-users/zsh-autosuggestions";} # Simple plugin installation
          {
            name = "romkatv/powerlevel10k";
            tags = [as:theme depth:1];
          } # Installations with additional options. For the list of options, please refer to Zplug README.
        ];
      };
    };
  };
}
