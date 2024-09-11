{ pkgs, ... }:
let 
  text = "rgb(251, 241, 199)";
in
{
  home.packages = [ pkgs.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # BACKGROUND
    background {
      monitor =
      path = screenshot
      blur_passes = 2
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    # GENERAL
    general {
      hide_cursor = true
      no_fade_in = false
      grace = 0
      disable_loading_bar = false
    }

    #TIME
    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%-I:%M%p")"
      color = $foreground
      #color = rgba(255, 255, 255, 0.6)
      font_size = 90
      font_family = JetBrains Mono Nerd Font Mono ExtraBold
      position = 0, -475
      halign = center
      valign = top
    }

    # USER
    # label {
    #
    #   monitor =
    #   text = Hi there, $USER
    #   color = $foreground
    #   #color = rgba(255, 255, 255, 0.6)
    #   font_size = 20
    #   font_family = JetBrains Mono Nerd Font Mono
    #   position = 0, -95
    #   halign = center
    #   valign = center
    #
    # }


    # USER-BOX
    shape {
      monitor =
      size = 350, 50
      color = rgba(225, 225, 225, .2)
      rounding = 15
      border_size = 0
      border_color = rgba(255, 255, 255, 0)
      rotate = 0

      position = 0, -130
      halign = center
      valign = center
    }

    # USER
    label {

      monitor =
      text =   $USER
      color = rgba(235, 219, 178, .9)
      font_size = 16
      font_family = JetBrainsMono Nerd Font
      position = 0, -130
      halign = center
      valign = center
    }

    # INPUT FIELD
    input-field {
      
      size = 350, 50
      color = rgba(225, 225, 225, .2)
      rounding = 15
      border_size = 0
      border_color = rgba(255, 255, 255, 0)
      rotate = 0


      monitor =
      outline_thickness = 2
      dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true
      outer_color = rgba(0, 0, 0, 0)
      inner_color = rgba(0, 0, 0, 0.5)
      font_color = rgb(200, 200, 200)
      fade_on_empty = true
      font_family = JetBrains Mono Nerd Font Mono
      placeholder_text = <i><span foreground="##cdd6f4">Password?....</span></i>
      hide_input = false
      position = 0, -200
      halign = center
      valign = center
    }
  '';
}
