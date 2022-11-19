{ config, pkgs, lib, ... }:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ python pip ]);
    extraPackages = (with pkgs; [
      sumneko-lua-language-server
      wget
      ripgrep
      fd
      unzip
      tree-sitter
      luajitPackages.luarocks
      cmake
    ]);
    plugins = (with pkgs.vimPlugins; [ packer-nvim nvim-ts-rainbow ])
      ++ (with pkgs.master.vimPlugins; [ nvim-treesitter.withAllGrammars ]);

  };
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;

  home.file = {
    nvim_lua = {
      recursive = true;
      source = ./nvim/lua;
      target = "/.config/nvim/lua";
    };
  };

  home.file = {
    startify_custom = {
      source = ./nvim/lua/alpha/themes/startify_custom.lua;
      target = "/.config/nvim/lua/alpha/themes/startify_custom.lua";
    };
  };

}
