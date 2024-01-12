# Hacking

## Generate user manual for wiki in GHM format

`$ pandoc --from=man --to=gfm < doc/man1/tunblkctl.1 | sed 's/^# /## /' | pbcopy`
