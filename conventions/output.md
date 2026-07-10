---
name: output-convention
type: convention
version: "1.0"
language: en
status: draft
tags: [output, convention, schema]
---

# Output Convention

This document defines what an `output` component is, when to use one,
and how to structure it. For file naming and folder placement, see
[output-strategy.md](./output-strategy.md).

---

## What Is an Output

An `output` is an optional presentation layer placed on top of a skill or agent.
It does not define what the LLM knows or how it reasons — it defines how the
result is packaged and shown.

The same skill can run with or without an output layer. The output layer
activates when consistent, scannable, structured results are needed.

> Rule: An output is a **formatting contract**, not domain logic.

---

## When to Use One

Use an output when:
- The result is a reusable artifact (project sheet, repo structure, config file, etc.)
- Multiple sessions should produce the same shape of result
- The output will be read by someone other than the immediate user

Do not use an output when:
- The result is conversational or exploratory
- Format flexibility is more useful than consistency

---

## Front Matter Schema

```yaml
---
name: string           # unique identifier, kebab-case
type: output           # always "output"
version: string        # semver-style, e.g. "1.0"
language: string       # e.g. "en", "hu"
status: draft | stable | deprecated
tags: []
applies_to: [skill | agent | both]
format: markdown | yaml | json | plain | shell
strictness: light | structured | strict
---
```

### Required Fields

| Field        | Why                                               |
| ------------ | ------------------------------------------------- |
| `name`       | Unique identifier                                 |
| `type`       | Always `output`                                   |
| `version`    | Enables change tracking                           |
| `language`   | Sets language expectation for the rendered result |
| `applies_to` | Clarifies whether this targets a skill or agent   |
| `format`     | Tells the LLM what syntax to use                  |
| `strictness` | Sets how rigid the structure is                   |

### Strictness Levels

| Level        | Meaning                                              |
| ------------ | ---------------------------------------------------- |
| `light`      | Required sections and 1–2 rules; rest is flexible    |
| `structured` | Fixed section order, defined headers                 |
| `strict`     | Near-schema level; no deviation from shape allowed   |

---

## Body Structure

```markdown
# Purpose
What this output layer is for and what kind of result it shapes.

# Use When
The condition or context that triggers this output layer.

# Required Sections

| Section   | Required | Notes                   |
| --------- | -------- | ----------------------- |
| Overview  | yes      | 1–3 sentences           |
| Structure | yes      | list, tree, or table    |
| Notes     | no       | optional remarks        |

# Rules
- Keep all required sections.
- Do not omit required headers.
- Prefer scan-friendly formatting (short lines, lists, tables).
- [Add format-specific rules here]

# Example Shape
A minimal structural sketch — not real content, just the form.
```

---

## Relationship to Other Components

| Component | Role                          |
| --------- | ----------------------------- |
| `persona` | Defines identity and tone     |
| `skill`   | Defines capability or process |
| `output`  | Defines presentation shape    |
| `mode`    | Frozen in V1; see mode convention |

An agent does not require an output layer. Skills run without one by default.
