{pkgs, ...} :
{
  sium = pkgs.writeShellScriptBin "nix-rebuild-commit" ''
    set -e
    pushd ~/mynix-conf/nixos/


    # Early return if no changes were detected (thanks @singiamtel!)
    if $(pkgs.git) diff --quiet '*.nix'; then
        echo "No changes detected, exiting."
        popd
        exit 0
    fi

    alejandra . &>/dev/null \
      || ( alejandra . ; echo "formatting failed!" && exit 1)

    # Shows your changes
    git diff -U0 '*.nix'

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

    # Get current generation metadata
    current=$(nixos-rebuild list-generations | grep current)

    # Commit all changes witih the generation metadata
    git commit -am "$current"

    # Back to where you were
    popd

    # Notify all OK!
    notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
  '';

  environment.systemPackages = [ sium ];
}