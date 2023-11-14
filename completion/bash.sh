_tunblkctl() {
    local cur prev cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmds="list status connect disconnect quit"

    # Function to handle VPN names and escaping special characters
    _vpn_names() {
        local IFS=$'\n'
        compgen -W "$(tunblkctl list | sed -e 's/[^[:alnum:][:space:]\.-]/\\\\&/g')" -- "$cur"
    }

    case "${COMP_WORDS[1]}" in
        connect|disconnect)
            if [[ ${cur} != -* ]]; then
                COMPREPLY=( $(_vpn_names) )
            fi
            ;;
        status)
            if [[ $COMP_CWORD -eq 2 ]]; then
                COMPREPLY=( $(compgen -W "--strip --no-strip" -- ${cur}) )
            fi
            ;;
    esac

    if [[ ${COMP_CWORD} -eq 1 ]] ; then
        COMPREPLY=( $(compgen -W "${cmds}" -- ${cur}) )
    fi

    # Specific option handling for 'connect' command
    if [[ ${COMP_WORDS[1]} == "connect" && ${COMP_CWORD} -eq 2 ]] ; then
        COMPREPLY+=( $(compgen -W "--wait" -- ${cur}) )
    fi

    return 0
}

complete -F _tunblkctl tunblkctl

