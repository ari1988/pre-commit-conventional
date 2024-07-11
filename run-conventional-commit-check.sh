#!/usr/bin/env bash

# Create a regex for a conventional commit.
convetional_commit_regex="^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test): \[([A-Z0-9]+[\-][0-9]+)\] .+$"

# Get the commit message (the parameter we're given is just the path to the
# temporary file which holds the message).
commit_message=$(cat "$1")

# Check the message, if we match, all good baby.
if [[ "$commit_message" =~ $convetional_commit_regex ]]; then
  echo -e "Commit message meets Conventional Commit standards..."
  exit 0
fi

# this is not a conventional commit, show an example and link to the specs.
echo -e "The commit message does not meet the Conventional Commit standard "
echo "Format for a valid commit message is: "
echo "  <type>: [Ticket Number] <description>"
echo "An example of a valid message is: "
echo "  feat: [AURA2-123] initial draft"
echo "More details at: https://www.conventionalcommits.org/en/v1.0.0/#summary"
exit 1