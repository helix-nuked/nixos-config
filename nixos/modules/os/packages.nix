{ pkgs, ... }
{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    # or my take: $ nh search wget
    environment = {
        systemPackages = with pkgs; [
            git
            vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            wget
            helix
        ];
    };
}