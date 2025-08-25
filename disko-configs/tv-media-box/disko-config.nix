{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            ESP = {
              priority = 1;
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition

                subvolumes = {
                  
                  "/root" = {
                    mountpoint = "/";
                  };

                  "/home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };

                  "/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                  };

                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap = {
                      swapfile.size = "12G";
                    };
                  };
                };
                
                mountpoint = "/partition-root";
                swap = {
                  swapfile = {
                    size = "12G";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
