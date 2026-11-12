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
3. Install the CLI packages (once):

   ```bash
   cd ~/.dotfiles/dot-config/nix/cli
   nix profile install .#default
   ```

4. To update the CLI packages later, run these commands from the same directory:

   ```bash
   cd ~/.dotfiles/dot-config/nix/cli
   nix flake update nixpkgs
   nix flake check --no-build
   nix profile upgrade 'dot-config/nix/cli'
   ```

   `nix flake update nixpkgs` updates `flake.lock`; skip it if you only changed the package list. `nix profile upgrade` applies the current flake to the installed profile entry. If the upgrade name differs, find it with `nix profile list`. Avoid `--all` unless you want to upgrade every package in your profile.

### Finally

From the `~/.dotfiles` directory, run:
```bash
stow . --dotfiles
```
