{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              size = "512M"; # This should be enough for UEFI boot
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
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
		    ];
	            mountpoint = "/nix";
		  };
                };
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
