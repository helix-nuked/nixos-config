{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.helix = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "video" "audio" ]; # Enable ‘sudo’ for the user.
        # Use home-manager for packages
    };
}