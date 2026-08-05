---
name: prompt-schema
type: convention
version: "1.0"
language: en
status: stable
tags: [schema, front-matter, conventions]
---


# Prompt Schema - Agent Prompt Framework

This document defines the shared YAML front matter schema and the
type-specific content schemas for all files in this framework.


---


## Shared Front Matter (all file types)

Every file in this framework - regardless of type - must include
the following YAML front matter block at the top.

| Field      | Type   | Required   | Description                                                                         |
| ---------- | ------ | ---------- | ----------------------------------------------------------------------------------- |
| `name`     | string | yes        | Unique identifier of the file (kebab-case)                                          |
| `type`     | string | yes        | One of: `persona`, `skill`, `output-template`, `shared-block`, `agent`, `convention` |
| `version`  | string | yes        | Semantic version string, e.g. `"1.0"`                                               |
| `language` | string | yes        | ISO 639-1 code, e.g. `en`, `hu`                                                     |
| `status`   | string | yes        | One of: `draft`, `stable`, `deprecated`                                             |
| `tags`     | list   | optional   | Free-form keywords for filtering/searching                                          |

Some types require additional front matter fields beyond the shared set. These are documented in the type's own schema section below (see `output-template`).


**Example:**

```yaml
---
name: devops-mentor
type: persona
version: "1.0"
language: en
status: stable
tags: [devops, mentoring, tutorial]
---
```


---


## Type-Specific Schemas

### `convention`

Defines the documentation rules for creating and maintaining a framework component type.

| Heading                    | Required | Notes                                                            |
| -------------------------- | -------- | ---------------------------------------------------------------- |
| `# [Component] Convention` | yes      | Names the component type governed by the document.               |
| `## Definition`            | yes      | Defines the component's purpose in one concise statement.        |
| `## Scope`                 | yes      | States what belongs in the component and what does not.          |
| `## Required Front Matter` | optional | Use when the component has file-level front matter requirements. |
| `## Required Sections`     | optional | Use when the component has mandatory Markdown sections.          |
| `## Optional Sections`     | optional | Use when the component supports documented optional sections.    |
| `## Example`               | optional | A minimal representative component example.                      |
| `## Authoring Checklist`   | optional | Verification criteria for authors before adding a component.     |


---


### `persona`

Defines the identity, tone, and expertise of an AI agent.

| Heading            | Required | Notes                                                                                         |
| ------------------ | -------- | --------------------------------------------------------------------------------------------- |
| `# Role`           | yes      | One-paragraph description of who this is                                                      |
| `# Scope`          | yes      | What topics/tasks this persona covers                                                         |
| `# Working Style`  | yes      | Tone, format preferences, level of detail                                                     |
| `# Rules`          | yes      | Hard constraints (what to avoid, how to behave)                                               |
| `# Goal`           | yes      | What the persona ultimately helps achieve                                                     |
| `# Expertise`      | optional | Specific knowledge areas, methods, or professional standards that sharpen the persona's scope |
| `# Exclusions`     | optional | Explicit responsibility boundaries, unsupported areas, or roles the persona must not assume   |
| `# Example Prompt` | optional | A short sample prompt showing the persona in use                                              |


---


### `output-template`

A presentation-layer template that defines how one specific artifact type should be structured and formatted, independent of the content or process that produces it.

**Additional required front matter fields:**

| Field        | Type   | Required | Description                                                                     |
| ------------ | ------ | -------- | ------------------------------------------------------------------------------- |
| `format`     | string | yes      | Syntax the artifact is written in: `markdown \| yaml \| json \| plain \| shell` |
| `strictness` | string | yes      | How rigid the shape is: `light \| structured \| strict`                         |

| Heading               | Required | Notes                                                                |
| --------------------- | -------- | -------------------------------------------------------------------- |
| `# Purpose`           | yes      | What kind of result this template shapes                             |
| `# Use When`          | yes      | The condition or context that triggers this template                 |
| `# Rules`             | yes      | Content-level or structural rules, independent of format             |
| `# Formatting Rules`  | yes      | Concrete formatting requirements: layout, ordering, markup, headers  |
| `# Required Sections` | optional | Human readable outputs only; mandatory headers or blocks, with notes |
| `# Compatibility`     | optional | Known combinations with skills or personas                           |

Front matter for this type also requires `format` (`markdown \| yaml \| json \| plain \| shell`) and `strictness` (`light \| structured \| strict`), in addition to the shared fields.


---


### `shared-block`

A reusable instruction fragment that can be embedded into any prompt.

| Heading          | Required | Notes                                  |
| ---------------- | -------- | -------------------------------------- |
| `# Purpose`      | yes      | What this block does when included     |
| `# Usage`        | yes      | Where/how to insert it into a prompt   |
| `# Instructions` | yes      | The actual instruction text to include |
| `# Constraints`  | optional | Edge cases or limitations              |


---


### `skill`

A self-contained, reusable capability or repeatable process.

| Heading             | Required | Notes                                                                          |
| ------------------- | -------- | ------------------------------------------------------------------------------ |
| `# Purpose`         | yes      | The capability or process the skill provides                                   |
| `# When to Use`     | yes      | Situations in which the skill is applicable                                    |
| `# Inputs`          | yes      | Information required to run the process                                        |
| `# Process`         | yes      | Ordered steps or an adaptable workflow                                         |
| `# Expected Output` | yes      | Expected content-level result; does not prescribe presentation format          |
| `# Constraints`     | optional | Process-specific limits, exclusions, and guardrails                            |
| `# Examples`        | optional | Short, representative examples of using the skill                              |
| `# References`      | optional | External sources or related files in this repository                           |
| `# Compatibility`   | optional | Known combinations with personas, outputs, shared blocks, or future components |


---


### `agent`

A declarative composition manifest that assembles a persona with one or more skills - and optionally context, output templates, and shared blocks - without duplicating the content of the referenced components.

**Additional required front matter fields:**

| Field     | Type   | Required | Description                                             |
| --------- | ------ | -------- | ------------------------------------------------------- |
| `persona` | string | yes      | Name of exactly one `persona` component this agent uses |
| `skills`  | list   | yes      | Names of one or more `skill` components this agent uses |

**Additional optional front matter fields:**

| Field           | Type | Description                                                         |
| --------------- | ---- | ------------------------------------------------------------------- |
| `context`       | list | Names of `context` components. Reserved for V2; empty/absent in V1. |
| `outputs`       | list | Names of `output-template` components                               |
| `shared-blocks` | list | Names of `shared-block` components                                  |

| Heading           | Required | Notes                                                                      |
| ----------------- | -------- | -------------------------------------------------------------------------- |
| `# Purpose`       | yes      | What this specific combination of components is for                        |
| `# Composition`   | yes      | The referenced components in assembly order, with a one-line role for each |
| `# Notes`         | optional | Maintainer notes, e.g. why specific components were chosen                 |
| `# Compatibility` | optional | Known substitutions or variations that also work with this agent           |

Composition order: `persona + [context?] + skills + [outputs?]`. Referenced `shared-blocks` are inserted per their own `# Usage` instructions, typically after the skill(s) and before the user's request.