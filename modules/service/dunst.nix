{config, pkgs, ...}:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
	follow = "none";
	width = 500;
	height = 350;
	font = "Monospace 15";
	frame_width = 1;
	corner_radius = 15;
	gap_size = 3;
      };
      urgency_low = {
        timeout = 4;
	background = "#000000";
	foreground = "#B1B1B1";
	frame_color = "#FFFFFF#";
      };
      urgency_normal = {
        timeout = 8;
	background = "#000000";
	foreground = "#FFFFFF";
	frame_color = "#FFFFFF#";
      };
      urgency_critical = {
        timeout = 0;
	background = "#000000";
	foreground = "#FF8F00";
	frame_color = "#FFFFFF#";
      };
    };
  };
}
