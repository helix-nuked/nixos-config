{ lib, config, ... }:

{
    options = {
        misc.cups.enable =
            lib.mkEnableOption "enables cups";
    };

    config = lib.mkIf config.misc.cups.enable {
        import = ./misc/cups.nix;
    };
}
