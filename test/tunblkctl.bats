#!/usr/bin/env bats

setup_file() {
  PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
  TUNBLKCTL_ROOT_PATH="$BATS_TEST_DIRNAME/fakeroot"

  export TUNBLKCTL_ROOT_PATH
}

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  TMP_FILE="$BATS_TEST_TMPDIR/script-args.txt"
  export TMP_FILE
}

assert_usage_print() {
  assert_output -p - <<EOF
Usage: tunblkctl list
       tunblkctl status [--strip] [--no-strip]
       tunblkctl connect [--wait] <VPN>
       tunblkctl disconnect [VPN]
       tunblkctl quit
EOF
}

@test 'usage must be shown if no args' {
  run tunblkctl

  assert_failure
  assert_usage_print
}

@test 'usage must be shown on wrong command' {
  run tunblkctl prepare

  assert_failure
  assert_line 'Unexpected command: prepare'
  assert_usage_print
}

@test 'usage must be shown on "connect" w/o arg' {
  run tunblkctl connect

  assert_failure
  assert_line 'Not enough arguments.'
  assert_usage_print
}

@test "'list' (and 'ls') must return proper list of conf names" {
  for cmd in list ls; do
    run tunblkctl $cmd

    assert_success
    echo -e "cloud vpn\nwork.vpn\nproton" | assert_output -
  done
}

@test "'status --strip' (and 'st') must return correct table" {
  for cmd in status st; do
    run tunblkctl $cmd --strip

    assert_success
    assert_output - <<EOF
cloud vpn	CONNECTED	1024	2048	LAUNCH
work.vpn	EXITING	3072	4096	NO
proton	GET_CONFIG	5120	6144	START
EOF
  done
}

@test "'status --no-strip' (and 'st') must return correct table" {
  GREEN=$(printf "\033[32m")
  YELLOW=$(printf "\033[33m")
  RESET=$(printf "\033[00m")

  for cmd in status st; do
    run tunblkctl $cmd --no-strip

    assert_success
    assert_output - <<EOF
${RESET}VPN        IN     OUT    AUTO${RESET}
${GREEN}cloud vpn  1.00K  2.00K  ✓${RESET}
${RESET}work.vpn   3.00K  4.00K  -${RESET}
${YELLOW}proton     5.00K  6.00K  ✓✓${RESET}
EOF
  done  
}

@test "'connect' (and 'con') must pass through VPN name" {
  for cmd in connect con; do
    run tunblkctl $cmd "fake vpn"
    
    assert_success
    assert_equal "$(cat $TMP_FILE)" "fake vpn"
  done
}

@test "'connect' (and 'con') must pass through the '--wait' flag" {
  for cmd in connect con; do
    run tunblkctl $cmd --wait "fake vpn"

    assert_success
    assert_equal "$(cat $TMP_FILE)" "fake vpn"
  done
}

@test "'disconnect' (and 'dis') must pass through VPN name" {
  for cmd in disconnect dis; do
    run tunblkctl $cmd "fake vpn"

    assert_success
    assert_equal "$(cat $TMP_FILE)" "fake vpn"
  done
}

@test "'disconnect' (and 'dis') must allow empty args list" {
  for cmd in disconnect dis; do
    run tunblkctl $cmd

    assert_success
    assert_equal "$(cat $TMP_FILE)" ""
  done
}

@test "'quit' (and 'q') commands must be accepted" {
  for cmd in quit q; do
    run tunblkctl $cmd

    assert_success
    assert_equal "$(cat $TMP_FILE)" ""
  done
}
