#!/usr/bin/env bats

@test "spread is installed" {
	run ls /srv/www/margarine
	[ "$status" -eq 0 ]
}
