{
  config,
  pkgs,
  lib,
  ...
}: let
  unstableTarball =
    fetchTarball
    https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
  # system = builtins.currentSystem;
  # extensions =
  #   (import (builtins.fetchGit {
  #     url = "https://github.com/nix-community/nix-vscode-extensions";
  #     ref = "refs/heads/master";
  #     rev = "c43d9089df96cf8aca157762ed0e2ddca9fcd71e";
  #   }))
  #   .extensions
  #   .${system};
  # extensionsList = with extensions.vscode-marketplace; [
  #   rust-lang.rust-analyzer
  # ];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget

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

    python3

    telegram-desktop
    firefox
    unstable.anki-bin
    #vscodium
    vscode.fhs
    # vscodium.fhs

    syncthing
    bitwarden
    xfce.thunar
    chromium
    pandoc
    tectonic
    libreoffice-qt
    obs-studio
    logseq

    xournalpp
    gnome.adwaita-icon-theme

    krita
  ];
}
