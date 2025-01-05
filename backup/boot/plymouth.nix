{
    plymouth = {
        enable = true;
        theme = "pixels";
        themePackages = with pkgs; [
            # By default we would install all themes
            (adi1090x-plymouth-themes.override {
                selected_themes = [ "pixels" ];
            })
        ];
    };
}