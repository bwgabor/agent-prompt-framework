---
name: output
type: convention
version: "2.0"
language: en
status: draft
tags: [output, conventions]
---

# Output Convention

This document explains what an `output-template` component is for, how to think about writing one, and where its instances live in this repository. It does not enumerate the required front matter fields or Markdown sections - those are defined by the machine-readable schema at `core/schemas/output-template.yaml` (see below).

> This document merges the former `output.md` and `output-strategy.md` conventions. The file-naming rules that used to live in `output-strategy.md` referenced the pre-V2 `_template/outputs/` and `outputs/` paths, which no longer exist after the F1 restructure - see "File Organization" below for the current locations.

## What is it?

An output template is an optional presentation layer, defined per artifact type, that specifies how a content-level result should be structured, formatted, and presented - without prescribing the content or process that produces it. It is the "how it's presented" - not the "who" (that's a `persona`) and not the "how it's produced" (that's a `skill`).

## When to use it?

Create an output template when a specific kind of artifact needs a consistent shape every time it's produced - for example a session summary, an idea list, or a persona data sheet. If the artifact's shape can vary freely from session to session, you probably don't need one: an agent works fine without any output layer, and skills run without one by
default.

## Anti-patterns

- **Defining the reasoning process inside an output template.** The steps used to arrive at the content belong in a `skill`. An output template only shapes the final result.
- **Baking in identity or tone.** Instructions like "explain things patiently" belong in a `persona`. An output template governs layout, not voice.
- **Adding a `## Template` sub-section that just repeats the `# Rules`.** Only include a literal template snippet when a formatting rule is genuinely hard to express in prose alone.
- **Referencing components that don't exist.** Earlier versions of this document referenced a `mode` convention that was never implemented and was formally rejected - don't reintroduce dangling references to unbuilt components. If a component isn't real yet, say so explicitly (as `core/conventions/context.md` does for `context`).

## Related schema

The exact required and optional front matter fields (including the `format` and `strictness` fields specific to this type), and the required Markdown sections an output template file must contain, are defined in `core/schemas/output-template.yaml`. Validate new output template files against that schema rather than relying on this document for structural rules.

## File Organization

Output templates and real session artifacts live in different places and are not interchangeable:

| Location     | Contains                                                                                             | Committed to Git |
| ------------ | ---------------------------------------------------------------------------------------------------- | ---------------- |
| `templates/` | Reusable output templates - blueprints with no real content                                          | Yes              |
| `tests/`     | Real, generated artifacts produced by using a template - testing/example instances, not deliverables | Optional         |

- Templates in `templates/` are written once and reused; never edit them mid-session, copy them instead.
- Files in `tests/` are named `YYYYMMDD-{topic}-{skill}.md` (e.g. `20260614-ci-pipeline-brainstorming.md`) and are kept only when they have long-term reference value - otherwise discard them.

## Example

```md
---
name: session-summary
type: output-template
version: "1.0"
language: en
status: draft
format: markdown
strictness: strict
tags: [summary, session]
---

# Purpose

Capture what happened in a task or session so it can be reviewed later without re-reading the full conversation.

# Use When

Use when a task or session ends and the user requests a summary of what was done, decided, and encountered.

# Rules

- Cover only what actually happened in this task; do not speculate.
- Keep each bullet factual and specific enough to be useful without context.

# Formatting Rules

- Title is an H1 reading "Session Summary" followed by the task date.
- Three bold sections: Steps Taken, Decisions & Open Questions, Issues & Blockers.
```
