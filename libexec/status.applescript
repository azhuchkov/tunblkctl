tell app "Tunnelblick"
  set confs to {}

  -- convert data for easier access
  repeat with i from 1 to count (get name of configurations)
    copy { ¬
      name: (item i of (get name of configurations)), ¬
      state: (item i of (get state of configurations)), ¬
      bytesIn: (item i of (get bytesIn of configurations)), ¬
      bytesOut: (item i of (get bytesOut of configurations)), ¬
      autoconnect: (item i of (get autoconnect of configurations)) ¬
    } to end of confs
  end repeat

  repeat with conf in confs
    log ¬
      (name of conf) & "\t" & ¬
      (state of conf) & "\t" & ¬
      (bytesIn of conf) & "\t" & ¬
      (bytesOut of conf) & "\t" & ¬
      (autoconnect of conf)
  end repeat
end tell
