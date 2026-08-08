# platforms/claude

Ez a mappa a Claude platform-konfigurációját tartalmazza: a `blueprint.yaml`-t, ami megmondja, mely `core/` komponenseket használja Claude, és az esetleges Claude-specifikus override fájlokat.

## Mit tartalmaz

- **`blueprint.yaml`** — a Claude által használt personák, skillek, shared-blockok és output-template-ek listája. A `blueprint.schema.json` ellen validál.
- **`skills/framework-builder.md`** — Claude-specifikus override a `core/skills/framework-builder.md`-hez képest. A core verzió (V1, `type: mode`) csak personát generál; ez a V2-sémás (`type: skill`) változat personát, skillt és shared-blockot is tud generálni a framework szabályai szerint. Az override logika miatt (lásd `ARCHITECTURE.md`) ez a fájl felülírja a core verziót minden Claude-nak összeállított promptban, a többi platformot nem érinti.

## Mikor és hogyan módosítható

- Új komponens hozzáadásához bővítsd a `blueprint.yaml` `components` listáját a komponens `name` front matter értékével (nem a fájlnévvel).
- Ha egy meglévő core komponensnek Claude-specifikus verziója kell, hozz létre egy azonos nevű fájlt a megfelelő `platforms/claude/<típus>/` almappában — ez automatikusan felülírja a core verziót, nincs szükség a blueprint módosítására.
- Minden módosítás után validáld a `blueprint.yaml`-t a `blueprint.schema.json` ellen, és ellenőrizd, hogy minden hivatkozott komponens létezik a `core/`-ban vagy felül van írva itt.
- A tényleges promptba történő összeállítás (assembly / build lépés) egyelőre kézi, ezt egy későbbi fázis automatizálja majd.
