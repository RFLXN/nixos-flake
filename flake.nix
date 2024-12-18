{
  description = "RFLXN's nixos flake";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager-stable.url = "github:nix-community/home-manager/release-24.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ self, ... }: let
    stable = {
      inherit self;
      channel = "stable";
      nixpkgs = inputs.nixpkgs-stable;
      home-manager = inputs.home-manager-stable;
    };

    profile = {
      inherit self;
      user = "solid2113";
      channel = stable;
      platform = "linux";
      system = "x86_64-linux";
      modules = [
        ./nix.nix
        ./home-manager.nix
        ./packages
        ./programs
        ./systems
      ];
    };

    nixosSystem = import ./nixosSystem.nix;
  in {
    nixosConfigurations.RFLXN-SERVER = nixosSystem profile;
    nixosPackages = (nixosSystem profile).pkgs;
  };
}
