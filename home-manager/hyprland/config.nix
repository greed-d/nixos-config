{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {

    settings = {

      exec-once = [

        #########################
        ### CLIPBOARD HISTORY ###
        #########################

        "wl-paste --watch cliphist store"
        "wl-clipboard-history -t"
        "wl-paste --type text --watch cliphist store "
        "wl-paste --type image"

        "hyprpaper"
        "hypridle"
        "hyprpanel"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        #setting up general programs
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "thunar";
        "$menu" = "rofi -show drun -theme ~/.config/rofi/nord.rasi";
        "$browser" = "firefox";
        "$disc_client" = "vesktop";

        layout = "dwindle";
        border_size = 2;
        "col.active_border" = "rgb(89b482) rgb(1e2122) rgb(1e2122) rgb(89b482)";
        "col.inactive_border" = "rgb(24273A) rgb(24273A) rgb(24273A) rgb(27273A) 45deg";
        gaps_in = 5;
        gaps_out = 10;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        enable_swallow = true;
      };

      binds = {
        workspace_back_and_forth = true;
      };

      decoration = {
        rounding = 0;
        shadow_render_power = 2;
        drop_shadow = 2;
        shadow_range = 20;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = "on";
        };

      };

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
      ];

      animations = {
        enabled = true;

        # bezier = [
        #   "wind, 0.05, 0.9, 0.1, 1.05"
        #   "winIn, 0.1, 1.1, 0.1, 1.1"
        #   "winOut, 0.3, -0.3, 0, 1"
        #   "linear, 1, 1, 1, 1"
        # ];

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.4, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1 # use with .2s duration"
        ];

        # animation = [
        #   "windows, 1, 6, wind, slide"
        #   "windowsIn, 1, 6, winIn, slide"
        #   "windowsOut, 1, 5, winOut, slide"
        #   "windowsMove, 1, 5, wind, slide"
        #   "border, 1, 1, linear"
        #   "borderangle, 1, 30, linear, loop"
        #   "fade, 1, 10, default"
        #   "workspaces, 1, 5, wind "
        # ];

        animation = [
          "windows, 1, 3, md3_decel, slide 60%"
          "windowsIn, 1, 3, md3_decel, slide 60%"
          "windowsOut, 1, 3, md3_accel, slide 90%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];

      };

      bind = [
        "$mainMod , mouse_down, workspace, e+1"
        "$mainMod , mouse_up, workspace, e-1"
        "$mainMod , Return, exec, $terminal"
        "$mainMod , Space, exec, pkill rofi || $menu"
        "$mainMod , comma, exec, pkill rofi || $emoji"
        "$mainMod , B, exec, $browser"
        "$mainMod , D, exec, $disc_client"
        "$mainMod , E, exec, $fileManager"
        "$mainMod , T, exec, swaync-client -t -sw"
        "$mainMod , V, exec, pkill rofi || cliphist list | rofi -dmenu -theme ~/.config/rofi/nord.rasi | cliphist decode | wl-copy"
        "$mainMod CONTROL, L, exec, hyprlock"

        "$mainMod , U, focusurgentorlast"
        # $mainMod , I, exec, $hyp_script/ChangeLayout

        "$mainMod , S, togglefloating"
        #$mainMod , A, exec, bash -c "if hyprctl activewindow | grep 'floating: 0'; then hyprctl dispatch togglefloating active; fi; hyprctl dispatch pin active"
        "$mainMod , W, killactive"

        "$mainMod , backslash , fullscreen, 1"
        "$mainMod , F, fullscreen, 0"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        "$mainMod , grave, togglespecialworkspace, "
        "$mainMod SHIFT, grave, movetoworkspace, special"

        ",Print,exec,grimblast --notify save output ~/Pictures/Screenshots/$(date +'%Y%m%d%H%M%S_1.png')"
        "$mainMod ,Print,exec,grimblast --notify save screen"
        "$mainMod SHIFT,Print,exec,grimblast save output - | swappy -f -"
        "$mainMod CONTROL,S,exec,grimblast --notify save area $(xdg-user-dir PICTURES)/Screenshots/$(date +'%Y%m%d%H%M%S_1.png')"
        "$mainMod SHIFT,S,exec,grimblast --notify copy area"
        "$mainMod ALT,S,exec,grimblast --notify copy "

        "$mainMod SHIFT, Q, exec, shutdown now"
        "$mainMod SHIFT, R,  exec, reboot"
        "$mainMod CONTROL, Q,  exit "
      ];

      bindm = [
        "$mainMod , mouse:272,movewindow"
        "$mainMod , mouse:273,resizewindow"
      ];

      bindle = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", xf86audiomute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mainMod, M, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindr = [

        "$mainMod , h, movefocus, l"
        "$mainMod , l, movefocus, r"
        "$mainMod , k, movefocus, u"
        "$mainMod , j, movefocus, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod CONTROL, k, focusmonitor, l"
        "$mainMod CONTROL, j, focusmonitor, r"
        "$mainMod ALT, h, splitratio, -0.1"
        "$mainMod ALT, l, splitratio, +0.1"
      ];

      windowrule = [

        "size 1920x1080, Minecraft*"
        "size 1920x1080, DOOM*"
        "float, kcalc"
        "float, zoom"
        "float, file_progress"
        "float, confirm"
        "float, dialog"
        "float, download"
        "float, notification"
        "float, error"
        "float, splash"
        "float, nwg-look"
        "float, org.telegram.desktop"
        "float, confirmreset"
        "float, file-roller"
        "float, title:^(About Zen Browser)$"
        "move 1202 670, title:^(Picture-in-Picture)$"
        "size 702 396, title:^(Picture-in-Picture)$"
        "move 1202 670, title:^(Picture in picture)$"
        "size 702 396, title:^(Picture in picture)$"
        "move, 480 50 class:^(one.alynx.showmethekey)$"
        "size, 954 763 class:^(one.alynx.showmethekey)$"
        "size, 1085 998 class:^(org.telegram.desktop)$"
        "size, 510 943 class:^(Waydroid)$"
        "move, 817 66 class:^(org.telegram.desktop)$"
        "move, 1419 972 class:^(showmethekey-gtk)$"
        "size, 489 93 class:^(showmethekey-gtk)$"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.* "
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"

        # "opacity 0.90 0.90, class:^(vesktop|Thunar|Slack|discord|Spotify|neovide|kitty|ArmCord|org.wezfurlong.wezterm|obsidian|TelegramDesktop)$"
        "workspace 1, class:^firefox$"
        "workspace 1, class:^floorp$"
        "workspace 3, class:^obsidian$"
        "workspace 5, class:^org.kde.kdeconnect.app$"
        "workspace 6, class:^org.gnome.Nautilus$"
        "workspace 6, class:^([Tt]hunar)$"
        "workspace 6, class:^Pcmanfm$"
        "workspace 7, class:^evince$"
        "workspace 7, class:^org.pwmt.zathura$"
        "workspace 8, class:^Spotify$"
        "workspace 9  class:^(vesktop)$"
        "workspace 9 silent,  class:^([Aa]rm[Cc]ord)$"
        "workspace 10 silent, class:^org.telegram.desktop$"
        "workspace 10 silent, class:^TelegramDesktop$"
        "float, class:Plexamp"
        "float, title:fabric"
        "float, title:^qBittorrent v4.6.2$"
        "float, title:^File Operation Progress$"
        "float, title:^Confirm to replace files$"
        "float, title:^KDE Connect URL handler$"
        "float, title:^(Picture-in-Picture)$"
        "float, class:^(one.alynx.showmethekey)$"
        "float, class:^(showmethekey-gtk)$"
        "pin, class:^(showmethekey-gtk)$"
        "pin, title:^(Picture-in-Picture)$"
        "float, class:^(xdm-app)$"
        "float, title:^([Nn]ew [Dd]ownload)$"
      ];

    };
  };
}
