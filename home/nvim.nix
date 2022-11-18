{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = (with pkgs; [ tree-sitter ripgrep fd unzip ]);
    plugins = (with pkgs.vimPlugins; [
      packer
    ]);
  };


  home.file = {
    nvim_lua = {
      recursive = true;
      source = ./nvim/lua;
      target = /.config/nvim/lua;

    };


  };

}
