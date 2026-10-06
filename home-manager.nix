{
  config,
  pkgs,
  lib,
  ...
}: let
  hypr-ocr = pkgs.callPackage ./hypr-ocr.nix {};
in {
  options.programs.hyper = {
    enable = lib.mkEnableOption "custom Hyprland setup";
  };

  config = lib.mkIf config.programs.hyper.enable {
    home.packages = with pkgs; [
      awww
      kitty
      tesseract
      wl-clipboard
      grim
      slurp

      hypr-ocr
    ];

    home.file.".config/hypr/".source = ./.;
  };
}
