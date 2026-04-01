#!/usr/bin/env bash
set -e

# Remove any existing API key (to demo the login flow)
rm .git/info/*.bazelrc || true
git config --local --unset buildbuddy.api-key || true

# Try a build (should trigger the login flow)
bazelisk build //...

