#!/bin/bash

# Exit immediately if a command exits with a non-zero status
# set -e

# Default to mtthwcmpbll if GITHUB_ORG is not set
GITHUB_ORG=${GITHUB_ORG:-mtthwcmpbll}

# Define the list of repositories (just the name)
repositories=(
  "example-ecom-common"
  "example-ecom-security"
  "example-ecom-rest-client"
  "example-ecom-product-service"
  "example-ecom-customer-service"
  "example-ecom-order-service"
  "example-ecom-inventory-service"
  "example-ecom-notification-service"
  "example-ecom-kyc-service"
  "example-ecom-risk-score-service"
  "example-ecom-fraud-detection-service"
)

# Check if arguments are provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <git_command_arguments>"
  exit 1
fi

get_repo_path() {
    local repo_name="$1"
    local flat_path="${WORKSPACE}/${GITHUB_ORG}/${repo_name}"

    if [ -d "$flat_path" ]; then
        echo "$flat_path"
        return 0
    fi

    # Check for nested wave structure (e.g. Workspace/Wave1/$GITHUB_ORG/$repo_name)
    # matching any immediate subdirectory of WORKSPACE
    local nested_paths=( "${WORKSPACE}"/*/"${GITHUB_ORG}/${repo_name}" )
    
    # Check if the glob expanded to an existing directory
    if [ -d "${nested_paths[0]}" ]; then
        echo "${nested_paths[0]}"
        return 0
    fi

    echo ""
    return 1
}

# Loop through each repository and run the git command
for repo in "${repositories[@]}"; do
  full_path=$(get_repo_path "$repo")
  
  if [ -n "$full_path" ]; then
    echo "Running 'git $*' in $full_path..."
    (
        cd "$full_path"
        git "$@"
    )
  else
    echo "Warning: Repository $repo not found in workspace."
  fi
done