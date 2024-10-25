{
  pkgs,
  lib,
  ...
}: {
  home-manager.users.f4g4 = {
    home.packages = with pkgs; [
    ];

    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        # Add additional package names here
        "vscode"
      ];

    # programs.vscode = {
    #   enable = true;
    #   extensions = with pkgs.##vscode-extensions; [
    #     rust-lang.rust-analyzer
    #     dracula-theme.theme-dracula
    #     yzhang.markdown-all-in-one
    #   ];
    # };

    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhsWithPackages (ps: with ps; [rustup zlib openssl.dev pkg-config]);
    };

    programs.git = {
      enable = true;
      userName = "Fabio Gaiba";
      userEmail = "faga2703@gmail.com";
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
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

    services.gammastep = {
      enable = true;
      provider = "manual";
      latitude = 48.12;
      longitude = 11.6;
    };
  };
}
