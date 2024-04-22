{config, pkgs, ...}:

{
  programs.thunar = {
    plugins = [
      thunar-volman
      thunar-archive-plugin
    ];
  };
}
