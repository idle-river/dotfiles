{
  homebrew = {
    enable = true;
    enableFishIntegration = true;
    brews = [
      "pinentry-mac"
      "sevenzip"
    ];
    casks = [
      "superwhisper"
      "tunnelblick"
      "cotypist"
      "ghostty"
      "rustdesk"
      "claude"
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
