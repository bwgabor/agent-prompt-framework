---
name: my-agent
type: agent
version: "1.0"
language: en
status: draft
persona: my-persona
skills:
  - my-skill
outputs: []
shared-blocks: []
tags: []
---

# Purpose

> State in 1–2 sentences what this specific combination of components is for.
> Name the persona and skill(s) it combines and the situation it targets.
> Example: "Combine the DevOps Mentor persona with a brainstorming skill so the
> agent can facilitate an idea-generation session about delivery or
> infrastructure practices, then close with a clean session summary."

# Composition

> List the referenced components in assembly order, with a one-line role for
> each. Follow the order: persona + [context?] + skills + [outputs?].
> Shared blocks are not positional — state where each one is inserted
> according to its own `# Usage` instructions (by default: after the
> skill(s), before the user's request).
>
> 1. `persona: my-persona` — sets identity, tone, and expertise boundaries.
> 2. `skills: my-skill` — provides the ordered process this agent runs.
> 3. `outputs: <name>` — shapes how the final result is presented. (omit if `outputs` is empty)
> 4. `shared-blocks: <name>` — inserted <where/when, per its own `# Usage`>. (omit if `shared-blocks` is empty)

<!-- Optional sections — uncomment if needed:

# Notes
> Maintainer notes, e.g. why specific components were chosen over alternatives.

# Compatibility
> Known substitutions or variations (e.g. alternate skills or outputs) that also work with this agent.

-->

<!--
Reminders (see conventions/agent.md):
- Exactly one `persona`, at least one `skill`. Everything else is optional.
- Do not inline the content of any referenced component — reference by name only.
- `context` is reserved for V2; keep it empty or absent in V1.
- No build logic, assembly scripts, or provider-specific prompt syntax.
-->
