---
name: persona
type: convention
version: "2.0"
language: en
status: draft
tags: [personas, conventions]
---

# Persona Convention

This document explains what a `persona` component is for and how to think about writing one. It does not enumerate the required front matter fields or Markdown sections - those are defined by the machine-readable schema at `core/schemas/persona.yaml` (see below).

## What is it?

A persona defines the persistent identity of an agent: its role, expertise scope, voice, and behavioural principles. It is the "who" - not the "how" (that's a `skill`) and not the "how it's presented" (that's an `output-template`).

## When to use it?

Create or edit a persona when you need to define a stable identity that an agent should keep across many different tasks and sessions - for example a mentor, a reviewer, or a domain expert. If what you actually want to change is *how a task gets done*, not *who is doing it*, you probably want a `skill` instead.

A persona should stay broad enough to be reused. If you find yourself writing task-specific instructions into a persona, that's a signal the content belongs in a `skill`, not here.

## Anti-patterns

- **Baking a process into the persona.** A numbered workflow, a decision procedure, or "first do X, then do Y" belongs in a `skill`. If a persona file contains ordered steps, that's a sign it's really trying to be a skill.
- **Prescribing output format.** Instructions like "always respond with a table" or "wrap output in a code block" belong in an `output-template`. A persona can describe *tone and level of detail*, but not layout.
- **Hardcoding project- or domain-specific background.** "You work at Acme Corp on the billing system" is context, not identity. Keep the persona reusable; domain narrowing is reserved for the future `context` component.
- **Turning the persona into a temporary behavioural overlay.** A short-lived mode switch ("today, focus only on security review") is not a persona; it changes behaviour for a session, not identity.
- **Merging multiple components into one file.** A persona that also defines the agent's skills and output shape is really an `agent` composition. Keep the persona focused on identity alone.

## Related schema

The exact required and optional front matter fields, and the required Markdown sections a persona file must contain, are defined in `core/schemas/persona.yaml`. Validate new persona files against that schema rather than relying on this document for structural rules.

## Example

```md
---
name: devops-mentor
type: persona
version: "1.0"
language: en
status: draft
tags: [devops, mentoring]
---

# Role

You are a practical DevOps mentor who helps engineers understand, design, and improve delivery and infrastructure practices.

# Scope

You cover CI/CD, containerization, infrastructure-as-code, and operational practices appropriate to the user's level and environment.

# Working Style

Explain concepts clearly and pragmatically. Use concrete examples, state assumptions, and adjust the level of detail to the user's experience.

# Rules

- Prefer safe, reversible recommendations.
- Explain risks before recommending production changes.
- Ask a focused clarifying question when a missing detail materially changes the advice.

# Goal

Help the user build sustainable DevOps knowledge and make sound operational decisions.
```
