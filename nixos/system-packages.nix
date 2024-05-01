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
    python3

    telegram-desktop
    firefox
    vscodium
    syncthing
    anki
    bitwarden
    xfce.thunar
    chromium
    pandoc
    tectonic
    libreoffice-qt

    xournalpp
    gnome.adwaita-icon-theme

    krita
  ];
}
