{ self, channel, system, platform, modules, user }:
let
  inputs = channel;
  sudo = "/run/wrappers/bin/sudo";
  username = user;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit user;
    inherit inputs;
    inherit system;
    inherit platform;
    inherit sudo;
  };

  modules = [
    inputs.home-manager.nixosModules.home-manager
  ] ++ modules;
}
