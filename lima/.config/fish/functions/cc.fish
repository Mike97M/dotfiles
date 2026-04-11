function cc --description 'Run claude code inside the Lima VM in the current directory'
    set -l activate ""
    if test -f .venv/bin/activate
        set activate "source .venv/bin/activate &&"
    else if test -f venv/bin/activate
        set activate "source venv/bin/activate &&"
    end
    limactl shell claude-code -- bash -c "$activate claude --dangerously-skip-permissions $argv"
end
