# Product Development Process

⚠️ This README is being refined in [this ChatGPT session](https://chatgpt.com/c/686f26b4-d9dc-8004-91a0-634d7e4d0907).

---

## Process Flow

```
PRODUCT SPEC → TECHNICAL SPEC → INTEGRATION TESTS → IMPLEMENTATION
```

Each level:
- **Defines constraints and intent** for the next.
- **May be intentionally vague** in parts to allow flexibility.
- **Must be updated** if a downstream action introduces something not explicitly included or permitted by the previous level.

For example:
- If an **integration test** introduces a new requirement not covered in the Technical Spec, the Technical Spec must be updated.
- If an **implementation** introduces functionality not covered in the integration tests or technical spec, both should be updated—unless the change falls within the allowed flexibility.

To the extent that a change is requested at a low level (e.g., modifying code in a way that causes deviation from integration tests, technical specs, and/or product specs), it is implicit that upstream documents must be updated accordingly. However, a balance should be maintained between process rigidity and efficient iteration. While the general expectation is that all upstream documents be updated and go through the appropriate levels of review, it may be reasonable for downstream steps (e.g., integration tests) to receive fuller updates, while upstream steps (e.g., product specs) receive minimal but sufficient adjustments.

**IMPORTANT:** When an AI agent is asked to perform an action that would cause a mismatch between code/tests and their upstream specs, it **must pause and decide between two clearly‑communicated paths:**

1. **Pause & Escalate** – Do **not** apply the change yet. Notify the requestor that proceeding will create conflicts with the upstream artefacts you list (Product Spec, Technical Spec, Integration Tests, etc.) and wait for explicit confirmation.
2. **Proceed & Propagate** – If the agent is *highly confident* the requestor intends the change, it may apply the change **and** update every affected upstream document and test in the same commit/PR. This is done at the agent’s risk that the work may later be reverted.

In **both** cases, the agent must provide a short summary of either:
- `⚠️  This change requires updates to: …  Awaiting confirmation.` **or**
- `✅  Implemented change and updated: …  (brief rationale)`

The agent should weigh scope, risk, and delivery speed when selecting an option and always surface any obvious alternatives.

---

## Development Steps

1. **Write a Product Spec** (`/specs/product-specs/`)
   - Define what the feature must do from a user/system perspective
   - Avoid references to specific technologies
   - Required behavior should be documented; anything omitted or marked optional is left intentionally flexible for downstream definition
   - Each product spec must name the technical spec(s) intended to satisfy it (if they exist or are later created)

2. **Write a Technical Spec** (`/specs/technical-specs/`)
   - Define how one or more product specs will be implemented technically
   - Include architecture, APIs, models, edge cases, dependencies
   - A technical spec may satisfy multiple product specs, or only part of one
   - It may also describe shared or common infrastructure used across several features
   - Each technical spec must list the product specs it supports and the integration tests that validate its implementation

3. **Write Integration Tests** (`/specs/integration-tests/`)
   - Verify that the implementation satisfies the associated technical and product specs
   - Integration tests form the executable contract between specs and code
   - Each test must link to the technical spec and/or product spec it validates

4. **Write the Code**
   - Must fulfill all integration tests and adhere to the technical spec
   - If the implementation deviates from upstream definitions, the relevant documents must be updated unless explicitly allowed
   - Code is complete only when it satisfies all integration tests and upstream spec requirements
   - If a task asks for changes that violate this chain, the implication is that the upstream layers must be updated with appropriate review

5. **Tag Each File for AI Awareness**
   - Each `*.md`, `*.spec.js`, or implementation file that follows this process should begin with:
     `<!-- AI NOTE: Follow the process in PRODUCT_PROCESS.md. If unsure, consult AGENTS.md. -->`
   - This helps AI agents recognize operational constraints and appropriate escalation paths

---

## Spec Hierarchy and Responsibilities

This document outlines a structured, layered approach to developing features and products. Each step exists to serve the one before it. Any downstream change should be reflected upstream unless explicitly allowed.

Each level should faithfully reflect the one above it:

```
PRODUCT SPEC → TECHNICAL SPEC → INTEGRATION TESTS → CODE
```

- If something changes **downstream**, upstream levels **must be updated**
- Additions at lower levels must propagate upward—unless covered by flexibility explicitly granted by the upstream step
- This structure keeps all levels in sync and prevents hidden assumptions or undocumented behavior

Each spec file should explicitly declare:
- What upstream spec(s) it satisfies
- What downstream spec(s) or code implement it

---

## File Organization

Organize all specs and related documents using these directories:

- `/specs/product-specs/` — one file per user-facing feature or domain (e.g., `hatchery.md`, `items.md`, `pets.md`)
- `/specs/technical-specs/` — one file per technical solution component (e.g., `egg-incubation.md`, `pet-evolution.md`, `shared-event-bus.md`)
- `/specs/integration-tests/` — one file or directory per integration test suite (e.g., `hatchery-tests.md`, `items-api-tests/`)
- `/docs/PRODUCT_PROCESS.md` — this process file
- `/specs/README.md` — a high-level index and cross-reference map of all specs and tests

---

## Snippet for `AGENTS.md`

```
# AI Agent Instructions

This repository follows a structured product development process. Before taking action, AI agents must read and understand `/docs/PRODUCT_PROCESS.md`.

**Your responsibilities:**
- Follow the process from Product Spec → Technical Spec → Integration Tests → Implementation
- Never generate implementation without confirming the existence of specs and tests
- If asked to take action not covered by a previous phase, treat it as an implicit request to update upstream documents
- Flag deviations with a note such as:
  "I should not update this without also considering that it would require changes to the following upstream documents: ___"
- Begin all modified or created files with the note:
  `<!-- AI NOTE: Follow the process in PRODUCT_PROCESS.md. If unsure, consult AGENTS.md. -->`
```

---

## Snippet for `README.md`

```
## Development Philosophy

This project follows a structured development process described in [`/docs/PRODUCT_PROCESS.md`](./docs/PRODUCT_PROCESS.md). If you are an AI agent or contributor, please also read [`AGENTS.md`](./AGENTS.md) before making changes.
```

