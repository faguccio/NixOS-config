{
  pkgs,
  lib,
  ...
}: let
  # custom colors
  foreground = "#C6D0F5"; # text
  background = "#303446"; # base
  regular0 = "#DFDFDF"; # papirus
  regular1 = "#E78284"; # red
  regular2 = "#A6D189"; # green
  regular3 = "#E5C890"; # yellow
  regular4 = "#8CAAEE"; # blue
  regular5 = "#F4B8E4"; # pink
  regular6 = "#81C8BE"; # teal
  regular7 = "#F2D5CF"; # rosewater
  regular8 = "#EEBEBE"; # flamingo
  regular9 = "#CA9EE6"; # mauve
  regular10 = "#EA999C"; # maroon
  regular11 = "#EF9F76"; # peach
  regular12 = "#81C8BE"; # teal
  regular13 = "#99D1DB"; # sky
  regular14 = "#85C1DC"; # sapphire
  regular15 = "#BABBF1"; # lavender
in {
  home-manager.users.f4g4 = {
    programs.wofi = {
      enable = true;
      # settings = {location = "top_right";};
      style = ''
             @define-color base00 #282828;
        @define-color base01 #3C3836;
        @define-color base02 #504945;
        @define-color base03 #665C54;
        @define-color base04 #BDAE93;
        @define-color base06 #D5C4A1;
        @define-color base06 #EBDBB2;
        @define-color base07 #FBF1C7;
        @define-color base08 #FB4934;
        @define-color base09 #FE8019;
        @define-color base0A #FABD2F;
        @define-color base0B #B8BB26;
        @define-color base0C #8EC07C;
        @define-color base0D #83A598;
        @define-color base0E #D3869B;
        @define-color base0F #D65D0E;

        window {
            opacity: 0.9;
            border:  0px;
            border-radius: 10px;
            font-family: monospace;
            font-size: 18px;
        }

        #input {
        	border-radius: 10px 10px 0px 0px;
            border:  0px;
            padding: 10px;
            margin: 0px;
            font-size: 28px;
        	color: #8EC07C;
        	background-color: #554444;
        }

        #inner-box {
        	margin: 0px;
        	color: @base06;
        	background-color: @base00;
        }

        #outer-box {
        	margin: 0px;
        	background-color: @base00;
            border-radius: 10px;
        }

        #selected {
        	background-color: #608787;
        }

        #entry {
        	padding: 0px;
            margin: 0px;
        	background-color: @base00;
        }

        #scroll {
        	margin: 5px;
        	background-color: @base00;
        }

        #text {
        	margin: 0px;
        	padding: 2px 2px 2px 10px;
        }
      '';
    };
  };
}
