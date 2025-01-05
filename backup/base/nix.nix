{
    nix = {
        # Perform garbage collection weekly to maintain low disk usage
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 4d";
        };
        settings = {
            # Optimize storage
            # You can also manually optimize the store via:
            #    nix-store --optimise
            # Refer to the following link for more details:
            # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
            auto-optimise-store = true;
            # Enable the Flakes feature and the accompanying new nix command-line tool
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
    };
}