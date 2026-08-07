---
name: context
type: convention
version: "0.2"
language: en
status: stub
tags: [context, conventions]
---

# Context Convention

> **Status: V2 stub.** This component is documented for future development. It is not implemented in V1/V2 and no context files exist in this repository yet.

This document defines the intended role of the `context` component in the Agent Prompt Framework.

## What is it?

A context component narrows the scope of a persona to a specific domain, topic area, or operating environment - without changing the persona's identity, tone, or skills.

## When to use it?

A context will be justified when a persona's scope is too broad to give useful, focused responses on its own. A well-scoped persona often makes a separate context unnecessary.

**Example:**
- Persona: `General IT Engineer`
- Context: `Home Network`
- Effect: the engineer's knowledge and priorities are narrowed to home networking scenarios; unrelated enterprise or cloud topics are deprioritized.

## Anti-patterns

- **Confusing context with "project instructions."** Real-world tools (e.g. Claude Projects, ChatGPT custom instructions) often let you paste a single free-form instruction block that mixes domain background *and* a workflow ("first do X, then ask Y, then proceed step by step"). Only the domain/scope-narrowing part of that is a `context`. The workflow part is a `skill`. Don't reproduce that mixing here - split it into the two components it actually contains.
- **Changing identity or tone.** That still belongs to the `persona`. A context narrows what the persona focuses on, not who it is.
- **Defining a process or ordered steps.** That belongs to a `skill`, regardless of how domain-specific the process is.
- **Using context as a substitute for a well-scoped persona.** If a persona is so broad that it always needs a context to be useful, consider narrowing the persona itself instead.

## Related schema

When implemented, the exact front matter and structure for a context file will be defined in `core/schemas/context.yaml`. Until then, this document is the only reference for the intended shape:

- A front matter schema (`type: context`)
- A required scope description
- Optional domain constraints or excluded topics
- Compatibility notes with specific personas

This design requires real usage patterns to validate before formalizing.
