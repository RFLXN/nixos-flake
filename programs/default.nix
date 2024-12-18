{ ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./docker.nix
    ./shells
  ];
}
