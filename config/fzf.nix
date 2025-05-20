{pkgs, ...}: {
  programs.fzf = {
    enable = true;
    package = pkgs.fzf.overrideAttrs (oldAttrs: {
      postInstall =
        oldAttrs.postInstall
        + ''
          install bin/fzf-preview.sh $out/bin
        '';
    });
    defaultOptions = [
      "--height=60%"
      "--tmux=bottom,60%"
      "--layout=reverse"
      "--border=top"
      "--style=minimal"
      "--info='inline-right'"
    ];
  };
}
