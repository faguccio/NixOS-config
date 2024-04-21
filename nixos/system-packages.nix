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

  environment.systemPackages = with pkgs; [
    vim
    wget
    git

    alejandra
    neofetch
    htop
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

    python3
    python311Packages.pip

    telegram-desktop
    firefox
    vscodium
    syncthing
    anki
    bitwarden
    xfce.thunar
    chromium
  ];
}
