---
name: shared-blocks
type: convention
version: "1.0"
language: en
status: draft
tags: [shared-blocks, conventions]
---

# Shared Block Convention

This document explains what a `shared-block` component is for and how to think about writing one. It does not enumerate the required front matter fields or Markdown sections - those are defined by the machine-readable schema at `core/schemas/shared-block.yaml` (see below).

## What is it?

A shared block is a short, reusable instruction fragment that can be inserted into any assembled prompt - regardless of persona or skill. It is the smallest reusable unit in the framework: not an identity, not a full process, just one focused piece of instruction.

## When to use it?

Create a shared block when you find yourself repeating the same short instruction across multiple personas, skills, or agents - for example "ask clarifying questions before proceeding" or "keep responses concise and structured." If the instruction is more than a few rules covering one narrow behaviour, it's probably a `skill`, not a shared block.

A good test: a shared block should make sense dropped into almost any prompt without modification. If it only makes sense combined with one specific persona or skill, it isn't reusable enough to be a shared block.

## Anti-patterns

- **Writing a multi-step process as a shared block.** If the block contains ordered stages with branching logic, it has outgrown the format - split it into a `skill`.
- **Bundling multiple unrelated behaviours into one block.** A shared block should do one thing (e.g. "ask clarifying questions"), not several ("ask clarifying questions AND format as a table AND stay concise"). Split unrelated behaviours into separate blocks so they can be combined independently.
- **Defining identity, tone, or expertise.** That's a `persona`'s job. A shared block only adds a behavioural instruction, it doesn't say who is speaking.
- **Leaving out placement guidance.** A shared block that doesn't say where in the assembled prompt it should go is hard to use correctly - always state where it's meant to be inserted relative to the persona, skill, and user request.

## Related schema

The exact required and optional front matter fields, and the required Markdown sections a shared block file must contain, are defined in `core/schemas/shared-block.yaml`. Validate new shared block files against that schema rather than relying on this document for structural rules.

## Example

````md
---
name: questioning
type: shared-block
version: "1.0"
language: en
status: stable
tags: [clarification, interaction, shared]
---

# Purpose

This block instructs the LLM to ask clarifying questions before proceeding, instead of making assumptions. Include it in any prompt where the user's request may be ambiguous or underspecified.

# Usage

Append this block to a persona or skill prompt, before the user's actual request. It takes effect for the current session until the user provides sufficient context.

Example placement in an assembled prompt:

```
[persona block]
[skill block]
[questioning block] ← insert here
[user request]
```

# Instructions

If the user's request is unclear or missing key information, ask at most 1–3 short, focused clarifying questions before proceeding. If a simple assumption resolves the ambiguity, state the assumption explicitly and proceed without asking.
````
