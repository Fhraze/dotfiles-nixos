{ pkgs, config, lib, host, ... }:

let
  #palette = config.colorScheme.palette;
  inherit (import ../../hosts/${host}/options.nix) alacritty;
in lib.mkIf (alacritty == true) {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 15;
	  y = 15;
	};
	opacity = 0.5;
	blur = true;
	decorations_theme_variant = "Dark";
      };
      scrolling = {
        history = 20000;
	multiplier = 1;
      };
      font = {
        normal = {
          family = "liberation mono";
	  style = "Regular";
	};
	bold = { style = "Bold"; };
	italic = { style = "Italic"; };
	bold_italic = { style = "Bold Italic"; };
	size = 16;
	offset = {
          x = 0;
	  y = 0;
	};
      };
      colors = {
        cursor = {
          text = "CellBackground";
	  cursor = "#FFFFFF";
	};
	vi_mode_cursor = {
          text = "CellBackground";
	  cursor = "#FFFFFF";
	};
      };
      mouse = {
        hide_when_typing = true;
      };
    };
  };
}
