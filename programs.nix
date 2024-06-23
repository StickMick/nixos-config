
{ config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

    krita

    neovim
    jetbrains-toolbox
    git
    gh
    zig
    nodejs
    # dotnet-sdk_8
    # dotnet-runtime_8
    dotnet-sdk_7
    dotnet-runtime_7
    vscode
    xclip
    ripgrep
    gnumake
    wget
    fd

    rustc
    cargo

    gcc
    zip
    unzip

    killall
  ];
}
