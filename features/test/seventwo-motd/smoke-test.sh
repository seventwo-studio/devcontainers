#!/bin/bash

# Ultra-fast smoke test for CI/CD pipelines
# Completes in <1 second, validates critical functionality only

set -e

source dev-container-features-test-lib

# Single compound check for critical features
check "smoke test" bash -c '
    # Installation check
    [ -f /etc/update-motd.d/50-seventwo ] && [ -x /etc/update-motd.d/50-seventwo ] &&
    
    # Execution check (with timeout)
    timeout 2s /etc/update-motd.d/50-seventwo >/dev/null 2>&1 &&
    
    # Minimal content check (just verify it produces output)
    [ -n "$(/etc/update-motd.d/50-seventwo 2>/dev/null | head -1)" ]
'

reportResults