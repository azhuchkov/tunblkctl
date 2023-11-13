on run argv
  set failed to 0

  tell app "Tunnelblick"
    repeat with arg in argv
      if not connect arg then
        log "Error establishing connection: " & arg
        set failed to failed + 1
      end if
    end repeat
  end tell

  if failed > 0 then
    error failed
  end if
end run
