{ user, lib, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user} = {
      home.stateVersion = "24.05";
      programs = {
        home-manager.enable = true;
      };
    };
  };
}
