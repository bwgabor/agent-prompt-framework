#!/usr/bin/env bash
set -e

# Leftover script eltávolítása (nem kellett volna a repóba kerülnie)
git rm f1-reorg.sh

# conventions/agent.md törlése (a blueprint veszi át a szerepét)
git rm core/conventions/agent.md

# ARCHITECTURE.md véglegesítése (sorvég-normalizálás miatti diff elfogadása)
git add ARCHITECTURE.md

git commit -m "chore: F1 cleanup - remove leftover script and conventions/agent.md"

echo "--- git status ---"
git status
echo "--- git log ---"
git log --oneline -5
