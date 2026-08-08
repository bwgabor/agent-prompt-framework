# Architecture
 
Short-form record of the key architectural decisions behind the platform-configuration system. This will be expanded in the README once all reorg phases (F1-F6) are complete.
 
## core/ + platforms/ separation
 
Shared components (personas, skills, shared-blocks, conventions, schemas) are defined once in `core/`. Each platform only stores its overrides in `platforms/<platform>/`.
 
## Blueprint YAML
 
Each platform declares in `platforms/<platform>/blueprint.yaml` which core components it uses and whether it overrides any of them - replacing the previous `agent.md`
bundle approach.
 
## Schema (YAML) vs. convention (MD)
 
`core/schemas/*.yaml` and `blueprint.schema.json` are machine-readable (validation, IDE autocomplete). `core/conventions/*.md` documents the reasoning, anti-patterns, and tutorials for humans.
 
## tests/ instead of outputs/
 
The `tests/` folder holds generated example outputs used to validate the framework - they are test artifacts, not final deliverables.
 
## Override logic
 
If `platforms/<platform>/<component-type>/X.md` exists, it takes precedence over the `core/` version of the same file.
 
## Output assembly (components vs. outputs)
 
`components` declares what a platform uses; `outputs` (optional) decides how those components are merged into the platform's actual artifact files, for platforms whose slots don't match the default one-file-per-component layout.
 
- Default: every component gets its own file, named after it.
- If a component is referenced under an `outputs` key, it is merged into that target file instead of getting its own default file.
- The same component may be referenced under more than one `outputs` key - this is intentional repetition (e.g. the same skill copied into two ChatGPT project instruction files), not an error.
- `outputs` never contains literal prompt text, only `type:name` references to components already declared in `components` - this keeps all actual prompt content inside `core/` and `platforms/<platform>/`, never inside the blueprint itself.