# Rex configuration and remote Linux hosts

`init.lua` is managed by GNU Stow from this directory and linked to `~/.config/rex/init.lua`. After cloning these dotfiles, run `stow . --dotfiles` from `~/.dotfiles` to link it. Run `rex config check` to validate it. Rex hosts added with `rex hosts add` are stored in Rex's server state, not in `init.lua`; register them separately on a new machine.

Run these commands on the **Mac/client** with Rex installed. Replace `jose`, `newbox.example.com`, and `newbox` with the remote SSH user, address, and desired Rex host label. The SSH user matters: it may differ from the user on your Mac.

```sh
ssh jose@newbox.example.com 'uname -s; uname -m; id -un'
ssh jose@newbox.example.com 'command -v rex || test -x "$HOME/.local/bin/rex"'
```

The second command can fail on a new machine; that just means Rex is not installed yet. Confirm SSH works and verify the host key before continuing.

## Install and register the host

On the Mac/client, run:

```sh
rex server install ssh://jose@newbox.example.com --label newbox
```

This installs Rex for the SSH user in `~/.local/bin` if needed, installs a personal systemd user server, enables lingering so sessions survive logout, and registers the host. It prompts before making changes; use `--yes` only if you intend to approve all changes non-interactively. A normal user install does not require sudo. The Linux host needs systemd for the persistent server setup.

If Rex is already installed on the Linux machine and you prefer to set it up there manually:

```sh
rex server install
```

Then register it on the Mac/client with:

```sh
rex hosts add newbox ssh://jose@newbox.example.com
```

If `rex` is installed but isn't on the remote non-interactive SSH PATH, the client can find it at `~/.local/bin/rex` automatically. To use `rex` by name in an interactive shell too, add `~/.local/bin` to the remote shell's PATH.

## Test from the Mac/client

```sh
ssh jose@newbox.example.com 'if test -x "$HOME/.local/bin/rex"; then "$HOME/.local/bin/rex" version; else rex version; fi'
rex hosts check
rex -S newbox whoami
rex -S newbox ls
```

`rex hosts check` should show `newbox` as reachable, and `whoami` should report the remote account and SSH endpoint. To make and verify a test session (optional):

```sh
rex -S newbox new Test
rex -S newbox ls
```

This leaves a `Test` session on the remote host; close it later with `rex -S newbox kill SESSION_ID` if you don't want to keep it. In Rex for Mac, choose **Add Remote Host…** with `ssh://jose@newbox.example.com` if the host does not already appear, then choose its session.

Troubleshooting: if SSH says `Permission denied`, verify the remote username and SSH key (`ssh jose@newbox.example.com`). If Rex reports it isn't found, check `ssh jose@newbox.example.com 'ls -l ~/.local/bin/rex'` and retry the install. See [Linux installation](https://www.superlogical.com/rex/docs/linux/installation.md) and [remote access over SSH](https://www.superlogical.com/rex/docs/linux/remote-access.md#ssh).
