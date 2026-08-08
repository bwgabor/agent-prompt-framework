---
name: framework-builder
type: skill
version: "2.0"
language: hu
status: draft
tags: [generator, architect, meta, claude]
---

# Purpose

A felhasználó ötlete alapján a jelen Agent Prompt Framework szabályai szerint teljes, sémakompatibilis komponens-fájlt (persona, skill vagy shared-block) generál. Claude-specifikus felülírás: a `core/skills/framework-builder.md` V1-es, csak personát generáló, `type: mode` verziójával szemben ez a V2 `core/schemas/*.yaml` sémáknak megfelelő, és mindhárom komponenstípust támogatja.

# When to Use

Amikor a felhasználó egy új personát, skillt vagy shared-blockot szeretne létrehozni ehhez a framework-höz (jellemzően a `persona-architect` personával együtt hívva), vagy egy meglévő komponenst kell a séma szerint javítani/kiegészíteni.

# Inputs

- **Komponens típusa:** persona | skill | shared-block.
- **Rövid leírás:** mit csináljon / ki legyen a komponens (pl. "Python oktató persona", "code review skill").
- **(Opcionális) Specifikus elvárások:** különleges szabályok, kizárások, tónus.

# Process

1. **Tisztázás:** ha a bemenet hiányos vagy a típus nem egyértelmű, tégy fel legfeljebb 3 rövid kérdést.
2. **Séma betöltése:** azonosítsd a megfelelő `core/schemas/<típus>.yaml`-t, és olvasd ki belőle a kötelező front matter mezőket és az `x-sections` listát (kötelező és opcionális szekciók).
3. **Konvenció ellenőrzése:** nézd át a hozzá tartozó `core/conventions/<típus>.md`-t az anti-patternekért (pl. skillbe ne kerüljön identitás/tónus, personába ne kerüljön lépésenkénti folyamat).
4. **Front matter kitöltése:** `name` (kebab-case, egyedi), `type` (a séma `const` értéke), `version: "1.0"` új komponensnél, `language`, `status: draft`, `tags`.
5. **Szekciók megírása:** minden kötelező `x-sections` bejegyzéshez írj tartalmat a leírása alapján; opcionális szekciót csak akkor adj hozzá, ha ténylegesen több értéket ad.
6. **Önellenőrzés:** kötelező mezők/szekciók megvannak-e, nincs-e a sémában nem szereplő extra front matter mező (`additionalProperties: false`), a `version` illeszkedik-e a `^\d+\.\d+$` mintára.
7. **Átadás:** add vissza a kész fájlt a javasolt elérési úttal együtt.

# Expected Output

Egy (vagy több, ha a felhasználó több komponenst kért) teljes, a megfelelő `core/schemas/*.yaml` séma szerint érvényes markdown fájl - helyes front matter és minden kötelező szekció kitöltve -, készen arra, hogy bekerüljön a `core/<típus>/` vagy `platforms/<platform>/<típus>/` mappába.

# Constraints

- Ne generálj tényleges válaszokat az új persona/skill nevében - csak magát a komponens-definíciót készítsd el.
- Ne térj el a séma kötelező front matter mezőitől, és ne adj hozzá a sémában nem szereplő extra mezőt.
- Ha a kért `name` már létezik a `core/` vagy az adott `platforms/<platform>/` alatt, jelezd, mielőtt felülírnád.
- Ne fűzz a kimenethez bevezető vagy lezáró udvariassági szöveget - csak a generált fájl(ok) tartalma és célútvonala.

# References

- `core/schemas/persona.yaml`, `core/schemas/skill.yaml`, `core/schemas/shared-block.yaml`
- `core/conventions/persona.md`, `core/conventions/skill.md`, `core/conventions/shared-blocks.md`

# Compatibility

- `persona-architect` persona (tipikus meghívó, de bármelyik personával használható)
