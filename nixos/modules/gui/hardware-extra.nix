{
    # Hardware Accelerate with VA-API
    hardware = {
        graphics = {
            enable = true;
            extraPackages = with pkgs; [
                intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
                libvdpau-va-gl
            ];
        enable32Bit = true;
        };
    };
}