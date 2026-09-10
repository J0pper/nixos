{
  # manage power devices
  services.upower.enable = true;

  # manage power modes and CPU frequencies
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # services.power-profiles-daemon.enable = true;
}
