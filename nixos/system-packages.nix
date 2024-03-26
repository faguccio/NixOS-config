{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    waybar
    swaylock
    # foot
    wl-clipboard

    telegram-desktop
    firefox
    vscodium
  ];
}
