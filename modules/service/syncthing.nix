{config, pkgs, ...}:

{
  services.syncthing = {
    enable = true;
    systemService = true;
    openDefaultPorts = true;
    settings = {
      gui = { theme = "black"; };
      folders = {
        "/home/fhraze/Documents/Backups" = {
          id = "Backups";
	};
      };
    };
  };
}
