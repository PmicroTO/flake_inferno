{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPython3Packages = (ps: with ps; [ python-lsp-server ]);
    extraPackages = (with pkgs; [ tree-sitter ripgrep fd unzip ]);
    plugins = (with pkgs.vimPlugins; [
      nvim-base16
      telescope-nvim
      nvim-web-devicons
      hydra-nvim
      vim-nix
    ]);
  };
}

