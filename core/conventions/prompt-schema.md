---
name: prompt-schema
type: convention
version: "2.0"
language: en
status: draft
tags: [schema, index, conventions]
---

# Prompt Schema Index

This document is a short index, not a schema. Earlier versions of this file contained the full front matter and Markdown-section tables for every component type — that content duplicated the machine-readable schema and is being replaced by `core/schemas/*.yaml` files (see F3).

Use this page to find, for any component type, where its conceptual convention doc and its machine-readable schema live.

## Shared front matter

Every file in this framework, regardless of type, sets `name`, `type`, `version`, `language`, and `status` in its YAML front matter, plus an optional `tags` list. The exact allowed values and any type-specific additional fields are defined per-type in `core/schemas/`.

## Component types

| Type              | Convention (why / how)                                    | Schema (what, machine-readable)      |
| ----------------- | --------------------------------------------------------- | ------------------------------------ |
| `persona`         | `core/conventions/persona.md`                             | `core/schemas/persona.yaml`          |
| `skill`           | `core/conventions/skill.md`                               | `core/schemas/skill.yaml`            |
| `shared-block`    | `core/conventions/shared-blocks.md`                       | `core/schemas/shared-block.yaml`     |
| `output-template` | `core/conventions/output.md`                              | `core/schemas/output-template.yaml`  |
| `context`         | `core/conventions/context.md` (stub, not yet implemented) | `core/schemas/context.yaml` (future) |
| `agent`           | *(no standalone convention; see below)*                   | `blueprint.schema.json` (root)       |

## Note on `agent`

There is no separate `agent` convention file. A platform's composition of persona + skills + optional context/outputs/shared-blocks is declared in that platform's `blueprint.yaml`, validated against the root-level `blueprint.schema.json`. This replaces the earlier idea of a standalone `agent.md` file per composition.
