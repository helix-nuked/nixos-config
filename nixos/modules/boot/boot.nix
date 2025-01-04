{
    # Boot section
    boot = {
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            grub = {
                enable = true;
                device = "nodev";
                efiSupport = true;
                useOSProber = true;
                # Limit the number of generations to keep
                configurationLimit = 10;
            };
        efi.canTouchEfiVariables = true;
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "udev.log_priority=3"
        "resume=UUID=\"a2497304-6055-4c9a-a5a2-afba9721eefe\""
    ];
  };
}