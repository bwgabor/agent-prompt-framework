---
name: persona
type: convention
version: "1.0"
language: en
status: draft
tags: [personas, schema, conventions]
---

# Persona Convention

This document defines how to create and maintain `persona` components in the Agent Prompt Framework.

## Definition

A persona defines the persistent identity of an agent: its role, expertise scope, voice, and behavioural principles. It does not define processes, workflows, or output presentation.

## Scope

### What belongs in a persona

A persona defines the stable characteristics that shape how an agent operates. It may specify:

- The agent's role and intended contribution
- Its expertise scope and professional perspective
- Its working style, tone, and level of detail
- Behavioural rules and durable boundaries
- The long-term goal it helps the user achieve

### What does not belong in a persona

A persona must not define:

- A reusable process, ordered workflow, or decision procedure; use a `skill`
- Presentation format, response layout, or artifact structure; use an `output-template`
- User-, project-, or domain-specific background; reserve this for a future `context` component
- A temporary task-specific behavioural overlay; use a `mode`
- The composition of multiple components into a complete prompt; use an `agent`

## Required Front Matter

Every persona file must use the shared front matter schema and set:

```yaml
type: persona
```

The following shared fields are required:

- `name`
- `type`
- `version`
- `language`
- `status`

The `tags` field is optional.

## Required Sections

Every persona file must contain the following Markdown sections:

| Section           | Purpose                                                                                 |
| ----------------- | --------------------------------------------------------------------------------------- |
| `# Role`          | Defines who the agent is and the role it takes.                                         |
| `# Scope`         | Defines the topics, tasks, and responsibility area the persona covers.                  |
| `# Working Style` | Defines the persona's tone, communication preferences, and appropriate level of detail. |
| `# Rules`         | Defines durable behavioural constraints and principles.                                 |
| `# Goal`          | Defines the long-term outcome the persona helps the user achieve.                       |

## Optional Sections

A persona file may include the following sections when they add useful guidance:

| Section            | Use it for                                                                                     |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| `# Expertise`      | Specific knowledge areas, methods, or professional standards that sharpen the persona's scope. |
| `# Exclusions`     | Explicit responsibility boundaries, unsupported areas, or roles the persona must not assume.   |
| `# Example Prompt` | A short representative prompt showing the persona in use.                                      |

Do not add optional sections merely for completeness. Include them only when they reduce ambiguity or make the persona safer or easier to apply.

## Example

The following example shows the minimum structure of a persona:

```md
***
name: devops-mentor
type: persona
version: "1.0"
language: en
status: draft
tags: [devops, mentoring]
***

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

## Authoring Checklist

Before adding a persona, verify that:

- [ ] The file defines a persistent identity rather than a task-specific workflow.
- [ ] The persona has a clear role, scope, working style, rules, and goal.
- [ ] The persona does not prescribe output layout or presentation format.
- [ ] The persona does not contain a reusable process or ordered execution steps.
- [ ] The front matter uses `type: persona`.
- [ ] Optional sections reduce ambiguity rather than add filler.
- [ ] The persona can be combined with relevant skills, modes, contexts, and output templates without duplicating their responsibilities.