# Jose's dotfiles

These dotfiles provide a set of configurations and system-wide packages for MacOS & Linux.

---

### First

Clone this repository in your home directory.

### MacOS Setup

1. Follow the instructions at [https://brew.sh](https://brew.sh) to install Homebrew if it is not already installed.
2. Use the `Brewfile` located under `~/.dotfiles/dot-config/homebrew/` to install the necessary packages.

### Linux Setup
1. Follow the instructions at [https://nixos.org/download/#nix-install-linux](https://nixos.org/download/#nix-install-linux) to install Nix with multi-user support.
2. Update `/etc/nix/nix.conf` to enable flakes. Add the following to the config file

   ```bash
   experimental-features = nix-command flakes
   ```
4. Go to `~/.dotfiles/dot-config/nix/bin` and install the packages defined in the `flakes.nix` file, run:
   
   ```bash
   # Replace aarch64-linux with x86_64-linux for x86 machines, for example Intel or AMD
   nix profile install .#packages.aarch64-linux

   ```

5. Optional commands to run:
   ```bash
   # Update packages/binaries versions
   nix flake update

   # Added a new package/binary to the flake
   nix flake upgrade dot-config/nix/bin
   ```
### Finally

From the `~/.dotfiles` directory, run:
```bash
stow . --dotfiles
```
