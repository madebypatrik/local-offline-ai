#!/usr/bin/env bash
# Ollama quick reference & launcher
# Installed via: brew install ollama

DEFAULT_MODEL="deepseek-coder:6.7b"
COMMAND="${1:-help}"

case "$COMMAND" in
  serve)
    # Start the Ollama server (required before running models)
    echo "Starting Ollama server..."
    ollama serve
    ;;

  run)
    # Run a model interactively, e.g.: ./ollama.sh run llama3
    # Defaults to $DEFAULT_MODEL if no model specified
    MODEL="${2:-$DEFAULT_MODEL}"
    ollama run "$MODEL"
    ;;

  pull)
    # Download a model, e.g.: ./ollama.sh pull llama3
    MODEL="${2:?Usage: $0 pull <model>}"
    ollama pull "$MODEL"
    ;;

  list)
    # List locally downloaded models
    ollama list
    ;;

  ps)
    # Show currently running models
    ollama ps
    ;;

  stop)
    # Stop a running model, e.g.: ./ollama.sh stop llama3
    MODEL="${2:?Usage: $0 stop <model>}"
    ollama stop "$MODEL"
    ;;

  rm)
    # Remove a downloaded model, e.g.: ./ollama.sh rm llama3
    MODEL="${2:?Usage: $0 rm <model>}"
    ollama rm "$MODEL"
    ;;

  api)
    # Quick test of the REST API (server must be running)
    MODEL="${2:-$DEFAULT_MODEL}"
    PROMPT="${3:-Hello!}"
    curl -s http://localhost:11434/api/generate \
      -d "{\"model\": \"$MODEL\", \"prompt\": \"$PROMPT\", \"stream\": false}" | \
      python3 -m json.tool
    ;;

  help|*)
    cat <<EOF
Ollama cheat sheet (brew install ollama)
─────────────────────────────────────────
Default model: $DEFAULT_MODEL

Workflow:
  1. Start server:   ollama serve                 (keep this running in a terminal)
  2. Pull a model:   ollama pull deepseek-coder:6.7b
  3. Chat with it:   ollama run deepseek-coder:6.7b
                  or ./ollama.sh run              (uses default model)

Commands via this script:
  ./ollama.sh serve              Start the server
  ./ollama.sh run   [model]      Interactive chat (default: $DEFAULT_MODEL)
  ./ollama.sh pull  <model>      Download a model
  ./ollama.sh list               List downloaded models
  ./ollama.sh ps                 Show running models
  ./ollama.sh stop  <model>      Stop a running model
  ./ollama.sh rm    <model>      Delete a downloaded model
  ./ollama.sh api   [model] [prompt]   Test REST API (default: $DEFAULT_MODEL)

REST API (server on http://localhost:11434):
  POST /api/generate   — single completion
  POST /api/chat       — chat with history
  GET  /api/tags       — list local models

─────────────────────────────────────────
Tools, companies & open-source info: see TOOLS.md

─────────────────────────────────────────
Full model library: https://ollama.com/library
EOF
    ;;
esac
