{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = (with pkgs; [ tree-sitter ripgrep fd unzip ]);
    plugins =
      (with pkgs.vimPlugins; [ nvim-base16 telescope-nvim nvim-web-devicons ]);
  };

  home.file."nyoom" = {
    source = pkgs.fetchFromGitHub {
      owner = "shaunsingh";
      repo = "nyoom.nvim";
      rev = "ec3faaacb52207e99c54a66e04f5425adb772faa";
      sha256 = "0r3xwrjw07f8n35fb3s9w4kkavsciqwsw408bfi7vdfyax5fxc5x";
    };
    target = ".config/nvim";
    recursive = true;
  };
}

