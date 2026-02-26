#!/usr/bin/env bash
# ─────────────────────────────────────────
# local-offline-ai — one-command setup
# github.com/madebypatrik/local-offline-ai
# ─────────────────────────────────────────

set -e

BOLD="\033[1m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

print()  { echo -e "${BOLD}$1${RESET}"; }
ok()     { echo -e "${GREEN}✔ $1${RESET}"; }
info()   { echo -e "${YELLOW}→ $1${RESET}"; }

echo ""
print "🧠 local-offline-ai setup"
echo "────────────────────────────────────"
echo "This will install Ollama and download"
echo "your first AI model — fully offline."
echo "────────────────────────────────────"
echo ""

# ── 1. Install Ollama ──────────────────────────────────────────────────────────

if command -v ollama &>/dev/null; then
  ok "Ollama is already installed"
else
  print "Step 1/3 — Installing Ollama..."

  if command -v brew &>/dev/null; then
    brew install ollama
  else
    # Download the Mac app and open it for the user
    info "Downloading Ollama..."
    TMP=$(mktemp -d)
    curl -L --progress-bar "https://ollama.com/download/Ollama-darwin.zip" -o "$TMP/Ollama.zip"
    info "Unpacking..."
    unzip -q "$TMP/Ollama.zip" -d "$TMP"
    info "Moving Ollama to Applications..."
    cp -r "$TMP/Ollama.app" /Applications/Ollama.app
    rm -rf "$TMP"
    info "Launching Ollama..."
    open /Applications/Ollama.app
    # Wait for the server to start
    echo "Waiting for Ollama to start..."
    for i in {1..20}; do
      if curl -s http://localhost:11434 &>/dev/null; then break; fi
      sleep 1
    done
  fi

  ok "Ollama installed"
fi

# ── 2. Start Ollama server if not already running ──────────────────────────────

print "Step 2/3 — Starting Ollama server..."

if curl -s http://localhost:11434 &>/dev/null; then
  ok "Ollama server is already running"
else
  ollama serve &>/dev/null &
  echo "Waiting for server to start..."
  for i in {1..15}; do
    if curl -s http://localhost:11434 &>/dev/null; then break; fi
    sleep 1
  done
  ok "Ollama server started"
fi

# ── 3. Download default model ──────────────────────────────────────────────────

DEFAULT_MODEL="deepseek-coder:6.7b"

print "Step 3/3 — Downloading AI model ($DEFAULT_MODEL)..."
info "This is a one-time download (~3.8 GB). Go grab a coffee ☕"
echo ""

ollama pull "$DEFAULT_MODEL"

ok "Model ready"

# ── Done ───────────────────────────────────────────────────────────────────────

echo ""
echo "────────────────────────────────────"
print "✅ All done! Your local AI is ready."
echo "────────────────────────────────────"
echo ""
echo "  Start chatting now:"
echo ""
echo "    ollama run $DEFAULT_MODEL"
echo ""
echo "  Or use the helper script:"
echo ""
echo "    ./ollama.sh run"
echo ""
echo "  For more models and commands see:"
echo "    TOOLS.md and ollama.sh"
echo ""
