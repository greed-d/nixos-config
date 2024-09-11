{ ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid multiple hyprlock instance
        before_sleep_cmd = "loginctl lock-session"; #lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # press one key to wake up screen
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
