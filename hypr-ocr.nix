{pkgs}:
pkgs.writeShellApplication {
  name = "hypr-ocr";

  # Dependencies are injected directly into $PATH when this script runs
  runtimeInputs = with pkgs; [
    grim
    slurp
    imagemagick
    wl-clipboard
    libnotify
    gnused
    tesseract
  ];

  # Pure script body reading from your repo
  text = builtins.readFile ./scripts/hypr-ocr.sh;
}
