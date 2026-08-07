---
name: output
type: convention
version: "1.0"
language: en
status: draft
tags: [output, schema, conventions]
---

# Output Convention

This document defines how to create and maintain `output-template` components in the Agent Prompt Framework.

## Definition

An output is an optional presentation layer, defined per artifact type, that specifies how a content-level result should be structured, formatted, and presented, without prescribing the content or process that produces it.

## Scope

### What belongs in an output

An output template defines the presentation shape of one specific artifact type. It may specify:

- The purpose of that artifact type and when it applies
- Structural or content-level rules that any instance of it must follow
- Formatting rules: layout, headers, ordering, markup conventions
- A minimal illustrative template, when rules alone are not sufficient

### What does not belong in an output

An output must not define:

- Agent identity, expertise, tone, or voice; use a `persona`
- The reasoning process or steps used to produce the content; use a `skill`
- User-, project-, or domain-specific background; reserve this for a future
  `context` component
- File naming or folder placement; see `output-strategy.md`

## Required Front Matter

Every output template file must use the shared front matter schema and set:

```yaml
type: output-template
```

The following shared fields are required:

- `name`
- `type`
- `version`
- `language`
- `status`

The following output-specific fields are required:

- `format` — the syntax the artifact is written in: `markdown | yaml | json | plain | shell` etc.
- `strictness` — how rigid the shape is: `light | structured | strict`

The `tags` field is optional.

## Required Sections

Every output template file must contain the following Markdown sections:

| Section              | Purpose                                                                                   |
| -------------------- | ----------------------------------------------------------------------------------------- |
| `# Purpose`          | States what kind of result this output template shapes.                                   |
| `# Use When`         | Defines the condition or context that triggers this template.                             |
| `# Rules`            | States content-level or structural rules the artifact must follow, independent of format. |
| `# Formatting Rules` | States concrete formatting requirements: layout, ordering, markup, headers.               |

## Optional Sections

An output template file may include the following sections when they add useful guidance:

| Section               | Use it for                                                                                                                |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `# Required Sections` | Human readable outputs only; lists the mandatory headers or blocks the artifact must contain in table format, with notes. |
| `# Compatibility`     | Known or typical combinations with skills or personas.                                                                    |

### Template (nested under Formatting Rules)

`## Template` may appear as a sub-section under `# Formatting Rules`. Use it only when a formatting rule is difficult to express in prose alone. It holds
a short, illustrative code block, not real content. Do not add it merely to duplicate the `# Rules` or `# Required Sections` content.

Do not add optional sections merely for completeness. Include them only when they reduce ambiguity or make the template safer or easier to apply.

## Example

The following example shows a Markdown-based, strict output template:

```markdown
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

# Required Sections

| Section                         | Required | Notes                                           |
| ------------------------------- | -------- | ----------------------------------------------- |
| Steps Taken                     | yes      | Bullet list, chronological                      |
| DDecisions & Open Questions     | yes      | Bullet list, decisions and open questions       |
| Issues & Blockers               | yes      | Bullet list; state "no issues" if none occurred |

# Rules

- Cover only what actually happened in this task; do not speculate.
- Keep each bullet factual and specific enough to be useful without context.
- Do not include code comments or inline explanations.

# Formatting Rules

- Title is an H1 reading "Session összefoglaló" followed by the task date.
- The three required section names are bold text, not headers.
- No code comments anywhere in the body.
- Entire output is wrapped in a single markdown code block.

## Template

    # Session summary - {task date}

    **Steps Taken**
    - ...

    **Decisions & Open Questions**
    - ...

    **Issues & Blockers**
    - ...
```

## Relationship to Other Components

| Component | Role                                          |
| --------- | --------------------------------------------- |
| `persona` | Defines identity and tone                     |
| `skill`   | Defines capability or process                 |
| `output`  | Defines presentation shape, per artifact type |
| `mode`    | Frozen in V1; see mode convention             |

An agent does not require an output layer. Skills run without one by default.

## Authoring Checklist

Before adding an output template, verify that:

- [ ] The file describes the presentation shape of one specific artifact type.
- [ ] The output does not define persona identity, process steps, or domain context.
- [ ] The front matter uses `type: output-template`, with `format` and `strictness` set.
- [ ] All required sections are present.
- [ ] `# Required Sections` is included only for Markdown-based artifacts.
- [ ] A `## Template` sub-section is added only when formatting rules alone are insufficient.
- [ ] Optional sections add useful guidance rather than filler.
