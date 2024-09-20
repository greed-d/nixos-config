{ ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin Mocha";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      confirm_os_window_close = 0;
      # background_opacity = "0.75";
      window_padding_width = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      active_tab_foreground = "#FBF1C7";
      active_tab_background = "#7C6F64";
      inactive_tab_foreground = "#FBF1C7";
      inactive_tab_background = "#3C3836";
    };
  };
}
