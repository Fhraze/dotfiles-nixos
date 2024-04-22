{config, pkgs, ...}:

{
  home.sessionVariables.EDITOR = "nvim";
  programs.nano.enable = false;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = true;
    withPython3 = true;
    withNodeJs = true;
    vimAlias = true;
    viAlias = true;
  };
}
