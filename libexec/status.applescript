tell app "Tunnelblick"
  set cNames to (get name of configurations)
  set cStates to (get state of configurations)
  set cBytesIn to (get bytesIn of configurations)
  set cBytesOut to (get bytesOut of configurations)
  set cAutoconnect to (get autoconnect of configurations)
  
  repeat with i from 1 to count cNames
    log ¬
      (item i of cNames) & "\t" & ¬
      (item i of cStates) & "\t" & ¬
      (item i of cBytesIn) & "\t" & ¬
      (item i of cBytesOut) & "\t" & ¬
      (item i of cAutoconnect)
  end repeat
end tell
