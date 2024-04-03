{
  pkgs,
  lib,
  ...
}: let
  # custom colors
  foreground = "#C6D0F5"; # text
  background = "#303446"; # base
  regular0 = "#DFDFDF"; # papirus
  regular1 = "#E78284"; # red
  regular2 = "#A6D189"; # green
  regular3 = "#E5C890"; # yellow
  regular4 = "#8CAAEE"; # blue
  regular5 = "#F4B8E4"; # pink
  regular6 = "#81C8BE"; # teal
  regular7 = "#F2D5CF"; # rosewater
  regular8 = "#EEBEBE"; # flamingo
  regular9 = "#CA9EE6"; # mauve
  regular10 = "#EA999C"; # maroon
  regular11 = "#EF9F76"; # peach
  regular12 = "#81C8BE"; # teal
  regular13 = "#99D1DB"; # sky
  regular14 = "#85C1DC"; # sapphire
  regular15 = "#BABBF1"; # lavender
in {
  home-manager.users.f4g4 = {
    programs.wofi = {
      enable = true;
      # settings = {location = "top_right";};
      style = ''
        * {
              font-family: monospace;
          }

          window {
              background-color: ${background};
              color: ${foreground};
          }

          #outer-box {
              margin: 10px;
              background-color: ${regular4};
          }
      '';
    };
  };
}
