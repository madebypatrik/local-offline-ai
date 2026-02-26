# 🧠 local-offline-ai

> A local offline AI stack — no subscriptions, no internet, your data never leaves your machine

![Ollama](https://img.shields.io/badge/Ollama-local%20AI-black)
![macOS](https://img.shields.io/badge/macOS-Apple%20Silicon%20%7C%20Intel-lightgrey)
![License](https://img.shields.io/badge/license-ISC-yellow)
![Privacy](https://img.shields.io/badge/privacy-100%25%20offline-green)

---

## What is this?

This is a setup guide and toolkit for running AI **completely on your own computer** — no account required, no monthly fee, no internet connection needed once set up.

Your conversations, code, and documents **never leave your machine.**

---

## What can you do with it?

- 💬 Chat with an AI assistant — like ChatGPT but fully private
- 👨‍💻 Get coding help and suggestions directly in VS Code
- ✍️ Ask questions, summarize text, brainstorm ideas
- 🔒 Work with sensitive documents without worrying about data leaks
- ✈️ Use AI on a plane, in a café, anywhere — no Wi-Fi needed

---

## What you need

- A Mac (Apple Silicon or Intel)
- [Homebrew](https://brew.sh) — a free tool for installing software on Mac
- [VS Code](https://code.visualstudio.com) — free code editor (optional, for coding features)
- ~5 GB of free disk space per AI model

---

## Setup — step by step

### 1. Install Homebrew (if you don't have it)
Open **Terminal** and paste:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Ollama
```bash
brew install ollama
```

### 3. Start the AI server
```bash
ollama serve
```
Keep this terminal window open — it runs the AI engine in the background.

### 4. Download an AI model
Open a **new** terminal window and run one of these:

```bash
# Great for coding
ollama pull deepseek-coder:6.7b

# Great for general chat, writing, and questions
ollama pull llama3
```

### 5. Start chatting
```bash
ollama run llama3
```
Type your message and press Enter. Type `/bye` to exit.

---

## Using the helper script

This repo includes `ollama.sh` — a small script with shortcuts so you don't have to remember commands.

```bash
# See all commands and cheat sheet
./ollama.sh

# Start the server
./ollama.sh serve

# Chat with the default model (deepseek-coder:6.7b)
./ollama.sh run

# Chat with a specific model
./ollama.sh run llama3

# See what models you have downloaded
./ollama.sh list
```

---

## VS Code integration (optional)

If you use VS Code, you can get AI suggestions and chat right inside your editor for free.

1. Open VS Code
2. Install the **Continue** extension (search `Continue.continue` in the Extensions panel)
3. In Continue settings, set the provider to **Ollama** and model to `deepseek-coder:6.7b`
4. That's it — AI tab-complete and chat work entirely offline

> To disable telemetry in Continue, add this to your VS Code settings:
> `"continue.telemetryEnabled": false`

---

## AI models included

See [TOOLS.md](./TOOLS.md) for full details on every tool and model — including company, country, open-source license, privacy rating, and popularity.

| Model | Best for | Size |
|---|---|---|
| `deepseek-coder:6.7b` | Code, programming help | ~3.8 GB |
| `llama3` | Chat, writing, questions | ~4.7 GB |

---

## Privacy & Safety

| | |
|---|---|
| Data sent to the cloud | **Never** |
| Internet required after setup | **No** |
| Account or API key needed | **No** |
| Subscription or cost | **Free** |
| Your files/code shared | **Never** |

All models run locally using [Ollama](https://ollama.com). Nothing is logged or transmitted.

---

## Troubleshooting

**`ollama: command not found`**
→ Make sure Homebrew installed correctly and run `brew install ollama` again.

**Model is slow**
→ Larger models need more RAM. Try a smaller model like `phi3:mini` (~2 GB).

**`ollama serve` port already in use**
→ Ollama might already be running. Check with `ollama ps`.

**Continue extension not connecting**
→ Make sure `ollama serve` is running in a terminal first.

---

## License

ISC © [@madebypatrik](https://github.com/madebypatrik)
