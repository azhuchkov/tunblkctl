function numfmt(n, u) {
  if (n < div || length(u) == 1)
    return sprintf("%.2f%s", n, substr(u, 1, 1));

  return numfmt(n / div, substr(u, 2));
}

{
  for (i = 1; i <= NF; i++)
    if ($i ~ /^[0-9]+$/)  
      $i = numfmt($i, "BKMGTPEZY");
 
  print; 
}
