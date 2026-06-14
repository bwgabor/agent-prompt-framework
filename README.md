# agent-prompt-framework

A Markdown-first framework for structuring AI agent personas, modes, output templates,
and shared instruction blocks — with a consistent YAML front matter schema.

Designed for manual use: copy a template, fill in your persona, combine with a mode
and output template, then paste the assembled prompt into any LLM.

---


## Repository structure

```text
agent-prompt-framework/
├── README.md
├── conventions/
│ ├── prompt-schema.md # Common front matter + type-specific schemas
│ └── output-strategy.md # Template vs. output rules, file naming
├── _template/
│ ├── persona.md
│ ├── modes/
│ │ ├── ideation.md
│ │ ├── project_planning.md
│ │ └── assisting.md
│ └── outputs/
│ └── idea-list.md
├── personas/ # Real personas go here (empty in V1)
├── shared/
│ └── blocks/
│ └── questioning.md # Reusable instruction blocks
└── outputs/ # Session artifacts go here (empty in V1)
```

---


## What's NOT in V1

- No real personas (only the `_template` starter files)
- No build tooling, CLI, or automation scripts
- No eval or registry integration

These are planned for future phases.

---


## How to use (preview)

1. Copy `_template/persona.md` → `personas/your-persona.md`
2. Fill in the front matter and persona body
3. Pick a mode from `_template/modes/`
4. Pick an output template from `_template/outputs/`
5. Assemble all three into a single prompt and paste into your LLM