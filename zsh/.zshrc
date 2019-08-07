NIXOS_BINARIES_ROOT="/run/current-system/sw/bin/"

alias vim="$NIXOS_BINARIES_ROOT/vim -u ~/.vim/configs/.baserc"
alias ssh="$NIXOS_BINARIES_ROOT/ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
