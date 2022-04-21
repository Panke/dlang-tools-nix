{ stdenv, ldc, dub, fetchgit, git }:
    stdenv.mkDerivation 
    {
        name = "dfmt";
        version = "0.14.2";
        srcs = [ 
            (fetchgit {
                url = "https://github.com/dlang-community/dfmt.git";
                rev = "6a24f0dc7c490f4cb06cdc9d21b841bee84615f4";
                sha256 = "VvlxhdY679btAtYKIsnPKj5nu6EjRyyurIEa2iqnWbc=";
                name = "dfmt";
                fetchSubmodules = true;
                deepClone = true;
            })
        ];
        nativeBuildInputs = [ ldc git ];

        buildPhase = ''
            mkdir bin
            echo 6a24f0dc7c490f4cb06cdc9d21b841bee84615f4 > bin/githash.txt
            sed -i -e "s/ldc: githash/ldc:/" makefile
            make ldc
        '';

        installPhase = ''
            mkdir -p $out/bin
            cp bin/dfmt $out/bin
        '';
    }
