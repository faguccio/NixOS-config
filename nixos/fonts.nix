{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      alegreya
      alice
      amiri
      caladea
      cantarell-fonts
      carlito
      comfortaa
      fira
      fira-code
      font-awesome
      hackgen-font
      ibm-plex
      inconsolata
      inter
      iosevka
      jetbrains-mono
      lato
      liberation-sans-narrow
      liberation_ttf
      libertinus
      material-icons
      mona-sans
      montserrat
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      overpass
      pecita
      recursive
      roboto
      roboto-mono
      roboto-serif
      source-code-pro
      source-sans
      source-sans-pro
      source-serif
      source-serif-pro
    ];
    fontconfig = {
      defaultFonts = {
        monospace = ["IBM Plex Mono" "Fira Code" "Noto Sans Mono" "Source Code Pro"];
        serif = ["Fira Code" "Noto Serif" "Source Serif Pro"];
        sansSerif = ["Fira Code" "Noto Sans" "Source Sans Pro"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
