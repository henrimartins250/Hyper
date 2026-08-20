{
  config,
  pkgs,
  lib,
  ...
}: {
  options.programs.Hyper.enable =
    lib.mkEnableOption "my hyprland setup";

  config = lib.mkIf config.programs.Hyper.enable {
    home.packages = with pkgs; [
      awww
      hyprland
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    home.file.".config/nvim".source = ./.;
  };
}
