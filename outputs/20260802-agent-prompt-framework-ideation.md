# Agent Prompt Framework

## Cél

Egységes, Markdown-alapú prompt framework kialakítása, amely persona-kat, mode-okat, skill-eket és output template-eket egy közös séma és shared konvenciók szerint definiál. A V1 célja a keretrendszer, a sémák és egy starter kit szállítása - konkrét personák és tooling nélkül.

## Hatókör

- A `conventions/` alatt minden komponens típushoz (persona, skill, output, mode) létezik egyértelmű, egymással konzisztens konvenció.
- A `_template/` alatt minden komponens típushoz létezik újrafelhasználható, domain-független sablon.
- Az `outputs/` és `_template/outputs/` zónák elkülönülnek: az előbbi valós session artifact-okat, az utóbbi újrafelhasználható blueprint-eket tartalmaz.
- A V1 nem tartalmaz konkrét persona- vagy skill-implementációkat, csak a keretrendszert és egy minimális starter kit-et.

## Elfogadási kritériumok

- Minden komponens típus dokumentálja a saját front matter mezőit és kötelező szekcióit a shared séma alapján.
- Az output convention egyértelműen elkülöníti az output template-et a skill-től, persona-tól és agent-től.
- Legalább egy általános és egy konkrét output template létezik és megfelel a shared sémának.

## Kockázatok

- A komponens típusok (persona, skill, output, mode) határai átfedhetnek, ha a konvenciók nem elég élesen különítik el a felelősségi köröket.
- A fájlnevezési és mappázási szabályok (`output-strategy.md`) duplikálódhatnak az egyes convention fájlokban, ha nincs egyértelmű hivatkozási pont.
- A V1 hatókörének túllépése (konkrét personák, tooling bevonása) elodázhatja a keretrendszer szint lezárását.

## Tech stack

- Markdown alapú komponens fájlok, YAML front matter séma
- GitHub repo (`bwgabor/agent-prompt-framework`) verziókezelésre
- Notion projekt- és feladatkövetésre, session összefoglalókkal