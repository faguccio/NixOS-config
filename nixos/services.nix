{...}: {
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

  services.syncthing = {
    enable = true;
    user = "myusername";
    dataDir = "/home/myusername/Documents"; # Default folder for new synced folders
    configDir = "/home/myusername/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
  };
}
