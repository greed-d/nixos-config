{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour "mocha"
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_date_time "%H:%M"
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim "session"
          set -g @resurrect-strategy-nvim "session"
          set -g @resurrect-capture-pane-contents "on"
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore "on"
          set -g @continuum-boot "on"
          set -g @continuum-save-interval "10"
        '';
      }
    ];
    extraConfig = ''
      # Fix color issues with terminal
      set -g default-terminal "$TERM"
      set-option -ag terminal-overrides ",$TERM:RGB"

      # Bring Back Transparency
      set -g pane-active-border-style bg=color0
      set -g pane-border-style bg=color0
      set-window-option -g window-active-style bg=terminal
      set-window-option -g window-style bg=color0
    '';
  };
}
