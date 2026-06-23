---
name: prompt-schema
type: convention
version: "1.0"
language: en
status: stable
tags: [schema, front-matter, conventions]
---

# Prompt Schema - Agent Prompt Framework V1

This document defines the shared YAML front matter schema and the
type-specific content schemas for all files in this framework.

---

## Shared Front Matter (all file types)

Every file in this framework - regardless of type - must include
the following YAML front matter block at the top.

| Field      | Type   | Required | Description                                                                |
| ---------- | ------ | -------- | -------------------------------------------------------------------------- |
| `name`     | string | ✅        | Unique identifier of the file (kebab-case)                                 |
| `type`     | string | ✅        | One of: `persona`, `mode`, `output-template`, `shared-block`, `convention` |
| `version`  | string | ✅        | Semantic version string, e.g. `"1.0"`                                      |
| `language` | string | ✅        | ISO 639-1 code, e.g. `en`, `hu`                                            |
| `status`   | string | ✅        | One of: `draft`, `stable`, `deprecated`                                    |
| `tags`     | list   | optional | Free-form keywords for filtering/searching                                 |

**Example:**
```yaml
***
name: devops-mentor
type: persona
version: "1.0"
language: en
status: stable
tags: [devops, mentoring, tutorial]
***
```

---

## Type-Specific Schemas

### `persona`

Defines the identity, tone, and expertise of an AI agent.

| Heading            | Required | Notes                                            |
| ------------------ | -------- | ------------------------------------------------ |
| `# Role`           | ✅        | One-paragraph description of who this is         |
| `# Scope`          | ✅        | What topics/tasks this persona covers            |
| `# Working Style`  | ✅        | Tone, format preferences, level of detail        |
| `# Rules`          | ✅        | Hard constraints (what to avoid, how to behave)  |
| `# Goal`           | ✅        | What the persona ultimately helps achieve        |
| `# Example Prompt` | optional | A short sample prompt showing the persona in use |

---

### `mode`

A behavioural overlay applied on top of a persona for a specific task type.

| Heading          | Required | Notes                                                             |
| ---------------- | -------- | ----------------------------------------------------------------- |
| `# Purpose`      | ✅        | What this mode is for                                             |
| `# applies_to`   | ✅        | Which persona(s) this mode is designed for (use `any` if general) |
| `# Behaviour`    | ✅        | How the LLM should act in this mode                               |
| `# Output Hints` | ✅        | Preferred format, length, structure                               |
| `# Constraints`  | optional | What this mode explicitly avoids                                  |

---

### `output-template`

A reusable template that defines the structure of a specific output artifact.

| Heading         | Required | Notes                                                      |
| --------------- | -------- | ---------------------------------------------------------- |
| `# Purpose`     | ✅        | What artifact this template produces                       |
| `# format`      | ✅        | One of: `markdown`, `json`, `text`                         |
| `# Structure`   | ✅        | The actual template body (use placeholders like `{topic}`) |
| `# Usage Notes` | optional | When to use this template and when not to                  |

---

### `shared-block`

A reusable instruction fragment that can be embedded into any prompt.

| Heading          | Required | Notes                                  |
| ---------------- | -------- | -------------------------------------- |
| `# Purpose`      | ✅        | What this block does when included     |
| `# Usage`        | ✅        | Where/how to insert it into a prompt   |
| `# Instructions` | ✅        | The actual instruction text to include |
| `# Constraints`  | optional | Edge cases or limitations              |