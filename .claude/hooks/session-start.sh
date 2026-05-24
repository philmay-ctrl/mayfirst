#!/bin/bash
# SessionStart hook for Claude Code on the web.
# Detects common dependency manifests and installs them so that tests and
# linters work in remote sessions. Safe to re-run (idempotent) and a no-op
# when no manifest is present yet.
set -euo pipefail

# Only run in the remote (web) environment; skip on local machines.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(pwd)}"

log() { echo "[session-start] $*" >&2; }

# Node.js / npm
if [ -f package.json ]; then
  log "Installing npm dependencies"
  npm install
fi

# Python: Poetry first, otherwise pip + requirements.txt
if [ -f poetry.lock ] || { [ -f pyproject.toml ] && grep -q "\[tool.poetry\]" pyproject.toml; }; then
  log "Installing Python dependencies via Poetry"
  poetry install
elif [ -f requirements.txt ]; then
  log "Installing Python dependencies via pip"
  pip install -r requirements.txt
fi

# Rust
if [ -f Cargo.toml ]; then
  log "Fetching Rust dependencies"
  cargo fetch
fi

# Go
if [ -f go.mod ]; then
  log "Downloading Go modules"
  go mod download
fi

# Ruby
if [ -f Gemfile ]; then
  log "Installing Ruby gems via Bundler"
  bundle install
fi

log "Setup complete"
