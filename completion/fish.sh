# Define subcommands list
set -l commands list status connect disconnect quit

# Disable filesystem completions
complete -c tunblkctl --no-files

# Complete commands
complete -c tunblkctl --condition "not __fish_seen_subcommand_from $commands" \
  -a "$commands"

# Complete VPN names
complete -c tunblkctl --condition "__fish_seen_subcommand_from connect disconnect" \
    -a "(tunblkctl list)"

# Complete wait option
complete -c tunblkctl --condition "__fish_seen_subcommand_from connect" \
    -l 'wait' -d 'Wait for the connection to be established.'

# Complete strip option
complete -c tunblkctl --condition "__fish_seen_subcommand_from status" \
    -l strip -d 'Strip output formatting (raw mode)'

# Complete no-strip option
complete -c tunblkctl --condition "__fish_seen_subcommand_from status" \
    -l no-strip -d 'Do not strip output formatting (human mode)'
