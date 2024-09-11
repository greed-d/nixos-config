{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "gruvbox-material-gtk";

  src = fetchFromGitHub {
    owner = "TheGreatMcPain";
    repo = pname;
    rev = "808959bcfe8b9409b49a7f92052198f0882ae8bc";
    sha256 = "NHjE/HI/BJyjrRfoH9gOKIU8HsUIBPV9vyvuW12D01M=";
  };

  installPhase = ''
    mkdir -p $out/share/themes/gruvbox-dark
    mkdir -p $out/share/themes/gruvbox-dark-hidpi
    mkdir -p $out/share/icons/Gruvbox-Material-Dark
    rm -rf README.md LICENSE .github
    cp -r themes/Gruvbox-Material-Dark/* $out/share/themes/gruvbox-dark
    cp -r themes/Gruvbox-Material-Dark-HIDPI/* $out/share/themes/gruvbox-dark
    cp -r icons/Grubox-Material-Dark/* $out/share/icons/Gruvbox-Material-Dark
  '';

  meta = with lib; {
    description = "Gruvbox theme for GTK based desktop environments";
    homepage = "https://github.com/TheGreatMcPain/gruvbox-material-gtk";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
