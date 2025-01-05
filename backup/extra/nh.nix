{ user, ... }: {
    programs.nh = {
        enable = true;
        # clean.enable = true;
        # clean.extraArgs = "--keep-since 1w;
        # clean.dates = "weekly";
        flake = "/home/${user}/nixos-config";
    };
}