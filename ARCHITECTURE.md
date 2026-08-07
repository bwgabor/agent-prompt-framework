# Architecture
 
Short-form record of the key architectural decisions behind the platform-configuration
system. This will be expanded in the README once all reorg phases (F1-F6) are complete.
 
## core/ + platforms/ separation
 
Shared components (personas, skills, shared-blocks, conventions, schemas) are defined
once in `core/`. Each platform only stores its overrides in `platforms/<platform>/`.
 
## Blueprint YAML
 
Each platform declares in `platforms/<platform>/blueprint.yaml` which core components
it uses and whether it overrides any of them — replacing the previous `agent.md`
bundle approach.
 
## Schema (YAML) vs. convention (MD)
 
`core/schemas/*.yaml` and `blueprint.schema.json` are machine-readable (validation,
IDE autocomplete). `core/conventions/*.md` documents the reasoning, anti-patterns, and
tutorials for humans.
 
## tests/ instead of outputs/
 
The `tests/` folder holds generated example outputs used to validate the framework —
they are test artifacts, not final deliverables.
 
## Override logic
 
If `platforms/<platform>/<component-type>/X.md` exists, it takes precedence over the
`core/` version of the same file.