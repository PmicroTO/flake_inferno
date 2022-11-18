{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = (with pkgs; [ wget ripgrep fd unzip tree-sitter ]);
    plugins = (with pkgs.vimPlugins; [

      packer-nvim

      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

    ]);

  };
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;

  home.file = {
    nvim_lua = {
      recursive = true;
      source = ./nvim/lua;
      target = "/.config/nvim/lua";

    };

  };

}
