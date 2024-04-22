{config, pkgs, ...}:

{
  security.doas = {
    enable = true;
    extraConfig = "permit persist setenv {PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin} :wheel\n" +
                  "permit persist setenv { XAUTHORITY LANG LC_ALL } :wheel";
  };
}
