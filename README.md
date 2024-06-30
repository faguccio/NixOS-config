# My NixOS Conf

Using sway, I'm a stud I know.


## Some Nix commands

- `nix-store --optimise`: hardlinks a bunch of stuff, saving memory
- `nix-collect-garbage --delete-older-than 1d`: delete all generations older than 1 day


## Upgrading Downgrding

- `nixos-rebuild switch --upgrade`
    - same as `nix-channel --update nixos; nixos-rebuild switch`

https://nixos.org/manual/nixos/stable/index.html#sec-upgrading

## Not to forget

You can install programs with `environment.systemPackages = with pkgs; [ sium ];` but whenever possible `programs.sium.enable = true` which will both install the program and provide some systemwide configuration.