function bytes_col(n) {
  return NR > 1 ? numfmt(n) : n;
}
 
function print_row(color) {
  printf "%s%s\t%s\t%s\t%s%s\n", color, $1, bytes_col($3), bytes_col($4), $5, reset 
}

BEGIN {
  green  = "\033[32m";
  yellow = "\033[33m";
  reset  = "\033[00m";
}

NR == 1 {
  print_row(reset);
}

NR > 1 {
  if ($2 == "CONNECTED")
    color = green;
  else if ($2 == "EXITING")
    color = reset;
  else
    color = yellow;

  if ($5 == "START")
    $5 = "✓✓"
  else if ($5 == "LAUNCH")
    $5 = "✓"
  else
    $5 = "-"

  print_row(color);
}
