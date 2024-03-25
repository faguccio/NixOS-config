{pkgs, ...} : 

{
  home-manager.users.f4g4 = {
    home.packages = with pkgs; [
      waybar
      swaylock
      foot
    ];

    programs.git = {
      enable = true;
      userName = "Fabio Gaiba";
      userEmail = "faga2703@gmail.com";
    };

    programs.foot = { 
      enable = true;
 
      settings = {
        main = {
          font = "IBM Plex Mono:size=16";
          term = "foot-extra";
          # box-drawings-uses-font-glyphs = "no";
          # dpi-aware = "no";
        };

        mouse = {

          alternate-scroll-mode = "yes";
        };
      };
  };
  };
}
