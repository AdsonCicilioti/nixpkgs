{ lib
, stdenv
, fetchFromGitHub
, cmake
, gtk3
, gtk-engine-murrine
, gdk-pixbuf
, python3
, sassc
, extra-cmake-modules
, breeze-qt5
}:


stdenv.mkDerivation rec {
  pname = "gnome-breeze";
  version = "5.23.4";

  src = fetchFromGitHub {
    owner = "KDE";
    repo = "breeze-gtk";
    rev = "v${version}";
    sha256 = "0bfy57qvi0knlrf98xmba2vac2yjzryjw1m3a6yjiypzl3ayfb2i";
  };

  nativeBuildInputs = [
    cmake
    python3
    sassc
    gtk3
    breeze-qt5
  ];

  buildInputs = [
    gdk-pixbuf
    extra-cmake-modules
  ];

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Breeze* $out/share/themes
  '';

  preferLocalBuild = true;

  meta = {
    description = "A GTK Theme Built to Match KDE's Breeze. GTK2 theme made by scionicspectre";
    homepage = "https://github.com/KDE/breeze-gtk";
    license = lib.licenses.lgpl2;
    maintainers = with lib.maintainers; [ bennofs ];
    platforms = lib.platforms.all;
    hydraPlatforms = [ ];
  };
}
