{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./sway-conf.nix
  ];
}
