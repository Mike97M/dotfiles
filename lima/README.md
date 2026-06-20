# Lima VM for Claude Code

Isolated openSUSE Tumbleweed VM for running [Claude Code](https://claude.ai/code) via [Lima](https://lima-vm.io/).

## Setup

```bash
# from ~/dotfiles
stow lima
```

This creates:
- `~/lima-specs/claude-code.yaml` — Lima VM spec
- `~/.config/fish/functions/cc*.fish` — fish helper functions

### Prerequisites

```bash
# Lima + QEMU + UEFI firmware
sudo zypper install lima qemu qemu-ovmf-x86_64
```

### Create the VM (one-time)

```bash
limactl start --name=claude-code ~/lima-specs/claude-code.yaml
```

First boot takes a few minutes (installs packages, Claude Code, uv).
Subsequent starts take ~25-30 seconds.

## Fish commands

| Command | Description |
|---|---|
| `cc` | Run Claude Code inside the VM from your current directory |
| `cc-mount <path> [...]` | Add host folders to the VM (appends to existing mounts) |
| `cc-mount --replace <path> [...]` | Replace all mounts with the given folders |
| `cc-mounts` | List currently mounted folders |
| `cc-unmount-all` | Remove all mounts |

## Typical workflow

```fish
# mount your project(s)
cc-mount ~/Developement/my-project

# run claude code from the project dir
cd ~/Developement/my-project
cc

# add another project later without losing the first
cc-mount ~/Developement/another-project
```

## What's installed in the VM

- **Tools:** git, curl, ripgrep, jq, gh, fd, fzf, tmux, vim
- **Runtimes:** Python 3 + pip + virtualenv, Node.js + npm, uv
- **Dev:** gcc, g++, make, pkgconf
- **Claude Code:** installed via official installer

## Notes

- The host `~/.claude` is shared into the VM, so Claude Code history, settings,
  memory, agents, and projects persist even after you delete and rebuild the
  image — only auth/cache/sessions stay VM-local to avoid oauth conflicts
- VM uses openSUSE Tumbleweed (rolling release) with SELinux enforcing
- `mountType: virtiofs` is used (experimental on Linux, but fast)
- UEFI firmware points to `/usr/share/qemu/ovmf-x86_64-4m.bin` (openSUSE-specific path)
- No project folders are shared by default — mount them explicitly with `cc-mount`
- SSH agent forwarding is disabled for security
- Ports opened inside the VM (≥1024) are forwarded to `127.0.0.1` on the host
  automatically by Lima's default dynamic forwarding — a dev server on `:3000`
  in the VM is `http://127.0.0.1:3000` on the host. Add a `portForwards`
  section to the spec only if you need to expose ports to the LAN.
