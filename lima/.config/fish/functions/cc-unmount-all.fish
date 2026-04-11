function cc-unmount-all --description 'Remove all project mounts from the claude-code Lima VM (keeps ~/.claude)'
    if not limactl list -q 2>/dev/null | grep -qx claude-code
        echo "cc-unmount-all: VM 'claude-code' not found." >&2
        return 1
    end

    echo "→ stopping claude-code..."
    limactl stop claude-code 2>/dev/null

    echo "→ clearing project mounts (keeping ~/.claude)..."
    limactl edit claude-code --tty=false --mount-only="$HOME/.claude:w"; or return $status

    echo "→ starting claude-code..."
    limactl start claude-code
end
