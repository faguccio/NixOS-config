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
      "electron-39.8.10"
    ];
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  #   programs.steam = {
  #     enable = true;
  #     # Optional but recommended: Open firewall ports for features like Remote Play
  #     remotePlay.openFirewall = true;
  #     dedicatedServer.openFirewall = true;

  #     extraCompatPackages = with pkgs; [
  #       proton-ge-bin # A popular community-built version with extra fixes
  #       # You can add other Proton versions here if needed
  #     ];
  #   };

  services.blueman.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.package = pkgs.docker_29;

  # Just for a dumb project
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git

    home-manager
    wl-clipboard
    wl-mirror
    pulseaudio
    slurp
    grim
    gtk3
    swaylock
    xdg-utils

    feh
    evince
    dust
    trashy
    bat
    eza
    appimage-run
    alejandra
    htop
    pinentry-curses
    btop
    lazygit
    nix-tree

    nethogs
    mpv
    file
    ffmpeg
    zip
    unzip
    gnumake
    killall
    obsidian

    traceroute
    dig
    tor-browser
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
    bitwarden-desktop
    xfce.thunar
    chromium
    # for netflix and language reactor :(
    google-chrome
    libreoffice-qt
    # obs-studio
    # logseq
    typst

    xournalpp
    adwaita-icon-theme

    jetbrains.pycharm
    jetbrains.webstorm

    krita
    unstable.ollama
  ];
}
