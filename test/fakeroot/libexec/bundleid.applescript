on run argv
  set tmpfile to system attribute "TMP_FILE"
  do shell script "> " & tmpfile
  repeat with arg in argv
    do shell script "echo " & arg & " >> " & tmpfile
  end repeat
end run
