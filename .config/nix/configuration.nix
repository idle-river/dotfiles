{
  imports = [
    ./modules/packages
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
    python.enable = true;
    go.enable = true;
    js.enable = true;
    arduino.enable = false;
  };
}
