{ pkgs }:

pkgs.writeShellScriptBin "record-script" ''
  mkdir -p ~/Videos/wf-recorder
  cd ~/Videos/wl-recorder
  if [[ "$(pidof wf-recorder)" == "" ]]; then
      notify-send "wf-recorder" "Starting recording" -a 'wf-recorder'
      wf-recorder -f './recording_'"$(date '+%Y_%m_%_d..%H.%M')"'.mp4' -t --geometry "$(slurp)" 
  else
      kill --signal SIGINT wf-recorder
      notify-send "wf-recorder" "Recording Stopped" -a 'wf-recorder'
  fi
''
