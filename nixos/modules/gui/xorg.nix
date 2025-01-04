{
    services = {
        # Enable the X11 windowing system.
        xserver.enable = true;
        xserver.videoDrivers = [ "modesetting" ]; # TODO Try modesetting vs intel on ivy bridge
    };
    # Configure keymap in X11
    services.xserver.xkb.layout = "us";
    # services.xserver.xkb.options = "eurosign:e,caps:escape";
}