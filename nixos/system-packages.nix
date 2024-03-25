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
    firefox
    vscodium
    git
    alejandra
    neofetch
    htop
    home-manager
  ];
}