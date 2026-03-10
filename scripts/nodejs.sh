#!/bin/bash

# Credentials
USER="MN_repo_access"
PASS="Root!23"

# Nexus configuration
NEXUS_URL="http://192.168.1.124:8081"
REPO="npm_repo"
ARTIFACT="bootcamp-node-project"

echo "Fetching latest artifact URL..."

artifactDownloadUrl=$(curl -s -u "$USER:$PASS" \
"$NEXUS_URL/service/rest/v1/search/assets?repository=$REPO&name=$ARTIFACT&sort=version&direction=desc" \
| jq -r '.items[0].downloadUrl')

if [ -z "$artifactDownloadUrl" ] || [ "$artifactDownloadUrl" = "null" ]; then
    echo "Artifact not found."
    exit 1
fi

echo "Latest artifact:"
echo "$artifactDownloadUrl"

echo "Downloading artifact..."

wget --http-user="$USER" --http-password="$PASS" "$artifactDownloadUrl" -O app.tgz

echo "Extracting package..."

tar -xvzf app.tgz

echo "Entering extracted directory..."

cd package || exit

echo "Installing dependencies..."

npm install

echo "Starting application..."

npm start
