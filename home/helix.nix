{ config, pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        auto-pairs = true;
        whitespace.render = "all";
        statusline = {
          left = [ "mode" "file-name" "file-type" "file-encoding" ];
          center = [ ];
          right = [ "spinner" "diagnostics" "selections" "file-line-ending" "position" ];
          separator = "|";
        };
      };
    };
  };
}
