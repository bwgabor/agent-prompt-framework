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
| `type`     | string | yes        | One of: `persona`, `skill`, `output-template`, `shared-block`, `convention` |
| `version`  | string | yes        | Semantic version string, e.g. `"1.0"`                                               |
| `language` | string | yes        | ISO 639-1 code, e.g. `en`, `hu`                                                     |
| `status`   | string | yes        | One of: `draft`, `stable`, `deprecated`                                             |
| `tags`     | list   | optional   | Free-form keywords for filtering/searching                                          |


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

A reusable template that defines the structure of a specific output artifact.

| Heading         | Required | Notes                                                      |
| --------------- | -------- | ---------------------------------------------------------- |
| `# Purpose`     | yes      | What artifact this template produces                       |
| `# format`      | yes      | One of: `markdown`, `json`, `text`                         |
| `# Structure`   | yes      | The actual template body (use placeholders like `{topic}`) |
| `# Usage Notes` | optional | When to use this template and when not to                  |


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