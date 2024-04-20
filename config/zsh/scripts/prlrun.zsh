#!/bin/zsh

# Dependency Parallels Desktop CLI (prlctl)
# Help function to display script usage.
help() {
    echo "Usage: prlrun [--start | --stop]\n"
    echo "Select a VM from the list using the fzf interface.\n"
    echo "  start    Start a selected virtual machine."
    echo "  stop     Stop a selected virtual machine."
}

# Check if help is needed
if [[ "$1" == "--help" ]]; then
    help
    exit 0
fi

# Check for correct usage
if [ "$#" -ne 1 ]; then
    help
    exit 1
fi

action="$1"

# Determine the action to take on the VM
case "$action" in
    --start|--stop)
        vm_action="${action:2}"
        ;;
    *)
        echo "Invalid action. Use --start or --stop."
        exit 1
        ;;
esac

# Function to get VM list and capture the header
get_vms_list() {
    prlctl list -a
}

# Capture header and list data
header=$(get_vms_list | head -n1)
list=$(get_vms_list | tail -n +2)

# Use fzf to let the user select a VM. Extract the ID of the selected VM.
selected_vm=$(echo "$list" | fzf --header="$header" --layout=reverse-list --height 40% --border --margin 20%,10% | awk '{print $1}')

# Check if the user selected a VM
if [ -z "$selected_vm" ]; then
    echo "No VM selected, exiting."
    exit 1
fi

# Start or stop the selected VM using prlctl
prlctl "$vm_action" "$selected_vm"
