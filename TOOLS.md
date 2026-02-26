# Tools, Frameworks & Dependencies

---

## Models

### deepseek-coder:6.7b
| | |
|---|---|
| **Company** | DeepSeek AI |
| **Country** | China |
| **Open source** | Yes — [DeepSeek License](https://github.com/deepseek-ai/DeepSeek-Coder/blob/main/LICENSE-MODEL) (permissive for research & commercial use under 100M users) |
| **Popularity** | ~18k GitHub stars; topped HumanEval benchmarks on release (Jan 2024), widely used as a local Copilot alternative |
| **Purpose** | Code generation, completion, and explanation |
| **Size** | 6.7B parameters (~3.8 GB on disk with 4-bit quantization) |
| **Ollama page** | https://ollama.com/library/deepseek-coder |
| **Repository** | https://github.com/deepseek-ai/DeepSeek-Coder |
| **Privacy & Safety** | Safe — runs fully offline on your Mac, no data sent anywhere. Chinese company but irrelevant since the model is local-only. Code auditable via open weights. |

### llama3
| | |
|---|---|
| **Company** | Meta AI |
| **Country** | USA |
| **Open source** | Yes — [Meta Llama 3 Community License](https://llama.meta.com/llama3/license/) (free for commercial use under 700M users) |
| **Popularity** | ~35k GitHub stars; one of the most downloaded open-weight models, broadly considered the open-source baseline to beat |
| **Purpose** | General-purpose chat, reasoning, summarization, and code |
| **Size** | 8B parameters (~4.7 GB on disk with 4-bit quantization) |
| **Ollama page** | https://ollama.com/library/llama3 |
| **Repository** | https://github.com/meta-llama/llama3 |
| **Privacy & Safety** | Safe — runs fully offline on your Mac, no data sent anywhere. Weights are open and widely reviewed by the research community. |

---

## Runtime

### Ollama
| | |
|---|---|
| **Company** | Ollama Inc. |
| **Country** | USA |
| **Open source** | Yes — [MIT License](https://github.com/ollama/ollama/blob/main/LICENSE) |
| **Popularity** | ~100k GitHub stars; the de-facto standard for running LLMs locally on macOS/Linux/Windows |
| **Purpose** | Serves LLMs locally via a REST API (`http://localhost:11434`) |
| **Install** | `brew install ollama` |
| **Repository** | https://github.com/ollama/ollama |
| **Model library** | https://ollama.com/library |
| **Privacy & Safety** | Safe — all inference is local, no telemetry by default. API binds to localhost only, not exposed to the network. MIT code is fully auditable. |

---

## Editor Extensions

### Continue
| | |
|---|---|
| **Company** | Continue Dev, Inc. |
| **Country** | USA |
| **Open source** | Yes — [Apache 2.0 License](https://github.com/continuedev/continue/blob/main/LICENSE) |
| **Popularity** | 2.2M+ VS Code installs; ~22k GitHub stars; leading open-source alternative to GitHub Copilot |
| **Purpose** | AI code agent inside VS Code: chat, edit, autocomplete, and agent mode |
| **Connects to** | Ollama via `http://localhost:11434` |
| **Install** | VS Code Marketplace ID: `Continue.continue` |
| **Repository** | https://github.com/continuedev/continue |
| **Docs** | https://docs.continue.dev |
| **Privacy & Safety** | Safe when configured to use Ollama — your code stays local. Has optional telemetry; disable it with `"continue.telemetryEnabled": false` in VS Code settings. Do NOT connect to cloud models (OpenAI, Anthropic) if privacy is a concern. |

---

## Template — adding a new model

When you install a new model with `ollama pull <name>`, add a section here:

```markdown
### <model-name:tag>
| | |
|---|---|
| **Company** | |
| **Country** | |
| **Open source** | Yes/No — [License name](license-url) |
| **Popularity** | GitHub stars / download count / notable benchmarks |
| **Purpose** | |
| **Size** | xB parameters (~x GB on disk with 4-bit quantization) |
| **Ollama page** | https://ollama.com/library/<model-name> |
| **Repository** | |
| **Privacy & Safety** | |
```
