---
name: skill
type: convention
version: "1.0"
language: en
status: draft
tags: [skills, schema, conventions]
---

# Skill Convention

This document defines how to create and maintain `skill` components in the Agent Prompt Framework.

## Definition

A skill is a self-contained, reusable capability or repeatable process that defines the required inputs, execution process, and expected content-level result.

## Scope

### What belongs in a skill

A skill defines a reusable capability or repeatable process. It may specify:

- Required inputs and their role in the process
- Ordered steps or an adaptable workflow
- Decision criteria and process-specific constraints
- The expected content-level result

### What does not belong in a skill

A skill must not define:

- Agent identity, expertise, tone, or voice; use a `persona`
- User-, project-, or domain-specific background; reserve this for a future `context` component
- Presentation format or response layout; use an `output-template`
- A short standalone instruction fragment; use a `shared-block`

## Required Front Matter

Every skill file must use the shared front matter schema and set:

```yaml
type: skill
```

The following shared fields are required:

- `name`
- `type`
- `version`
- `language`
- `status`

The `tags` field is optional.

## Required Sections

Every skill file must contain the following Markdown sections:

| Section | Purpose |
| --- | --- |
| `# Purpose` | States the capability or process the skill provides. |
| `# When to Use` | Defines the situations in which the skill is applicable. |
| `# Inputs` | Describes the information required to run the process. |
| `# Process` | Defines ordered steps or an adaptable workflow. |
| `# Expected Output` | Describes the expected content-level result, without prescribing its presentation format.

## Optional Sections

A skill file may include the following sections when they add useful guidance:

| Section | Use it for |
| --- | --- |
| `# Constraints` | Process-specific limits, exclusions, and guardrails. |
| `# Examples` | Short, representative examples of using the skill. |
| `# References` | External sources or related files in this repository. |
| `# Compatibility` | Known combinations with personas, outputs, shared blocks, or future components. |

Do not add optional sections merely for completeness. Include them only when they reduce ambiguity or make the skill safer or easier to apply.

## Example

The following example shows the minimum structure of a process-type skill:

```markdown
***
name: brainstorming-session
type: skill
version: "1.0"
language: en
status: draft
tags: [ideation, process]
***

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

## Authoring Checklist

Before adding a skill, verify that:

- [ ] The file describes a reusable capability or repeatable process.
- [ ] The skill does not define persona identity, context, or presentation rules.
- [ ] The front matter uses `type: skill`.
- [ ] All required sections are present.
- [ ] Optional sections add useful guidance rather than filler.
- [ ] The process is specific enough to apply and flexible enough for relevant variations.
- [ ] The expected output describes content-level results rather than Markdown or layout requirements.