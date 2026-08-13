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
    c.enable = true;
    arduino.enable = true;
  };
}
