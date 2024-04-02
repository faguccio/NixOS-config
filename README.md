# My NixOS Conf

Using sway, I'm a stud yeah.


## Something about my config

Can't make zsh work right :(

## Some Nix commands

- `nix-store --optimise`: hardlinks a bunch of stuff, saving memory
- `nix-collect-garbage --delete-older-than 1d`: delete all generations older than 1 day

## Not to forget

You can install programs with `environment.systemPackages = with pkgs; [ sium ];` but whenever possible `programs.sium.enable = true` which will both install the program and provide some systemwide configuration.