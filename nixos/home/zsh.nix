{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  environment.variables.EDITOR = "vim";

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
# {
#   #environment.pathsToLink = ["/share/zsh"];
#   #
#   users.defaultUserShell = pkgs.zsh;
#   #environment.shells = with pkgs; [zsh];
#   home-manager.users.f4g4 = {
#     # home.packages = with pkgs; [
#     # ];
#     programs.zsh = {
#       enabletrue;
#       enableCompletion = true;
#       #enableAutosuggestions = true;
#       syntaxHighlighting.enable = true;
#       shellAliases = {
#         ll = "ls -l";
#       };
#       history.size = 10000;
#       historySubstringSearch.enable = true;
#       #history.path = "${config.xdg.dataHome}/zsh/history";
#       initExtra = ''
#         if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#           source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#         fi
#       '';
#       dotDir = ".config/zsh";
#       prezto = {
#         enable = true;
#         pmodules = [
#           "environment"
#           "terminal"
#           "editor"
#           "history"
#           "directory"
#           "spectrum"
#           "utility"
#           "completion"
#           "prompt"
#           "history-substring-search"
#           "git"
#           "syntax-highlighting"
#           "autosuggesitons"
#         ];
#       };
#     };
#   };
# }

