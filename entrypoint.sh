#!/bin/bash
set -e
# エラーが吐かれた場合は処理を中止

# Remove a potentially pre-existing server.pid for Rails.
rm -f /docker_demo/tmp/pids/server.pid
# 既にserver.pidファイルが存在している場合は削除

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
# DockerfileのCMDコマンド（今回はRailsを実行）