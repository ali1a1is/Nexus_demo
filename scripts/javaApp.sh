#!/bin/bash

# Nexus credentials
USER="MN_repo_access"
PASS="Root!23"

# Nexus settings
NEXUS_URL="http://192.168.1.124:8081"
REPO="maven_repo"
ARTIFACT="build-tools-exercises"

echo "Fetching latest artifact info..."

DOWNLOAD_URL=$(curl -s -u "$USER:$PASS" \
"$NEXUS_URL/service/rest/v1/search/assets?repository=$REPO&name=$ARTIFACT&sort=version&direction=desc" \
| jq -r '.items[0].downloadUrl')

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" == "null" ]; then
    echo "Failed to find artifact."
    exit 1
fi

echo "Latest artifact URL:"
echo "$DOWNLOAD_URL"

echo "Downloading artifact..."

wget --user="$USER" --password="$PASS" "$DOWNLOAD_URL"

FILE=$(basename "$DOWNLOAD_URL")

echo "Starting application..."
java -jar "$FILE"
