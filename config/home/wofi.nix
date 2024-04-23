{ pkgs, config, ... }:

let
  palette = config.colorScheme.palette;
in {
  home.file.".config/wofi/style.css".text = ''
    *{
        font-family: liberation mono;
    }

    window {
        border-radius: 20px;
        background-color: #FFFFFF;
    }

    #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        border-bottom: 3px solid black;
        background-color: #000000;
        color: white;
    }

    #inner-box {
        background-color: #000000;
    }

    #outer-box {
        margin: 3px;
        padding: 10px;
        border-radius: 20px;
        background-color: #000000;
    }

    #scroll {
    }

    #text {
        padding: 5px;
        color: white;
    }

    #entry:nth-child(even){
        background-color: #000000;
    }

    #entry:selected {
        background-color: #FF0062;
    }

    #text:selected {
    }
    '';
}
