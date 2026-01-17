# Agent Guidelines for this Repository

This repository contains dotfiles managed with **GNU Stow**, supporting both **MacOS** (via Homebrew) and **Linux** (via Nix).
Agents operating here should treat this as a configuration repository, prioritizing idempotency, cross-platform compatibility, and clean organization.

## 1. Build, Install & Test Commands

Since this is a configuration repo, "building" equates to installing and linking configuration files.

### Installation
- **Linking Configurations (Stow):**
  This is the primary deployment method.
  ```bash
  cd /home/jose/.dotfiles && stow . --dotfiles
  ```
  *Note: Always run stow from the repo root.*

- **MacOS Package Install:**
  ```bash
  brew bundle --file /home/jose/.dotfiles/dot-config/homebrew/Brewfile
  ```

- **Linux (Nix) Package Install:**
  ```bash
  # Check system architecture first (uname -m)
  # For x86_64:
  nix profile install .#packages.x86_64-linux
  # For aarch64:
  nix profile install .#packages.aarch64-linux
  ```

### Verification & Testing
There is no unified test runner. Use tool-specific checks to verify changes.

- **Nix Configuration:**
  Verify the flake syntax and outputs.
  ```bash
  nix flake check /home/jose/.dotfiles/dot-config/nix/bin/
  ```

- **Zsh Configuration:**
  Check script syntax without executing.
  ```bash
  zsh -n /home/jose/.dotfiles/dot-zshrc
  ```

- **Neovim (Lua):**
  Ensure Lua syntax is valid. If possible, open nvim headless to check for startup errors.
  ```bash
  nvim --headless -c "qa"
  ```

## 2. Code Style & Conventions

### General Principles
- **Indentation:** Use **2 spaces** for all files (Lua, Nix, JSON, YAML, etc.) unless a specific format mandates tabs (e.g., Makefiles).
- **Paths:** Always use **absolute paths** when reading/writing files via tools.
- **Comments:** Explain *why*, not *what*. Document weird hacks or OS-specific workarounds.
- **Safety:** Do not use `rm -rf` without explicit user confirmation and double-checking the path.

### Shell Scripts (Zsh/Bash)
- **Files:** `dot-zshrc`, `dot-aliases`, scripts in `dot-config/tmux/scripts/`.
- **Shebang:** Always include `#!/bin/zsh` or `#!/bin/bash`.
- **Cross-Platform:** Detect OS for logic that differs between macOS and Linux.
  ```bash
  if [[ "$(uname -s)" == "Darwin" ]]; then
    # MacOS specific
  else
    # Linux specific
  fi
  ```
- **Variables:**
  - Exported vars: `UPPER_CASE` (e.g., `export EDITOR="nvim"`)
  - Local vars: `snake_case` (e.g., `local file_path="..."`)
- **Quoting:** Aggressive quoting to handle filenames with spaces.
  - Good: `rm "$file_path"`
  - Bad: `rm $file_path`
- **Functions:** Use `function_name() { ... }` syntax.

### Nix (`flake.nix` & `*.nix`)
- **Formatting:** Follow standard Nix formatting guidelines.
- **Organization:** Keep `flake.nix` readable. Group packages by category (e.g., "Core CLI", "SWE Tooling").
- **Immutability:** Do not manually edit `flake.lock`. Let `nix flake update` handle it.

### Lua (Neovim Config)
- **Location:** `dot-config/jfmdnvim/`
- **Formatting:** 2 spaces. Ensure `vim: ts=2 sts=2 sw=2 et` modeline is respected/present if editing new files.
- **Variables:**
  - Prefer `local` for everything.
  - Use `vim.g` only for plugin configuration variables that require it.
- **Modules:** Keep `init.lua` high-level. Logic should go into `lua/` subdirectories.
- **Keymaps:** Use `vim.keymap.set`. Always provide a `{ desc = "..." }` field for `which-key` integration.
  ```lua
  vim.keymap.set("n", "<leader>x", my_func, { desc = "Execute my function" })
  ```

### Configuration Files (Kitty, Tmux)
- **Kitty:** Use `{{{` and `}}}` markers for section folding.
- **Tmux:** Use standard `set-option` syntax. Document keybind changes clearly.

## 3. Tool Usage Rules for Agents

- **File Operations:**
  - NEVER use `sed -i`. Read the file, modify the content in memory, and use the `Write` tool.
  - When editing `dot-config` files, remember they are symlinked. Modifying the file in `.dotfiles` is correct.

- **Command Execution:**
  - Use `workdir="/home/jose/.dotfiles"` for git operations.
  - Do not run interactive commands (like `vim`, `top`, `less`). Use `cat`, `head`, `grep` instead.

- **Error Handling:**
  - If a `stow` command fails, it often means a conflict exists. Check if the target file already exists (and is not a symlink) before forcing.
  - When editing critical config (like `.zshrc`), try to verify syntax (`zsh -n`) before confirming the task.

## 4. Cursor/Copilot Rules

*No specific `.cursorrules` or `.github/copilot-instructions.md` were found in this repository.*
*Agents should rely primarily on the conventions defined in this file.*
