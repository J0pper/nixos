{ ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    withPython3 = true;
    withNodeJs = true;
  };
}
