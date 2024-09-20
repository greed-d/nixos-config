# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  pkgs,
  ...
}:
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
    btop
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

  ];

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 24;
  # };

  # programs.spicetify = {
  #   enable = true;
  # };
  # home.file.".icons/Gruvbox-Material-Dark".source = "${inputs.gruvbox-material-gtk}/icons/Gruvbox-Material-Dark";
  # home.file.".themes/Gruvbox-Material-Dark-HIDPI".source = "${inputs.gruvbox-material-gtk}/themes/Gruvbox-Material-Dark-HIDPI";

  # catppuccin.flavor = "mocha";

  # home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";

  # Enable home-manager and git
  programs.home-manager.enable = true;
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
