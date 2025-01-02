{ config, pkgs, lib, inputs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "helix";
  home.homeDirectory = "/home/helix";

  imports = [
    <nixvim>.homeManagerModules.nixvim
  ];

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

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "jinjaccalgkegednnccohejagnlnfdag"; } # violentmonkey
    ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
  };

  nixvim.homeManagerModules.nixvim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    tree
    nnn
    neofetch
    nix-output-monitor
    gh
  ];

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
