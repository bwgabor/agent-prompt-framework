---
name: output-strategy
type: convention
version: "1.0"
language: en
status: stable
tags: [output, file-naming, conventions]
---

# Output Strategy - Agent Prompt Framework V1

This document defines where files go and how they are named.
It is the single source of truth for output organisation.

---

## Two Output Zones

| Location             | Contains                      | Committed to Git |
| -------------------- | ----------------------------- | ---------------- |
| `_template/outputs/` | **Reusable output templates** | ✅ Yes            |
| `outputs/`           | **Real session artifacts**    | ✅ Yes (optional) |

### `_template/outputs/` - Templates

Files here are **blueprints**: they define the structure of a type of output
but contain no real content.

- Written once, reused for every session.
- Named after the artifact type: `idea-list.md`, `project-brief.md`.
- Never modified during a session - copy, don't edit.

**Example:** `_template/outputs/idea-list.md`

### `outputs/` - Real Session Artifacts

Files here are **actual results** produced during an LLM session.

- One file per session/topic.
- Never used as templates.
- Committed only if the artifact has long-term value; otherwise discard.

**Example:** `outputs/20260614-ci-pipeline-ideation.md`

---

## File Naming Convention

### Templates (`_template/outputs/`)

```
{artifact-type}.md
```

Examples: `idea-list.md`, `project-brief.md`, `action-plan.md`

### Session Artifacts (`outputs/`)

```
YYYYMMDD-{topic}-{mode}.md
```


| Part  | Format         | Example       |
| ----- | -------------- | ------------- |
| Date  | `YYYYMMDD`     | `20260614`    |
| Topic | kebab-case     | `ci-pipeline` |
| Mode  | mode file name | `ideation`    |

Full example: `20260614-ci-pipeline-ideation.md`

### General Rules

- Lowercase, kebab-case only - no spaces, no underscores, no camelCase.
- Dates use `YYYYMMDD` format (ISO 8601, no separators).
- Topic should be 1-3 words max.
- Mode matches the filename of the used mode (without `.md`).