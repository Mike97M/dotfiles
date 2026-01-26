#!/bin/bash

# ==========================================
# GNOME Configuration Script (Fixes Conflicts)
# ==========================================

echo "------------------------------------------------------------------"
echo "This script will:"
echo "1. REMOVE conflicts: Unbind <Super>1-9 from 'Launch App'."
echo "2. Disable Dynamic Workspaces & Set count to 10."
echo "3. Map <Super>1-0 to Switch Workspaces."
echo "4. Map <Shift><Super>1-0 to Move Windows."
echo "5. Remap Caps->Ctrl and Shift+Shift->CapsToggle."
echo "------------------------------------------------------------------"

read -p "Do you want to proceed? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi

echo ""
echo ">>> Step 1: Removing Conflicting Shortcuts..."
# This is the critical fix. We must clear the default 'Launch App' shortcuts
# so they don't block our workspace shortcuts.
for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done
echo "    - Unbound <Super>1 through <Super>9 from Dock applications."

echo ""
echo ">>> Step 2: Configuring Workspace Behavior..."
# Ensure static workspaces are on
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
echo "    - Workspaces set to Static (10 total)."

echo ""
echo ">>> Step 3: Applying Workspace Shortcuts..."

# Loop for 1-9
for i in {1..9}; do
    # Switch to workspace
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    # Move window to workspace
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

# Handle Workspace 10 (Key 0)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Shift><Super>0']"
echo "    - Workspace shortcuts applied (1-10)."

echo ""
echo ">>> Step 4: Remapping Keyboard Modifiers..."
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps', 'shift:both_capslock']"
echo "    - CapsLock is now Ctrl."
echo "    - Shift+Shift now toggles CapsLock."

echo ""
echo ">>> Step 5: Configuring Window Management Shortcuts..."

# Win+f -> Toggle Maximize (instead of Fullscreen)
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>f']"
echo "    - <Super>f set to Toggle Maximize."
# Win+q -> Close Window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
echo "    - <Super>q set to Close Window."

# Win+w -> Switch windows of the same application (Switch Group)
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>w']"
echo "    - <Super>w set to Switch Windows of Same App."

# Win+Tab -> Switch windows (Restricted to Current Workspace)
# 1. Force the window switcher to ignore windows on other workspaces
gsettings set org.gnome.shell.window-switcher current-workspace-only true
# 2. Bind <Super>Tab to 'switch-windows' (instead of the default 'switch-applications')
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
echo "    - <Super>Tab set to Switch Windows (Current Workspace Only)."
echo ""
echo "------------------------------------------------------------------"
echo "Done. If keys still don't work immediately, log out and back in."
echo "------------------------------------------------------------------"
