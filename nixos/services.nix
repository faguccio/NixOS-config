{pkgs, ...}: {
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  sound.enable = false;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  services.pcscd.enable = true;
  services.dbus.packages = [pkgs.gcr];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  services.syncthing = let
    user = "f4g4";
  in {
    enable = true;
    user = "${user}";
    dataDir = "/home/${user}/"; # Default folder for new synced folders
    configDir = "/home/${user}/.config/syncthing"; # Folder for Syncthing's settings and keys
  };
}
