{ pkgs, ... }:

let
  tmux-tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tokyo-night-tmux";
    version = "2.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "janoamaral";
      repo = "tokyo-night-tmux";
      rev = "b45b742eb3fdc01983c21b1763594b549124d065";
      sha256 = "sha256-k4CbfWdyk7m/T97ytxLOEMUKrkU5iJSIu3lvyT1B1jU=";
    };
  };

in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-kitty";
    extraConfig = ''
      set -ag terminal-overrides ",$TERM:RGB"

      set -g prefix C-Space
      unbind C-b
      bind-key C-Space send-prefix

      set -g base-index 1              # start indexing windows at 1 instead of 0
      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g escape-time 0             # zero-out escape time delay
      set -g history-limit 1000000     # increase history size (from 2,000)
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      set -g status-position top          # use system clipboard

      unbind %
      # bind | split-window -h
      bind | split-window -h -c "#{pane_current_path}"

      unbind '"'
      bind '-' split-window -v -c "#{pane_current_path}"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set -g mouse on
      set -g default-terminal "rxvt-unicode-256color"
      set -g default-terminal "tmux-256color"
      set -g default-terminal "xterm-kitty-256color"
      set -g default-terminal "xterm-256color"
      set-option -g default-terminal "screen-256color"
      # set -g default-terminal "alacritty"

      set-window-option -g mode-keys vi

      bind-key -r f run-shell "tmux neww ~/.local/scripts/tmux-sessionizer"

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode when dragging with mouse

    '';
    plugins = with pkgs; [
      {
        plugin = tmux-tokyo-night;
        extraConfig = ''
          set -g @plugin 'tmux-tokyo-night'
          set -g @tokyo-night-tmux_window_id_style digital
          set -g @tokyo-night-tmux_pane_id_style hsquare
          set -g @tokyo-night-tmux_zoom_id_style dsquare
          set -g @tokyo-night-tmux_date_format YMD
          set -g @tokyo-night-tmux_time_format 24H
          set -g @tokyo-night-tmux_show_music 0
          set -g @tokyo-night-tmux_show_netspeed 0
          set -g @tokyo-night-tmux_netspeed_showip 0      # Display IPv4 address (default 0)
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_path_format full # 'relative' or 'full'
          set -g @tokyo-night-tmux_show_battery_widget 0
        '';
      }
      # {
      #   plugin = tmuxPlugins.catppuccin;
      #   extraConfig = ''
      #     set -g @catppuccin_flavour "mocha"
      #     set -g @catppuccin_window_tabs_enabled on
      #     set -g @catppuccin_date_time "%H:%M"
      #   '';
      # }

      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''

          is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
              | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

          bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
          bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
          bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
          bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

          tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'

          if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
          if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

          # bind-key -n 'C-Space' if-shell "$is_vim" 'send-keys C-Space' 'select-pane -t:.+'

          bind-key -T copy-mode-vi 'C-h' select-pane -L
          bind-key -T copy-mode-vi 'C-j' select-pane -D
          bind-key -T copy-mode-vi 'C-k' select-pane -U
          bind-key -T copy-mode-vi 'C-l' select-pane -R
          bind-key -T copy-mode-vi 'C-\' select-pane -l
        '';
      }
    ];
  };
}
