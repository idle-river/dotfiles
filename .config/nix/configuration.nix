{
  imports = [
    ./packages.nix
    ./brew.nix
    ./modules/core
    ./modules/aerospace
    ./modules/development
  ];

  macbook.development = {
    enable = true;
    rust.enable = true;
    zig.enable = false;
    c = {
      enable = true;
      gui.enable = false;
    };
    python.enable = false;
    arduino.enable = false;
  };
}
