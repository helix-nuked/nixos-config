{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  # TODO please change the username & home directory to your own
  home.username = "helix";
  home.homeDirectory = "/home/helix";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "helix-nuked";
    userEmail = "helix.nuked@proton.me";
    lfs.enable = true;
    extraConfig = {
      credential.helper = "libsecret";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/helix/.ssh/id_ed25519.pub";
    };
  };

  programs = {
    # firefox = {
    #   enable = true;
    #   package = pkgs.firefox-wayland;
    # };

    nh = {
      enable = true;
      # clean.enable = true;
      # clean.extraArgs = "--keep-since 1w";
      # clean.dates = "weekly";
      flake = "/home/helix/nixos-config"; # temporary helix as user cuz i no code
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

      shellAliases = {
        ll = "ls -l";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";

      oh-my-zsh = {
        enable = true;
        plugins = ["git" "aliases"];
        theme = "robbyrussell";
      };
    };

    nixvim = {
      enable = true;
      defaultEditor = true;
      clipboard.providers = {
        wl-copy.enable = true;
      };
    };

    vscode = {
      enable = true;
      extensions = with pkgs; [
        vscode-extensions.eamodio.gitlens
        vscode-extensions.jnoortheen.nix-ide
      ];
    };

    kitty = {
      enable = true;
    };
    btop.enable = true;
    chromium = {
      enable = true;
      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
        {id = "jinjaccalgkegednnccohejagnlnfdag";} # violentmonkey
        {id = "ghmbeldphafepmbegfdlkpapadhbakde";} # proton pass
      ];
    };
  };

  home.packages = with pkgs; [
    tree
    nnn
    neofetch
    nix-output-monitor
    gh
    nvd
    alejandra
    nixd
    nil
    vesktop # Discord
  ];

  programs.starship = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    # allow home-manager to configure hyprland
    enable = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
