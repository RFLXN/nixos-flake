{ user, sudo, ... }:
let
  sourcePath = "~${user}/nix/programs/shells";
  targetPath = "~${user}";
  mkSymlink = filename: ''
    ${sudo} -u ${user} ln -sf ${sourcePath}/${filename} ${targetPath}/${filename}
  '';
in {
  system.activationScripts = {
    postUserActivation = {
      text = ''
        mkdir -p ${targetPath}
        ${mkSymlink ".p10k.zsh"}
      '';
    };
  };
}
