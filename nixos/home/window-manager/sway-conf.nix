{
  pkgs,
  lib,
  ...
}:
with lib;
with pkgs; let
  foreground = "#C6D0F5"; # text
  background = "#303446"; # base
  regular0 = "#51576D"; # surface 1
  regular1 = "#E78284"; # red
  regular4 = "#8CAAEE"; # blue

  modifier = "Mod4";
in {
  security.pam.services.swaylock = {};

  # Screen capture on wayland :)
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.systemPackages = with pkgs; [swaybg brightnessctl];

  home-manager.users.f4g4 = {
    wayland.windowManager.sway = {
      enable = true;

      extraConfig = ''
        exec_always swaybg -i /home/f4g4/Pictures/background.jpg -m fill

        workspace 1

        # swaymsg input "1267:47:Elan_TrackPointw" events disabled

      '';

      config = rec {
        modifier = "Mod4";
        terminal = "foot";
        startup = [];

        bars = [
          {
            command = "${waybar}/bin/waybar";
          }
        ];

        window = {
          hideEdgeBorders = "smart";
          border = 2;
          titlebar = false;
        };

        output = {
          "DP-2" = {
            scale = "1.25";
            transform = "normal";
          };
        };

        input = {
          # trackpad config
          "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "enabled";
            scroll_factor = "0.3";

            # accel_profile = "adaptive"; # or flat
            # pointer_accel = "0.1";
          };

          # keebs config
          "type:keyboard" = {
            repeat_rate = "60";
            repeat_delay = "300";
          };
        };

        colors = {
          background = background;
          focused = {
            border = regular4;
            background = regular4;
            text = foreground;
            indicator = regular4;
            childBorder = regular4;
          };
          focusedInactive = {
            border = regular0;
            background = regular0;
            text = foreground;
            indicator = regular0;
            childBorder = regular0;
          };
          unfocused = {
            border = regular0;
            background = regular0;
            text = foreground;
            indicator = regular0;
            childBorder = regular0;
          };
          urgent = {
            border = regular1;
            background = regular1;
            text = foreground;
            indicator = regular1;
            childBorder = regular1;
          };
          placeholder = {
            border = regular4;
            background = regular4;
            text = foreground;
            indicator = regular4;
            childBorder = regular4;
          };
        };

        keybindings = mkOptionDefault {
          "${modifier}+e" = "exec ${firefox}/bin/firefox";
          "${modifier}+n" = "exec thunar";
          "${modifier}+o" = "exec ${obsidian}/bin/obsidian";
          "${modifier}+w" = "kill";
          "${modifier}+semicolon" = "exec 'swaylock -e -f -i ~/Pictures/angry-misato.png; systemctl suspend'";
          "${modifier}+space" = "exec wofi -S run";

          "${modifier}+m" = "exec ${brightnessctl}/bin/brightnessctl set 1%";
          "${modifier}+comma" = "exec ${brightnessctl}/bin/brightnessctl set 80%";
          "${modifier}+b" = "exec ${brightnessctl}/bin/brightnessctl --device=tpacpi::kbd_backlight set 50%";

          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+1" = "workspace number 1";

          "Print" = ''exec grim -g "$(slurp -d)" - | wl-copy -t image/png'';

          # audio
          "XF86AudioMicMute" = "exec pactl set-source-mute 0 toggle";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +2%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -2%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";

          # brightness
          "XF86MonBrightnessUp" = "exec ${brightnessctl}/bin/brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec ${brightnessctl}/bin/brightnessctl set 5%-";
        };
      };
    };
  };
}
