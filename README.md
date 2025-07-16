# Product Process

This repository uses a structured workflow for developing features.
See [docs/PRODUCT_PROCESS.md](./docs/PRODUCT_PROCESS.md) for the full procedure.

## How to Use

1. **Copy this snippet into `AGENTS.md`** so AI contributors follow the process:

```markdown
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
```

2. **Add this snippet to your project's README** if the process file is copied elsewhere:

```markdown
## Development Philosophy

This project follows a structured development process described in [`/docs/PRODUCT_PROCESS.md`](./docs/PRODUCT_PROCESS.md). If you are an AI agent or contributor, please also read [`AGENTS.md`](./AGENTS.md) before making changes.
```
