{
  for (i = 1; i <= NF; i++)
    if ($i ~ /^[0-9]+$/)
      $i = (++c ".00K") 
  print;
}
