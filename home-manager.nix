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

    home.file.".config/hypr/".source = ./.;
  };
}
