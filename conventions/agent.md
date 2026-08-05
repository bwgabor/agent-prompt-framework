---
name: agent
type: convention
version: "1.0"
language: en
status: draft
tags: [agent, composition, schema, conventions]
---

# Agent Convention

This document defines how to create and maintain `agent` components in the Agent Prompt Framework.

## Definition

An agent is a declarative composition manifest. It assembles a single persona with one or more skills — and optionally context, output templates, and shared blocks — into a complete, ready-to-use prompt configuration, without duplicating the content of the components it references.

## Scope

### What belongs in an agent

An agent file declares which components make up a specific, usable configuration. It may specify:

- A reference to exactly one `persona`
- References to one or more `skills`
- Optional references to `output-template` components
- Optional references to `shared-block` components
- Optional references to a future `context` component
- The assembly order of the referenced components
- A short statement of what this specific combination is for

### What does not belong in an agent

An agent must not define:

- Identity, expertise, tone, or voice; that belongs in the referenced `persona`
- A reusable process, workflow, or decision procedure; that belongs in the referenced `skill`(s)
- Presentation format or response layout; that belongs in the referenced `output-template`
- The actual text of a reusable instruction fragment; reference a `shared-block` by name instead of inlining it
- User-, project-, or domain-specific background; reserve this for a future `context` component
- Build tooling, assembly scripts, or provider-specific prompt syntax

## Required Front Matter

Every agent file must use the shared front matter schema and set:

```yaml
type: agent
```

The following shared fields are required:

- `name`
- `type`
- `version`
- `language`
- `status`

The following agent-specific fields are required:

- `persona` — the name of exactly one `persona` component this agent uses.
- `skills` — a list of one or more `skill` component names.

The following agent-specific fields are optional:

- `context` — a list of `context` component names. Reserved for V2; must stay empty or absent in V1.
- `outputs` — a list of `output-template` component names.
- `shared-blocks` — a list of `shared-block` component names.

The `tags` field is optional.

## Composition Order

Referenced components apply in this order:

```
persona + [context?] + skills + [outputs?]
```

- `persona` always comes first — it sets identity, tone, and expertise boundaries.
- `context` (when available) narrows the persona's scope before any skill runs.
- `skills` provide the process(es) the agent executes; list more than one only when they are meant to be used together in the same session.
- `outputs` shape how the result produced by the skill(s) is presented.

`shared-blocks` are cross-cutting rather than positional: each one is inserted according to its own `# Usage` instructions (see `conventions/skill.md` and the shared block itself). Unless a shared block states otherwise, insert it after the skill(s) and before the user's request.

## Required Sections

Every agent file must contain the following Markdown sections:

| Section         | Purpose                                                                                |
| --------------- | --------------------------------------------------------------------------------------- |
| `# Purpose`     | States what this specific combination of components is for, in one or two sentences.    |
| `# Composition` | Lists the referenced components in assembly order, with a one-line role for each.       |

## Optional Sections

An agent file may include the following sections when they add useful guidance:

| Section           | Use it for                                                                     |
| ------------------ | ------------------------------------------------------------------------------ |
| `# Notes`          | Maintainer notes, e.g. why specific components were chosen over alternatives.  |
| `# Compatibility`  | Known substitutions or variations (e.g. alternate skills or outputs) that also work with this agent. |

Do not add optional sections merely for completeness. Include them only when they reduce ambiguity or make the agent safer or easier to reuse.

## Example

The following example shows a complete agent composition:

```markdown
---
name: devops-mentor-agent
type: agent
version: "1.0"
language: en
status: draft
persona: devops-mentor
skills:
  - brainstorming-session
outputs:
  - session-summary
shared-blocks:
  - questioning
tags: [devops, mentoring]
---

# Purpose

Combine the DevOps Mentor persona with a brainstorming skill so the agent can
facilitate an idea-generation session about delivery or infrastructure
practices, then close with a clean session summary.

# Composition

1. `persona: devops-mentor` — sets identity, tone, and expertise boundaries.
2. `skills: brainstorming-session` — provides the ordered process this agent runs.
3. `outputs: session-summary` — shapes how the final result is presented.
4. `shared-blocks: questioning` — inserted after the skill so the agent asks
   focused clarifying questions before executing the process.

No `context` component is referenced; the persona's scope is specific enough
on its own.
```

## Relationship to Other Components

| Component | Role                                                     |
| --------- | --------------------------------------------------------- |
| `persona` | Defines identity and tone                                 |
| `context` | Narrows persona scope to a domain (V2 stub)                |
| `skill`   | Defines capability or process                              |
| `output`  | Defines presentation shape, per artifact type              |
| `shared`  | Reusable instruction fragment, inserted per its own usage rule |
| `agent`   | Declares which of the above combine, and in what order      |

An agent does not exist without a persona and at least one skill. Everything else it references is optional.

## Authoring Checklist

Before adding an agent, verify that:

- [ ] The file references exactly one `persona` and at least one `skill`.
- [ ] The agent does not inline the content of any referenced component.
- [ ] Optional references (`context`, `outputs`, `shared-blocks`) are used only when they add value.
- [ ] The front matter uses `type: agent`, with `persona` and `skills` set.
- [ ] `# Purpose` and `# Composition` are present and describe this specific combination, not a generic one.
- [ ] The composition order follows `persona + [context?] + skills + [outputs?]`, with shared blocks inserted per their own usage rules.
- [ ] The agent can be understood and manually assembled by a person without a build tool.
