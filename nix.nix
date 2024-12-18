{ config, pkgs, system, ... }: {
  system = {
    stateVersion = "24.11";
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "*-*-* 04:00:00";  # everyday / 4 AM
      options = "--delete-older-than 30d";
    };

    optimise = {
      automatic = true;
      dates = [ "*-*-* 06:00:00" ]; # = 18:00 KST
    };

    package = pkgs.nix;
  };

  nixpkgs = {
    hostPlatform = system;
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };

  programs = {
    nix-index = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
      enableFishIntegration = false;
    };
  };
}
