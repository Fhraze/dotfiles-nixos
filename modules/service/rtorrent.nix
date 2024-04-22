{config, pkgs, ...}:

{
  services.rtorrent = {
    enable = true;
    openFirewall = true;
    downloadDir = "/home/fhraze/Torrents";
  };
}
