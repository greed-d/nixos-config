{ ... }:
{
  services.hyprpaper = {
    enable = false;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "~/Pictures/walls-catppuccin-mocha/aztec-mysteries.png" ];

      wallpaper = [
        "eDP-1, ~/Pictures/walls-catppuccin-mocha/aztec-mysteries.png"
      ];
    };
  };
}
