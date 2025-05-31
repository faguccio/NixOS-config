{
  config,
  pkgs,
  lib,
  ...
}: let
  unstableTarball =
    fetchTarball
    https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in {
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
      "electron-27.3.11"
    ];
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  services.blueman.enable = true;
  virtualisation.docker.enable = true;

  # Just for a dumb project
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;

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
    xdg_utils

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
    pinentry-curses
    btop

    nethogs
    mpv
    file
    ffmpeg
    zip
    unzip
    gnumake
    killall

    traceroute
    dig
    tor-browser-bundle-bin
    openvpn

    python3

    telegram-desktop
    signal-desktop
    firefox
    unstable.anki-bin
    #vscodium
    #vscode.fhs
    hoppscotch
    pavucontrol

    # vscodium.fhs

    syncthing
    bitwarden
    xfce.thunar
    chromium
    # for netflix and language reactor :(
    google-chrome
    pandoc
    tectonic
    libreoffice-qt
    obs-studio
    logseq

    xournalpp
    gnome.adwaita-icon-theme

    krita
    unstable.ollama
  ];
}
