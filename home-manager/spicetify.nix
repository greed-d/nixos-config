{ pkgs, ... }:
{
  programs.spicetify.theme = {
    name = "Tokyo";

    src = pkgs.fetchFromGitHub {
      owner = "evening-hs";
      repo = "Spotify-Tokyo-Night-Theme";
      rev = "d88ca06eaeeb424d19e0d6f7f8e614e4bce962be";
      sha256 = "sha256-cLj9v8qtHsdV9FfzV2Qf4pWO8AOBXu51U/lUMvdEXAk=";
    };
  };
}
