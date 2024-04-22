{config, pkgs, ...}:

{
  home.sessionVariables.EDITOR = "nvim";

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
