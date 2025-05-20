{
  pkgs,
  nixgl,
  ...
}: {
  imports = [
    ./config/fzf.nix
    ./config/git.nix
    ./config/kitty.nix
    ./config/nvf.nix
    ./config/zsh.nix
  ];

  nixGL.packages = import nixgl {inherit pkgs;};
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = ["mesa"];

  home.username = "sahin";
  home.homeDirectory = "/home/sahin";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    bat
    diff-so-fancy
    eza
    lazydocker
    lazygit
    ripgrep
    zsh-forgit
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
  };

  home.shell.enableShellIntegration = true;

  programs.home-manager.enable = true;
}
