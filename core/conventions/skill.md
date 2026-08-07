---
name: skill
type: convention
version: "2.0"
language: en
status: draft
tags: [skills, conventions]
---

# Skill Convention

This document explains what a `skill` component is for and how to think about writing one. It does not enumerate the required front matter fields or Markdown sections - those are defined by the machine-readable schema at `core/schemas/skill.yaml` (see below).

## What is it?

A skill is a self-contained, reusable capability or repeatable process. It defines the required inputs, the execution process, and the expected content-level result. It is the "how" - not the "who" (that's a `persona`) and not the "how it's presented" (that's an `output-template`).

## When to use it?

Create or edit a skill when you want to capture a process that should be run the same way every time it's invoked, regardless of which persona invokes it - for example, a brainstorming session, a code review pass, or a project-planning workflow. If what varies between sessions is *who is speaking*, not *what gets done*, that belongs in a `persona`, not here.

A skill should be usable by more than one persona. If a process only makes sense bolted to one specific identity, consider whether it should really just live inline in that persona instead of being split out.

## Anti-patterns

- **Defining identity or tone inside a skill.** "You are a senior engineer who..." belongs in a `persona`. A skill describes a process, not who is carrying it out.
- **Prescribing the final presentation format.** A skill should describe the content-level result ("a prioritized list of ideas"), not its exact Markdown layout. Layout belongs in an `output-template`.
- **Hardcoding project- or domain-specific facts** into the process steps. If the skill only works for one specific project, it's not reusable - reserve domain narrowing for the future `context` component.
- **Writing a single short instruction as a full skill.** A one- or two-line reusable instruction fragment (e.g. "ask a clarifying question before answering") is a `shared-block`, not a skill. Skills are for multi-step or non-trivial processes.
- **Skipping the inputs.** A process that doesn't state what it needs to start from is hard to reuse correctly - always be explicit about required inputs, even if they seem obvious.

## Related schema

The exact required and optional front matter fields, and the required Markdown sections a skill file must contain, are defined in `core/schemas/skill.yaml`. Validate new skill files against that schema rather than relying on this document for structural rules.

## Example

```md
---
name: brainstorming-session
type: skill
version: "1.0"
language: en
status: draft
tags: [ideation, process]
---

# Purpose

Facilitate a focused brainstorming session that generates and evaluates viable ideas.

# When to Use

Use when the user needs to explore options before selecting an idea or starting execution.

# Inputs

- A topic, problem, or opportunity to explore
- Any relevant goals, constraints, and evaluation criteria

# Process

1. Clarify the objective and important constraints.
2. Generate multiple distinct ideas.
3. Group similar ideas and remove clear duplicates.
4. Evaluate the remaining ideas against the stated criteria.
5. Present the viable options for the user to select or develop further.

# Expected Output

A prioritized set of viable ideas, each with a short rationale and enough detail to select or develop further.
```
