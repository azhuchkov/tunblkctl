--
-- Arguments: list of VPN configurations names
--
on run argv
  tell app "Tunnelblick"
    repeat with conf in argv
      get state of first configuration where name = conf
      repeat until {"CONNECTED", "EXITING"} contains result
          delay 0.1
          get state of first configuration where name = conf
      end repeat
    end repeat
  end tell
end run
