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
}
