{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "gruvbox-material-gtk";
  version = "808959bcfe8b9409b49a7f92052198f0882ae8bc";

  src = fetchFromGitHub {
    owner = "TheGreatMcPain";
    repo = pname;
    rev = "808959bcfe8b9409b49a7f92052198f0882ae8bc";
    sha256 = "NHjE/HI/BJyjrRfoH9gOKIU8HsUIBPV9vyvuW12D01M=";
  };

  installPhase = ''
    mkdir -p $out/share/themes/Gruvbox-Material-Dark-HIDPI
    mkdir -p $out/share/themes/Gruvbox-Material-Dark
    mkdir -p $out/share/icons/Gruvbox-Material-Dark
    rm -rf README.md LICENSE .github
    cp -r themes/Gruvbox-Material-Dark-HIDPI/* $out/share/themes/Gruvbox-Material-Dark-HIDPI
    cp -r themes/Gruvbox-Material-Dark/* $out/share/themes/Gruvbox-Material-Dark
    cp -r icons/Gruvbox-Material-Dark/* $out/share/icons/Gruvbox-Material-Dark
  '';

  meta = with lib; {
    description = "Gruvbox theme for GTK based desktop environments";
    homepage = "https://github.com/TheGreatMcPain/gruvbox-material-gtk";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
