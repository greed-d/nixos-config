# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  config,
  pkgs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

in
{
  # You can import other home-manager modules here
  imports = [
    ./hyprland
    ./terminal
    inputs.spicetify-nix.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "greed";
    homeDirectory = "/home/greed";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    steam

    gcc
    deno
    nodejs
    rustc
    cargo
    nixfmt-rfc-style

    firefox
    nerdfonts
    sioyek
    inter

    eza
    glib
    acpilight
    wayland
    direnv
    gnome-software

    armcord
    lazygit
    authenticator
    tlp
    mpv
    nwg-look
    bibata-cursors
    grimblast
    swappy
    starship
    zoxide
    webkitgtk
    hyprpanel
    # hyprpicker
    hypridle
    # hyprpaper
    # hyprlock
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    obsidian
    vesktop
    gnome-keyring
    telegram-desktop
    qbittorrent
    mpv
    swww
    mpvScripts.thumbfast
    waybar
    fzf

  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
    ];
    # enabledSnippets = with spicePkgs.snippets; [
    # rotating-coverart
    # pointer
    # ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
  # home.file.".icons/Gruvbox-Material-Dark".source = "${inputs.gruvbox-material-gtk}/icons/Gruvbox-Material-Dark";
  # home.file.".themes/Gruvbox-Material-Dark-HIDPI".source = "${inputs.gruvbox-material-gtk}/themes/Gruvbox-Material-Dark-HIDPI";

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "lavender";
        flavor = "mocha";
      };
    };
    theme = {
      name = "catppuccin-mocha-lavander-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  programs.btop.enable = true;
  programs.btop.catppuccin.enable = true;
  programs.zellij = {
    enable = true;
    catppuccin.enable = true;
  };
  # Enable home-manager and git
  programs.home-manager.enable = true;
  # programs.home-manager.buildFileBackup = "backup";
  # programs.home-manager.backupFileExtension = "backup";
  programs.git = {
    enable = true;
    userName = "greed-d";
    userEmail = "deekshit.bti@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
