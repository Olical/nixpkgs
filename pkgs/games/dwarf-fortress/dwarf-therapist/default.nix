{ lib, stdenv, fetchFromGitHub, qtbase
, qtdeclarative, cmake, texlive, ninja, mkDerivation }:

mkDerivation rec {
  pname = "dwarf-therapist";
  version = "41.2.1";

  src = fetchFromGitHub {
    owner = "Dwarf-Therapist";
    repo = "Dwarf-Therapist";
    rev = "v${version}";
    sha256 = "0wkczdmmgfd6580ca6j8kirhp1dn91l74hxacm8z2my63vl1gh4g";
  };

  nativeBuildInputs = [ texlive cmake ninja ];
  buildInputs = [ qtbase qtdeclarative ];

  installPhase = if stdenv.isDarwin then ''
    mkdir -p $out/Applications
    cp -r DwarfTherapist.app $out/Applications
  '' else null;

  meta = with lib; {
    description = "Tool to manage dwarves in a running game of Dwarf Fortress";
    maintainers = with maintainers; [ abbradar bendlas numinit jonringer ];
    license = licenses.mit;
    platforms = platforms.unix;
    homepage = "https://github.com/Dwarf-Therapist/Dwarf-Therapist";
  };
}
