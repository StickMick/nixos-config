{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { 
      config = { 
        allowUnfree = true; 
      }; 
  };
in 
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
