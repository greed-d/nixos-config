{
  lib,
  qtbase,
  qtsvg,
  qtgraphicaleffects,
  qtquickcontrols2,
  wrapQtAppsHook,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "tokyo-night-sddm";
  version = "1..0";
  dontBuild = true;
  src = fetchFromGitHub {
    owner = "greed-d";
    repo = pname;
    rev = "44967486eb67abe8956c9d33abf83ef601dbccce";
    sha256 = "0z9xxqqbby50xsdr8i2j4ls1dd9s3hqmlpv1qcbc5mgfbakc5slm";
  };
  nativeBuildInputs = [
    wrapQtAppsHook
  ];

  propagatedUserEnvPkgs = [
    qtbase
    qtsvg
    qtgraphicaleffects
    qtquickcontrols2
  ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/tokyo-night-sddm
  '';

}
