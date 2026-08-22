{
  config,
  pkgs,
  lib,
  ...
}: {
  options.programs.hyper = {
    enable = lib.mkEnableOption "custom Hyprland setup";
  };

  config = lib.mkIf config.programs.hyper.enable {
    home.packages = with pkgs; [
      awww
      kitty
      wl-clipboard
      grim
      slurp
    ];

    # Define a systemd user service properly
    systemd.user.services.hyprland = {
      Unit = {
        Description = "Hyprland Wayland Compositor";
        Documentation = ["man:hyprland(1)"];
        PartOf = ["graphical-session.target"];
      };
      Service = {
        Type = "exec";
        ExecStart = "${pkgs.hyprland}/bin/hyprland";
        Restart = "on-failure";
        RestartSec = "5s";
        TimeoutStopSec = "5s";
        Slice = "session.slice";
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };

    home.file.".config/hypr/".source = ./.;
  };
}
