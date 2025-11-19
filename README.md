# Steps

1. Install [nix](https://nixos.org/download/)

```sh
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

1. Add Nix unstable packages

```sh
$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
$ nix-channel --update
```

1. Install [home-manager](https://nix-community.github.io/home-manager/index.xhtml)

```sh
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
```

1. Activate the configuration

```sh
$ export NIXPKGS_ALLOW_UNFREE=1
$ home-manager switch --impure
```

1. Connect to Bitwarden vault and save the session

```sh
$ bw login baptiste.arnou@gmail.com
$ bw unlock
$ export BW_SESSION=...
```

1. Get your configuration files with [chezmoi](https://www.chezmoi.io/)

```sh
$ chezmoi init --apply strattist
````

1. Install additional applications

  - [regolith](https://regolith-desktop.com/)
  - [slack](https://slack.com/)
  - [zen-browser](https://zen-browser.app/)
