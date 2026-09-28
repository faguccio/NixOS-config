{
  pkgs,
  config,
  ...
}: let
  sium = pkgs.writeShellScriptBin "rebuild-commit" ''
    set -e
    pushd ~/mynix-conf/nixos/

    # Check any changes (tracked or untracked)
    if git diff --quiet -- '*.nix' && git diff --cached --quiet -- '*.nix' \
    && [ -z "$(git ls-files --others --exclude-standard -- '*.nix')" ]; then
        echo "No changes detected, exiting."
        popd
        exit 0
    fi


    alejandra . &>/dev/null \
        || ( alejandra . ; echo "formatting failed!" && exit 1)

    # Shows your changes
    git diff -U0 -- '*.nix'

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch &>nixos-switch.log || { grep --color error nixos-switch.log; exit 1; }

    current=$(nixos-rebuild list-generations | awk '$NF == "True" {
        print "gen " $1 " (" $2 " " $3 ")"; exit
    }')
    [ -z "$current" ] && current="rebuild $(date -Iseconds)"

    # Commit all changes witih the generation metadata
    git add -A
    git commit -m "$current"
    git push

    # Back to where you were
    popd

    # Notify all OK!
    # notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
  '';

  run-thorium = pkgs.writeShellScriptBin "thorium" ''
    appimage-run ~/appimages/Thorium-2.4.1.AppImage
  '';

  bluetooth-connect = pkgs.writeShellScriptBin "bcon" ''
    echo 'connect 9C:49:52:19:3C:0B' | bluetoothctl
  '';
in {
  environment.systemPackages = [
    sium
    run-thorium
    bluetooth-connect
  ];
}
