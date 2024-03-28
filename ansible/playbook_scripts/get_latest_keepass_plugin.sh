#!/bin/bash
PLUGIN_FOLDER='/usr/lib/keepass2/Plugins'

function clearPluginFolder() {
  sudo rm "$PLUGIN_FOLDER/"*
}

function constructLatestPluginVersionDownloadUrl() {
  local github_project_url="$1"
  local file_name="$2"
  local latest_release_url="$github_project_url/releases/latest"
  local effective_release_url=$(curl -s -L -w "%{url_effective}" -o /dev/null "$latest_release_url")
  local tag=$(echo "$effective_release_url" | xargs basename)
  local file_url="$github_project_url/releases/download/$tag/$file_name"
  echo "$file_url"
}


function downloadPlugin() {
  local file_url="$1"
  sudo wget -q "$file_url" -P "$PLUGIN_FOLDER"
}

clearPluginFolder

KEEPASS_RDP_FILE_URL=$(constructLatestPluginVersionDownloadUrl 'https://github.com/kee-org/keepassrpc' 'KeePassRPC.plgx')
downloadPlugin "$KEEPASS_RDP_FILE_URL"
