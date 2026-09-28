{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fish.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.variables.EDITOR = "vim";

  home-manager.users.f4g4 = {
    programs.fish = {
      enable = true;

      shellAliases = {
        ll = "eza -l";
        ls = "eza";
        sus = "systemctl suspend";
        gis = "git status";
      };
    };

    # Home Manager's direnv module automatically integrates with fish.
    programs.direnv.enable = true;


  home-manager.users.f4g4 = {
    programs.zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "eza -l";
        ls = "eza";
        sus = "systemctl suspend";
        gis = "git status";
        gc = "git commit";
        gpl = "git pull";
        gps = "git push";
      };

      history.size = 10000;
      historySubstringSearch.enable = true;
      #history.path = "${config.xdg.dataHome}/zsh/history";
      initContent = ''
        if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
          source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
        fi

        eval "$(direnv hook zsh)"

        unfunction dut
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
          # "autosuggesitons"
        ];
      };
    };
  };
}
