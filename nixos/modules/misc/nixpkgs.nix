{ pkgs, ... }:
{
    nixpkgs = {
        config = {
            allowUnfree = true;
            packageOverrides = pkgs: {
                intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
            };
        };
    };
}