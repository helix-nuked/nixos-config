{ pkgs, ... }:
{
    programs = {
        hyprland = {
            # Install the packages from nixpkgs
            enable = true;
            # Whether to enable XWayland
            xwayland.enable = true;
            package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };
  };
}