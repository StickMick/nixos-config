
{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { 
      config = { 
        allowUnfree = true; 
      }; 
  };
in 
{
  
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config.credential.helper = "libsecret";
  };

  environment.systemPackages = with pkgs; [
    steam
    discord
    spotify
    obsidian
    krita
    gcc
    zip
    unzip
    bambu-studio
    unityhub

    lutris
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
      extraPkgs = pkgs: [
        # List package dependencies here
      ];
    })
    wine

    #Terminal
    ghostty
    tmux

    #System Monitor
    btop
    nvtopPackages.full

    #git
    git
    libsecret
  ];
}
