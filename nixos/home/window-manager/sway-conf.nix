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
  home-manager.users.f4g4 = {
    wayland.windowManager.sway = {
      enable = true;
      extraConfig = ''
        font pango:monospace 0
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
          # # pick color
          # "${modifier}+n" = "exec ${wl-color-picker}/bin/wl-color-picker clipboard";
          # # mirror screen
          # "${modifier}+o" = "exec ${wl-mirror}/bin/wl-present mirror";

          # "${modifier}+Ctrl+${left}" = "move workspace to output left";
          # "${modifier}+Ctrl+${down}" = "move workspace to output down";
          # "${modifier}+Ctrl+${up}" = "move workspace to output up";
          # "${modifier}+Ctrl+${right}" = "move workspace to output right";

          # "${modifier}+Shift+${left}" = "move left";
          # "${modifier}+Shift+${down}" = "move down";
          # "${modifier}+Shift+${up}" = "move up";
          # "${modifier}+Shift+${right}" = "move right";

          "XF86AudioMicMute" = "exec pactl set-source-mute 0 toggle";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +2%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -2%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";

          # mic control
          "${modifier}+XF86AudioRaiseVolume" = "exec ${pamixer}/bin/pamixer --default-source --increase 2";
          "${modifier}+XF86AudioLowerVolume" = "exec ${pamixer}/bin/pamixer --default-source --decrease 2";
          "${modifier}+XF86AudioMute" = "exec ${pamixer}/bin/pamixer --default-source -t";

          # brightness
          "XF86MonBrightnessUp" = "exec ${light}/bin/light -A 2";
          "XF86MonBrightnessDown" = "exec ${light}/bin/light -U 2";
        };
      };
    };
  };
}
# {
#   config,
#   pkgs,
#   lib,
#   ...
# }: let
#   # bash script to let dbus know about important env variables and
#   # propagate them to relevent services run at the end of sway config
#   # see
#   # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
#   # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts
#   # some user services to make sure they have the correct environment variables
#   dbus-sway-environment = pkgs.writeTextFile {
#     name = "dbus-sway-environment";
#     destination = "/bin/dbus-sway-environment";
#     executable = true;
#     text = ''
#       dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
#       systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
#       systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
#     '';
#   };
#   # currently, there is some friction between sway and gtk:
#   # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
#   # the suggested way to set gtk settings is with gsettings
#   # for gsettings to work, we need to tell it where the schemas are
#   # using the XDG_DATA_DIR environment variable
#   # run at the end of sway config
#   configure-gtk = pkgs.writeTextFile {
#     name = "configure-gtk";
#     destination = "/bin/configure-gtk";
#     executable = true;
#     text = let
#       schema = pkgs.gsettings-desktop-schemas;
#       datadir = "${schema}/share/gsettings-schemas/${schema.name}";
#     in ''
#       gnome_schema=org.gnome.desktop.interface
#       gsettings set $gnome_schema gtk-theme 'Dracula'
#     '';
#   };
# in {
#   environment.systemPackages = with pkgs; [
#     alacritty # gpu accelerated terminal
#     dbus # make dbus-update-activation-environment available in the path
#     dbus-sway-environment
#     configure-gtk
#     wayland
#     xdg-utils # for opening default programs when clicking links
#     glib # gsettings
#     dracula-theme # gtk theme
#     gnome3.adwaita-icon-theme # default gnome cursors
#     swaylock
#     swayidle
#     grim # screenshot functionality
#     slurp # screenshot functionality
#     wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
#     bemenu # wayland clone of dmenu
#     mako # notification system developed by swaywm maintainer
#     wdisplays # tool to configure displays
#   ];
#   services.pipewire = {
#     enable = true;
#     alsa.enable = true;
#     pulse.enable = true;
#   };
#   # xdg-desktop-portal works by exposing a series of D-Bus interfaces
#   # known as portals under a well-known name
#   # (org.freedesktop.portal.Desktop) and object path
#   # (/org/freedesktop/portal/desktop).
#   # The portal interfaces include APIs for file access, opening URIs,
#   # printing and others.
#   services.dbus.enable = true;
#   xdg.portal = {
#     enable = true;
#     wlr.enable = true;
#     # gtk portal needed to make gtk apps happy
#     extraPortals = [pkgs.xdg-desktop-portal-gtk];
#   };
#   # Enable the gnome-keyrig secrets vault.
#   # Will be exposed through DBus to programs willing to store secrets.
#   services.gnome.gnome-keyring.enable = true;
#   # enable sway window manager
#   programs.sway = {
#     enable = true;
#     wrapperFeatures.gtk = true;
#   };
# }

