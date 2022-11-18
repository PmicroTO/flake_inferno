{ config
, pkgs
, lib
, ...
}:
with lib; let
  cfg = config.nyoom;
  nyoom = pkgs.fetchFromGitHub {
    owner = "shaunsingh";
    repo = "nyoom.nvim";
    rev = "ec3faaacb52207e99c54a66e04f5425adb772faa";
    sha256 = "0r3xwrjw07f8n35fb3s9w4kkavsciqwsw408bfi7vdfyax5fxc5x";
  };
in
{
  options.nyoom = {
    enable = mkOption {
      default = false;
      description = "Enable AstronVim";
      type = types.bool;
    };

    userConfig = mkOption {
      default = null;
      description = "AstronVim User Config";
      type = with types; nullOr path;
    };
  };
  config = mkIf (cfg.enable) {
    home = {
      file = {
        ".config/nvim" = {
          recursive = true;
          source = nyoom;
        };
        ".config/nvim/init.lua" = mkIf (cfg.userConfig != null) {
          source = mkForce (cfg.userConfig);
        };
      };
    };
  };
}
