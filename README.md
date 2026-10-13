# Jose's dotfiles

### First

Clone this repository in your home directory.

### MacOS Setup

1. Follow the instructions at [https://brew.sh](https://brew.sh) to install Homebrew if it is not already installed.
2. Install the packages in the Brewfile:

   ```bash
   brew bundle --file ~/.dotfiles/dot-config/homebrew/Brewfile
   ```

### Linux Setup
1. Follow the instructions at [https://nixos.org/download/#nix-install-linux](https://nixos.org/download/#nix-install-linux) to install Nix with multi-user support.
2. Enable flakes in `/etc/nix/nix.conf`:

   ```conf
   experimental-features = nix-command flakes
   ```
3. From `~/.dotfiles/dot-config/nix/bin`, install the packages in `flake.nix`:

   ```bash
   # Use aarch64-linux instead on ARM machines.
   nix profile install .#packages.x86_64-linux
   ```

   After committing changes to the flake, update the installed profile with `nix profile upgrade --all` (this upgrades every package in your Nix profile). To update versions in `flake.lock`, run `nix flake update` separately.
### Finally

From the `~/.dotfiles` directory, run:
```bash
stow . --dotfiles
```
