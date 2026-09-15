{
  homebrew = {
    enable = true;
    enableFishIntegration = true;
    brews = [
      "pinentry-mac"
      "sevenzip"
    ];
    casks = [
      "theboredteam/boring-notch/boring-notch"
      "darrylmorley/whatcable/whatcable"
      "jordanbaird-ice"
      "podman-desktop"
      "tailscale-app"
      "wireshark-app"
      "superwhisper"
      "copilot-cli"
      "tunnelblick"
      "presentify"
      "appcleaner"
      "cotypist"
      "ghostty"
      "cursor"
      "yoink"
      "rustdesk"
    ];
    # Auto deletes any brews/casks that are not specified in the configuration
    onActivation.cleanup = "zap";

    # Updates (obviously)
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  environment.variables = {
    HOMEBREW_NO_ENV_HINTS = "1";
  };
}
