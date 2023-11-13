on run argv
  set failed to 0

  tell app "Tunnelblick"
    repeat with conf in argv
      if not disconnect conf then
        log "Error shutting down configuration: " & conf
        set failed to failed + 1
      end if
    end repeat
  end tell

  if failed > 0 then
    error failed
  end if
end run
