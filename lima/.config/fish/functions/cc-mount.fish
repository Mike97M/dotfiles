function cc-mount --description 'Add one or more host folders to the claude-code Lima VM (keeps existing mounts)'
    if test (count $argv) -eq 0
        echo "usage: cc-mount <path> [<path> ...]       add mounts (keeps existing)" >&2
        echo "       cc-mount --replace <path> [...]    replace all mounts" >&2
        echo "       cc-unmount-all                     remove all mounts" >&2
        echo "       cc-mounts                          list current mounts" >&2
        return 2
    end

    # Check for --replace flag
    set -l replace false
    set -l paths
    for arg in $argv
        if test "$arg" = --replace
            set replace true
        else
            set -a paths $arg
        end
    end

    if test (count $paths) -eq 0
        echo "cc-mount: no paths specified" >&2
        return 2
    end

    # VM must exist already
    if not limactl list -q 2>/dev/null | grep -qx claude-code
        echo "cc-mount: VM 'claude-code' not found. Create it first:" >&2
        echo "  limactl start --name=claude-code ~/lima-specs/claude-code.yaml" >&2
        return 1
    end

    # Validate + resolve every path BEFORE touching the VM
    set -l resolved
    for p in $paths
        if not test -e $p
            echo "cc-mount: path does not exist: $p" >&2
            return 1
        end
        set -a resolved (realpath $p)
    end

    echo "→ stopping claude-code..."
    limactl stop claude-code 2>/dev/null

    set -l mount_flags
    if test "$replace" = true
        echo "→ replacing project mounts with (keeping ~/.claude):"
        # Always preserve ~/.claude mount
        set -a mount_flags --mount-only="$HOME/.claude:w"
        for p in $resolved
            echo "    $p"
            set -a mount_flags --mount-only="$p:w"
        end
    else
        echo "→ adding mounts:"
        for p in $resolved
            echo "    $p"
            set -a mount_flags --mount="$p:w"
        end
    end

    limactl edit claude-code --tty=false $mount_flags; or return $status

    echo "→ starting claude-code..."
    limactl start claude-code
end
