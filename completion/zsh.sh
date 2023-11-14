#compdef tunblkctl

_tunblkctl() {
  local -a subcmds
  local curcontext="$curcontext" state line

  _arguments -C \
    '1: :->cmd' \
    '*:: :->args'

  case $state in
    cmd)
      subcmds=(
        'list:List all VPN connections'
        'status:Show the status of the VPN connections'
        'connect:Connect to a VPN'
        'disconnect:Disconnect from VPN(s)'
        'quit:Quit Tunnelblick'
      )
      _describe 'command' subcmds
      ;;
    args)
      case ${words[1]} in
        status)
          _arguments \
            '(:)--strip[strip output]' \
            '(:)--no-strip[do not strip output]'
          ;;
        connect)
          _arguments \
            '--wait[wait for the connection up]' \
            ':VPN:_tunblkctl_vpn'
          ;;
        disconnect)
          _arguments \
            ':VPN:_tunblkctl_vpn'
          ;;
      esac
      ;;
  esac
}

# Function to get VPN names from 'tunblkctl list'
_tunblkctl_vpn() {
  local -a vpns
  vpns=("${(@f)$(tunblkctl list)}")
  _describe -t vpns 'VPN' vpns
}

_tunblkctl "$@"

