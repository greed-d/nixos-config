{ ... }:
{
  services.hyprpaper = {
    enable = false;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "~/Pictures/Wallpapers/wall.jpg" ];

      wallpaper = [
        "eDP-1, ~/Pictures/Wallpapers/wall.jpg"
      ];
    };
  };
}
