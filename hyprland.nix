
{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "acpi_rev_override" "mem_sleep_default=deep" "intel_iommu=igfx_off" "nvidia-drm.modeset=1" ];
    kernelPackages = pkgs.linuxPackages_5_4;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";

  security.pam.services.sddm.enableKwallet = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    WLR_DRM_NO_ATOMIC = "1";
  };

  security.pam.services.hyprlock = {
  };

  programs.xfconf.enable = true;
  programs.thunar.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    swww
    kitty
    rofi-wayland
    networkmanagerapplet

    # Wallpaper and colour
    pywal
    python3

    # Screenshots
    hyprshot

    # Lock Screen
    hyprlock

    # Idle timeout
    hypridle

  ];
}
