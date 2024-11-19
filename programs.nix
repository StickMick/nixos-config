
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


  environment.systemPackages = with pkgs; [
    steam
    discord
    spotify
    obsidian

    runelite

    krita

    neovim
    jetbrains-toolbox
    git
    gh
    zig
    nodejs
    dotnet-sdk_7
    dotnet-runtime_7
    vscode
    xclip
    ripgrep
    gnumake
    wget
    fd
    git-credential-oauth
    lazygit

    android-studio

    gcc
    zip
    unzip

    wezterm

    bambu-studio

    killall

    google-chrome
  ];
}
