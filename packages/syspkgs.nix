{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # git
    git
    git-lfs
    gh

    # zsh
    zsh
    zsh-powerlevel10k

    # docker
    docker
    docker-client

    # default tools
    file
    hostname
    tree
    wget
    curl

    # editors
    vim
    nano

    # networking
    inetutils

    # utils
    bashInteractive
    bzip2
    coreutils-full
    cpio
    curl
    diffutils
    findutils
    gawk
    stdenv.cc.libc
    getent
    getconf
    gnugrep
    gnupatch
    gnused
    gnutar
    gzip
    xz
    less
    ncurses
    netcat
    openssh
    procps
    time
    util-linux
    which
    zstd
  ];
}
