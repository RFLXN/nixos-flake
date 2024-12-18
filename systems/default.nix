{ user, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networks.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Seoul";

  users.users = {
    "${user}" = {
      home = "/home/${user}";
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
