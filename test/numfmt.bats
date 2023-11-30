#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  AWK_PROGRAM="$BATS_FILE_TMPDIR/bytes.awk"

  echo '{print numfmt($0)}' > "$AWK_PROGRAM"

  COMMAND="awk -f $BATS_TEST_DIRNAME/../libexec/numfmt.awk -f $AWK_PROGRAM"
}

run_numbers_format() {
  run $COMMAND -v div=$1 <<EOF
0
1000
1023
1024
1026
1000000
1048576
1000000000
1073741824
1000000000000
1099511627776
EOF
}

@test "IEC formatting" {
  run_numbers_format 1024

  assert_success
  assert_output - <<EOF
0.00B
1000.00B
1023.00B
1.00K
1.00K
976.56K
1.00M
953.67M
1.00G
931.32G
1.00T
EOF
}

@test "SI formatting" {
  run_numbers_format 1000

  assert_success
  assert_output - <<EOF
0.00B
1.00K
1.02K
1.02K
1.03K
1.00M
1.05M
1.00G
1.07G
1.00T
1.10T
EOF
}
