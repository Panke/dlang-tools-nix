{
  description = "dfmt, dscanner and co";
  outputs = { self, nixpkgs }: 
  let 
    overlay_ = final: prev: {
      dfmt = final.callPackage ./dfmt {};
    };
    pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ overlay_ ]; };
  in
  rec {
    overlay = overlay_;
    packages.x86_64-linux = 
    {
      dfmt = pkgs.dfmt;
    };
  };
}

