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
      };
      history.size = 10000;
      historySubstringSearch.enable = true;
      #history.path = "${config.xdg.dataHome}/zsh/history";
      initExtra = ''
        echo ciao

      '';
      dotDir = ".config/zsh";

      prezto = {
        enable = true;
        pmodules = [
          "environment"
          "terminal"
          "editor"
          "history"
          "directory"
          "spectrum"
          "utility"
          "completion"
          "prompt"
          "history-substring-search"
          "git"
          "syntax-highlighting"
          "autosuggesitons"
        ];
      };

      #   zplug = {
      #     enable = true;
      #     zplugHome = "~/.zplug";
      #     plugins = [
      #       {name = "zsh-users/zsh-autosuggestions";} # Simple plugin installation
      #       {
      #         name = "romkatv/powerlevel10k";
      #         tags = [as:theme depth:1];
      #       } # Installations with additional options. For the list of options, please refer to Zplug README.
      #     ];
      #   };
    };
  };
}
