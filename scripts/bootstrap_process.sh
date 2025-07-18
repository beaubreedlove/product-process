#!/usr/bin/env bash
set -e

RAW_BASE="https://raw.githubusercontent.com/<org>/product-process/main"

# Step 1: fetch process file
mkdir -p docs
curl -sSfL "$RAW_BASE/docs/PRODUCT_PROCESS.md" -o docs/PRODUCT_PROCESS.md

# Step 2: append agent instructions
AGENTS_FILE="AGENTS.md"
if ! grep -q "AI Agent Instructions" "$AGENTS_FILE" 2>/dev/null; then
cat <<'SNIPPET' >> "$AGENTS_FILE"
# AI Agent Instructions

This repository follows a structured product development process. Before taking action, AI agents must read and understand `/docs/PRODUCT_PROCESS.md`.

**Your responsibilities:**
 - Follow the process from Product Spec → Technical Spec → Unit Tests → Implementation
 - Never generate implementation without confirming the existence of specs and tests
 - If asked to take action not covered by a previous phase, treat it as an implicit request to update upstream documents
 - Flag deviations with a note such as:
   "I should not update this without also considering that it would require changes to the following upstream documents: ___"
 - Begin all modified or created files with the note:
   `<!-- AI NOTE: Follow the process in PRODUCT_PROCESS.md. If unsure, consult AGENTS.md. -->`
SNIPPET
fi

# Step 3: append README snippet
README_FILE="README.md"
if [ ! -f "$README_FILE" ]; then
  touch "$README_FILE"
fi
if ! grep -q "Development Philosophy" "$README_FILE"; then
cat <<'SNIPPET' >> "$README_FILE"

## Development Philosophy

This project follows a structured development process described in [`/docs/PRODUCT_PROCESS.md`](./docs/PRODUCT_PROCESS.md). If you are an AI agent or contributor, please also read [`AGENTS.md`](./AGENTS.md) before making changes.
SNIPPET
fi
