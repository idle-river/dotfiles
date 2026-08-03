{
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.01;
      autohide-time-modifier = 0.01;
      enable-spring-load-actions-on-all-items = true;
      appswitcher-all-displays = true;
      expose-animation-duration = 0.3;
      magnification = true;
      largesize = 70;
      mineffect = "genie";
      minimize-to-application = false;
      orientation = "bottom";
      persistent-apps = [
        "/System/Applications/Apps.app"
        "/Applications/Ghostty.app"
        "/Applications/Nix Apps/Helium.app"
        "/Applications/Nix Apps/Zed.app"
      ];
    };
    finder = {
      FXPreferredViewStyle = "clmv";
      FXEnableExtensionChangeWarning = false;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    iCal = {
      "first day of week" = "Sunday";
    };
    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };
    menuExtraClock = {
      Show24Hour = true;
      FlashDateSeparators = false;
    };
    trackpad = {
      TrackpadRightClick = true;
      TrackpadRotate = true;
      Clicking = true;
    };
    NSGlobalDomain.AppleICUForce24HourTime = true;
    screencapture.location = "~/Downloads/Screenshots";
  };
}
