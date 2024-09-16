{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "tokyo-night-sddm";
  version = "320c8e74ade1e94f640708eee0b9a75a395697c6";

  src = fetchFromGitHub {
    owner = "siddrs";
    repo = pname;
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    sha256 = "1gf074ypgc4r8pgljd8lydy0l5fajrl2pi2avn5ivacz4z7ma595";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/tokyo-night-sddm
    cp -R ./* $out/share/sddm/themes/tokyo-night-sddm
    cd $out/share/sddm/themes/tokyo-night-sddm
    sed -i 's/win11.png/tokyocity.png/' theme.conf
  '';

  meta = with lib; {
    description = "Tokyo Night theme for SDDM";
    homepage = "https://github.com/siddrs/tokyo-night-sddm";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
