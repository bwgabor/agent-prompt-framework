---
name: context
type: convention
version: "0.1"
language: en
status: stub
tags: [context, schema, conventions]
---

# Context Convention

> **Status: V2 stub.** This component is documented for future development.
> It is not implemented in V1 and no context files exist in this repository yet.

This document defines the intended role of the `context` component
in the Agent Prompt Framework.

## Definition

A context component narrows the scope of a persona to a specific domain,
topic area, or operating environment — without changing the persona's
identity, tone, or skills.

## Position in the Composition Model

```
persona + [context?] + [skills] + [mode?] + [outputs?]
```


Context sits between the persona and any applied skills.
It refines *who the agent is acting for* before specifying *what it does*.

## When Context Is Justified

Use a context component only when a persona's scope is too broad
to give useful, focused responses on its own.

A well-scoped persona often makes a separate context unnecessary.

**Example:**
- Persona: `General IT Engineer`
- Context: `Home Network`
- Effect: The engineer's knowledge and priorities are narrowed to
  home networking scenarios; unrelated enterprise or cloud topics
  are deprioritized.

## What Context Does Not Do

- Does not change the persona's identity, expertise, or voice
- Does not define skills, processes, or workflows
- Does not specify output format or presentation
- Does not substitute for a well-scoped persona

## Future Development (V2)

When implemented, a context file will likely define:

- A front matter schema (`type: context`)
- A required scope description
- Optional domain constraints or excluded topics
- Compatibility notes with specific personas

This design requires real usage patterns to validate before formalizing.