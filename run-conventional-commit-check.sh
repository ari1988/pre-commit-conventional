#!/usr/bin/env bash

# Color coding
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
RESET="\033[0m"

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


echo -e "${RED}The commit message does not meet the Conventional Commit standard${RESET}"
echo -e "${YELLOW}Format for a valid commit message is:${RESET}"
echo -e "  ${GREEN}<type>: [Ticket Number] <description>${RESET}"
echo -e "${YELLOW}An example of a valid message is:${RESET}"
echo -e "  ${GREEN}feat: [AURA2-123] initial draft${RESET}"
echo -e "${YELLOW}More details at: https://www.conventionalcommits.org/en/v1.0.0/#summary${RESET}"
exit 1
