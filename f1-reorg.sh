#!/usr/bin/env bash
# F1 - Mappastruktúra átszervezése
# Futtasd Git Bash-ben a repo gyökeréből: D:\Projektek\agent-prompt-framework
set -e

# 0. Takarítás: a sandboxban véletlenül keletkezett teszt-fájlok törlése
rm -f testfile456 anotherfile.txt renametest2.txt
rm -rf testdir123

# 1. Meglévő, nem commitolt tartalmi módosítások külön commitba
git add -A
git commit -m "chore: pending content updates before F1 folder reorg"

# 2. Alap mappák
mkdir -p core

# 3. Meglévő tartalom átnevezése core/ alá
git mv personas core/personas
git mv skills core/skills
git mv shared-blocks core/shared-blocks
git mv conventions core/conventions

# 4. core/schemas létrehozása (üres, .gitkeep-pel)
mkdir -p core/schemas
touch core/schemas/.gitkeep
git add core/schemas/.gitkeep

# 5. _template/outputs/*.* -> core/outputs/
mkdir -p core/outputs
git mv _template/outputs/idea-list.md core/outputs/idea-list.md
git mv _template/outputs/persona-sheet.md core/outputs/persona-sheet.md
git mv _template/outputs/project-datasheet.md core/outputs/project-datasheet.md
rmdir _template/outputs

# 6. _template/modes/*.* -> core/skills/
git mv _template/modes/framework-builder.md core/skills/framework-builder.md
git mv _template/modes/ideation.md core/skills/ideation.md
rmdir _template/modes

# 7. outputs/ -> tests/
git mv outputs tests

# 8. _template/ -> templates/
git mv _template templates

# 9. platforms/ mappák létrehozása .gitkeep-pel
mkdir -p platforms/claude platforms/chatgpt platforms/perplexity platforms/gemini platforms/manus platforms/copilot platforms/grok
for d in claude chatgpt perplexity gemini manus copilot grok; do
  touch platforms/$d/.gitkeep
done
git add platforms

# 10. conventions/agent.md törlése (a blueprint veszi át a szerepét)
git rm core/conventions/agent.md

# 11. ARCHITECTURE.md stub létrehozása
cat > ARCHITECTURE.md << 'EOF'
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
EOF
git add ARCHITECTURE.md

# 12. Ellenőrzés
echo "--- git status ---"
git status
echo "--- tree ---"
tree -L 3 -I '.git'

# 13. Végső commit
git commit -m "refactor: F1 - mappastruktúra átszervezése (core/, platforms/, templates/, tests/)"

echo "Kész. Ellenőrizd a 'git log --stat -1' és 'git status' kimenetét."
