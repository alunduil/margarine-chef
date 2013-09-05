#!/usr/bin/env bats

@test "margarine is installed" {
	run ls /srv/www/margarine
	[ "$status" -eq 0 ]
}
