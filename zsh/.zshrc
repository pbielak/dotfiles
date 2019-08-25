NIXOS_BINARIES_ROOT="/run/current-system/sw/bin/"

alias vim="${NIXOS_BINARIES_ROOT}/vim -u ~/.vim/configs/.baserc"
alias ssh="${NIXOS_BINARIES_ROOT}/ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

function run_nix_shell {
  NIXPKGS_ALLOW_UNFREE=1 NIX_SHELL_NAME="${1}" nix-shell -p ${@:2} --run zsh
}

alias zoom-env="run_nix_shell zoom-env zoom-us"
alias vpn-env="run_nix_shell vpn-env openvpn"
alias k8s-env="run_nix_shell k8s-env kubernetes-helm kubectl"

alias py-env="${HOME}/nix-envs/result/bin/py"


export VIRTUAL_ENV_DISABLE_PROMPT=

if [[ -n "${NIX_SHELL_NAME}" ]]; then
  export PS1="(${NIX_SHELL_NAME}) $PS1"
fi
