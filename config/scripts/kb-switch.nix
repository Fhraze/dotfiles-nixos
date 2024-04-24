{ pkgs }:

pkgs.writeShellScriptBin "kb-switch" ''
  cd ~/.config/hypr/

  CURR_KBLAYOUT=`cat CURR_KBLAYOUT.variable`
  if [[ $CURR_KBLAYOUT == "br" ]]; then	
    sed -i '1d' CURR_KBLAYOUT.variable
    echo "us" >> CURR_KBLAYOUT.variable
    hyprctl keyword input:kb_layout "us"
    notify-send "Keyboard layout changed to 'us'!"
  else
    sed -i '1d' CURR_KBLAYOUT.variable
    echo "br" >> CURR_KBLAYOUT.variable
    hyprctl keyword input:kb_layout "br"
    notify-send "Keyboard layout changed to 'br'!"
  fi
''
