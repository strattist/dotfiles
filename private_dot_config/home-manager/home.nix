{ config, pkgs, lib, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "barnou";
  home.homeDirectory = "/home/barnou";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.age
    pkgs.alacritty
    pkgs.android-tools
    pkgs.arandr
    pkgs.asciinema
    pkgs.ast-grep
    pkgs.atuin
    pkgs.awscli2
    pkgs.bacon
    pkgs.baobab
    pkgs.bash-language-server
    pkgs.bat
    pkgs.bear
    pkgs.binwalk
    pkgs.bitwarden-cli
    pkgs.bpm-tools
    pkgs.brave
    pkgs.brave
    pkgs.ccache
    pkgs.check-jsonschema
    pkgs.chezmoi
    pkgs.llvmPackages_19.clang-tools
    pkgs.cmake-language-server
    pkgs.commitizen
    pkgs.conan
    pkgs.delta
    pkgsUnstable.devenv
    pkgs.direnv
    pkgs.docker
    pkgs.dogdns
    pkgs.doxygen
    pkgs.dust
    pkgs.eza
    pkgs.fd
    pkgs.feh
    pkgs.ffmpeg
    pkgs.flameshot
    pkgs.fortune
    pkgs.fzf
    pkgs.gh
    pkgs.gimp
    pkgs.git
    pkgs.git-lfs
    pkgs.gitui
    pkgs.go
    pkgsUnstable.helix
    pkgs.htop
    pkgs.hyperfine
    pkgs.imagemagick
    pkgs.imhex
    pkgs.inkscape
    pkgs.jrnl
    pkgs.just
    pkgs.lazygit
    pkgs.markdown-oxide
    pkgs.mermaid-cli
    pkgs.most
    pkgs.nerd-fonts.iosevka
    pkgs.nil
    pkgs.ninja
    pkgs.nix-your-shell
    pkgs.nodejs
    pkgs.nushell
    pkgs.obsidian
    pkgs.oh-my-zsh
    pkgs.openvpn
    pkgs.pandoc
    pkgs.patchelf
    pkgs.peek
    pkgs.picocom
    pkgs.poetry
    pkgs.pre-commit
    pkgs.presenterm
    pkgs.rawtherapee
    pkgs.rclone
    pkgs.ripgrep
    pkgs.rofi
    pkgs.ruff
    pkgs.rustup
    pkgs.s3cmd
    pkgs.s4cmd
    pkgs.s5cmd
    pkgs.sct
    pkgs.serpl
    pkgs.shfmt
    pkgs.sox
    pkgs.sshfs
    pkgs.sttr
    pkgs.taplo
    pkgs.taskwarrior3
    pkgs.tinymist
    pkgs.tldr
    pkgs.traceroute
    pkgs.typst
    pkgs.typstyle
    pkgs.unar
    pkgs.uv
    pkgs.valgrind
    pkgs.vlc
    pkgs.vscode-langservers-extracted
    pkgs.vscodium
    pkgs.wgnord
    pkgs.wireguard-tools
    pkgs.xclip
    pkgs.xdg-utils
    pkgs.yaml-language-server
    pkgs.yazi
    pkgs.zathura
    pkgs.zellij
    pkgs.zsync
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  
  home.activation = {
    uv = lib.mkAfter ''
        ${pkgs.uv}/bin/uv tool install cmake@3.28.0 --force
    '';
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/barnou/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
