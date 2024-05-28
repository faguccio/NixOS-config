{
  config,
  pkgs,
  lib,
  ...
}: {
  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  services.blueman.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git

    home-manager
    wl-clipboard
    pulseaudio
    slurp
    grim
    gtk3
    swaylock

    feh
    evince
    du-dust
    trashy
    bat
    eza
    appimage-run
    alejandra
    neofetch
    htop
    mpv
    file
    ffmpeg
    zip
    unzip

    python3

    telegram-desktop
    firefox
    #vscodium
    vscodium.fhs
    syncthing
    anki
    bitwarden
    xfce.thunar
    chromium
    pandoc
    tectonic
    libreoffice-qt
    obs-studio

    xournalpp
    gnome.adwaita-icon-theme

    krita
  ];

  # programs.firefox = {
  #   package = pkgs.wrapfirefox pkgs.firefox-unwrapped {
  #     forcewayland = true;
  #     extrapolicies = {
  #       extensionsettings = {};
  #     };
  #   };
  # };

  # FOR SWAY
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
  #     forceWayland = true;
  #     extraPolicies = {
  #       ExtensionSettings = {};
  #     };
  #   };
  # };
}
