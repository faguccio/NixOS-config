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

  home-manager.users.f4g4 = {
    wayland.windowManager.sway = {
      enable = true;
      extraConfig = ''
        font pango:monospace 0
        output * bg ~/Pictures/background.jpg stretch

        exec swaymsg output eDP-1 scale 1

        exec_always {
          gsettings set org.gnome.desktop.interface cursor-theme oreo_white_cursors
          gsettings set org.gnome.desktop.interface cursor-size 32
        }
        seat seat0 xcursor_theme oreo_white_cursors 32

        workspace 1
      '';

      config = rec {
        modifier = "Mod4";
        terminal = "foot";
        startup = [
        ];

        bars = [
          {
            command = "${waybar}/bin/waybar";
          }
        ];
      };
      config = {
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
          # # rofi: menu
          # "${modifier}+d" = "exec ${rofi}/bin/rofi -show drun";
          # # rofi: clipboard manager
          # "${modifier}+c" = "exec ${cliphist}/bin/cliphist list | ${rofi}/bin/rofi -dmenu | ${cliphist}/bin/cliphist decode | ${wl-clipboard}/bin/wl-copy ";
          # # rofi: bluetooth
          # "${modifier}+y" = "exec ${rofi-bluetooth}/bin/rofi-bluetooth";
          # # rofi: password store
          "${modifier}+e" = "exec ${firefox}/bin/firefox";
          "${modifier}+o" = "exec ${obsidian}/bin/obsidian";
          "${modifier}+w" = "kill";
          "${modifier}+l" = "exec swaylock -e -f -i ~/Pictures/angry-misato.png; systemctl suspend";
          "${modifier}+space" = "exec wofi -S run";
          # # pick color
          # "${modifier}+n" = "exec ${wl-color-picker}/bin/wl-color-picker clipboard";
          # # mirror screen
          # "${modifier}+o" = "exec ${wl-mirror}/bin/wl-present mirror";

          # "${modifier}+Ctrl+${left}" = "move workspace to output left";
          # "${modifier}+Ctrl+${down}" = "move workspace to output down";
          # "${modifier}+Ctrl+${up}" = "move workspace to output up";
          # "${modifier}+Ctrl+${right}" = "move workspace to output right";

          "${modifier}+Shift+0" = "move container to workspace number 0";
          "${modifier}+0" = "workspace number 0";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+1" = "workspace number 1";

          # "${modifier}+Shift+${left}" = "move left";
          # "${modifier}+Shift+${down}" = "move down";
          # "${modifier}+Shift+${up}" = "move up";
          # "${modifier}+Shift+${right}" = "move right";

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
          "XF86MonBrightnessUp" = "exec ${light}/bin/light -A 2";
          "XF86MonBrightnessDown" = "exec ${light}/bin/light -U 2";
        };
      };
    };
  };
}
