{pkgs, ...}: {
  imports = [
    <home-manager/nixos>
    ./programs.nix
    ./window-manager
    ./programs.nix
    ./zsh.nix
  ];

  home-manager.users.f4g4 = {pkgs, ...}: {
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  };
}
