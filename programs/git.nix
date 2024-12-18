{ user, ... }: {
  home-manager.users.${user} = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "RFLXN";
      userEmail = "solid2113@naver.com";
      ignores = [
        ".idea"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
  };
}
