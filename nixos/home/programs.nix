{pkgs, ...}: {
  home-manager.users.f4g4 = {
    home.packages = with pkgs; [
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
          term = "foot";
          # box-drawings-uses-font-glyphs = "no";
          # dpi-aware = "no";
        };

        mouse = {
          alternate-scroll-mode = "yes";
        };

        colors = {
          alpha = 1.0;

          background = "282828";
          foreground = "ebdbb2";
          regular0 = "282828";
          regular1 = "cc241d";
          regular2 = "98971a";
          regular3 = "d79921";
          regular4 = "458588";
          regular5 = "b16286";
          regular6 = "689d6a";
          regular7 = "a89984";
          bright0 = "928374";
          bright1 = "fb4934";
          bright2 = "b8bb26";
          bright3 = "fabd2f";
          bright4 = "83a598";
          bright5 = "d3869b";
          bright6 = "8ec07c";
          bright7 = "ebdbb2";
        };
      };
    };
  };
}
