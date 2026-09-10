{ pkgs, ... }:
{
  programs.virt-manager.enable = true;

  boot.kernelModules = [ "kvm-intel" ];

  users.groups.libvirtd.members = [ "jeppe" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
    # spiceUSBRedirection = true;
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
}
