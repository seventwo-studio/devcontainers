#!/bin/bash
# Test removed - feature no longer supports custom logos

set -e

source dev-container-features-test-lib

# Basic functionality test since custom logos are no longer supported
check "motd script exists" test -f /etc/update-motd.d/50-seventwo
check "motd script is executable" test -x /etc/update-motd.d/50-seventwo
check "config file exists" test -f /etc/seventwo/motd.conf
check "motd runs successfully" bash -c "/etc/update-motd.d/50-seventwo >/dev/null 2>&1"

reportResults