{ pkgs, ... }:
{
  programs.fish = {
    catppuccin.enable = true;
    enable = true;
    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      lf = "yazi";
      lt = "eza -lah --color -T -L 2 --git --icons --group-directories-first --no-user";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      e = "thunar";
      x = "exit";
      lg = "lazygit";
      nvd = "neovide";

      dot = "tmux-sessionizer ~/.dotfiles";
      tns = "tmux new -s";
      tas = "tmux attach -t";
      tls = "tmux list-sessions";
      tds = "tmux detach";
    };

    plugins = [
      {
        name = "bangbang";
        src = pkgs.fetchFromGitHub {
          owner = "BrewingWeasel";
          repo = "fishbang";
          rev = "0b5ef82ead524a7dd0da5760d8f677b02b35f654";
          sha256 = "AbFSUz2C4ru0jclF60JOpzf7xWo0ffahEsM5hkNNtGw=";
        };
      }
    ];

    interactiveShellInit = ''
      set -x XDG_DATA_DIRS $XDG_DATA_DIRS /usr/share /var/lib/flatpak/exports/share $HOME/.local/share/flatpak/exports/share
      set PATH "$PATH":"$HOME/.local/scripts/"
      set -x GTK_THEME "catppuccin-mocha-compact-lavender-dark"
    '';
  };
}
