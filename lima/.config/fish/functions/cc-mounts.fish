function cc-mounts --description 'Show host folders currently shared with the claude-code Lima VM'
    set -l cfg "$HOME/.lima/claude-code/lima.yaml"
    if not test -e $cfg
        echo "cc-mounts: VM 'claude-code' has not been created yet." >&2
        return 1
    end
    echo "Mounts for claude-code:"
    awk '
        /^mounts:/       { in_m=1; next }
        in_m && /^[^ -]/ { in_m=0 }
        in_m && /location:/ { gsub(/.*location: */, ""); loc=$0 }
        in_m && /writable:/ { printf "  %s (%s)\n", loc, ($2 == "true" ? "rw" : "ro") }
    ' $cfg
end
