function numfmt0(n, u) {
  if (n < div || length(u) == 1)
    return sprintf("%.2f%s", n, substr(u, 1, 1));

  return numfmt0(n / div, substr(u, 2));
}

function numfmt(n) {
  if (n ~ /^[0-9]+$/)
    return numfmt0(n, "BKMGTPEZY");

  return n;
}
