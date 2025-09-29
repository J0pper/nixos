{config, pkgs, inputs, zen-browser}:
{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
  ]
}
