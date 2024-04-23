{config, pkgs, ...}:

{
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    extensions = [
      pkgs.vscode-extensions.asvetliakov.vscode-neovim
      pkgs.vscode-extensions.ms-dotnettools.csharp
    ];
    userSettings = {
      "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace,  'Hack Nerd Font'";
      "files.autoSave" = "off";
      "[nix]"."editor.tabSize" = 2;
    };
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
