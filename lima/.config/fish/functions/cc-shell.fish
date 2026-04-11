function cc-shell --description 'Open a fish shell inside the claude-code Lima VM'
    if test -f .venv/bin/activate.fish
        limactl shell claude-code -- fish -C "source .venv/bin/activate.fish" $argv
    else if test -f venv/bin/activate.fish
        limactl shell claude-code -- fish -C "source venv/bin/activate.fish" $argv
    else
        limactl shell claude-code -- fish $argv
    end
end
