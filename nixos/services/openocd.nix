{ pkgs, ... }:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="0660", GROUP="plugdev", TAG+="uaccess"
  '';

  environment.systemPackages = with pkgs; [
    openocd
    pyocd
  ];
}
