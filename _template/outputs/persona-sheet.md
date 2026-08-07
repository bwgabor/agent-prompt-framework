---
name: persona-sheet
type: output-template
version: "1.0"
language: hu
status: draft
format: markdown
tags: [output, template, architect, summary]
---

# Purpose

Ezt a sablont a Persona Architect használja arra, hogy a legenerált persona csomagot egy strukturált, egyoldalas (one-pager) formátumban foglalja össze a felhasználó számára.

# Structure

# 🧑‍💻 {Persona Neve} - Persona Sheet

**Azonosító:** `{persona-id}` | **Nyelv:** `{nyelv}` | **Státusz:** `{status}`

## 📄 Összefoglaló (Goal)
> {Az új persona egyetlen mondatos célja}

## 📂 Generált Fájlok
- `personas/{persona-id}/persona.md`
- `personas/{persona-id}/modes/{mode-neve}.md`
- `personas/{persona-id}/outputs/{output-neve}.md`

## 🎯 Identitás és Fókusz
- **Role:** {Szerepkör esszenciája 1-2 mondatban}
- **In-Scope:** {Legfontosabb támogatott témák vesszővel elválasztva}
- **Out-of-Scope:** {Kizárt témák vesszővel elválasztva}

## ⚠️ Szigorú Szabályok (Top 3)
1. {Legfontosabb szabály}
2. {Második legfontosabb szabály}
3. {Harmadik legfontosabb szabály}

## 🔗 Ajánlott Shared Blokkok
- `{shared-block-1}`: {Rövid indoklás, miért hasznos ehhez a personához}
- `{shared-block-2}`: {Rövid indoklás}

# Usage Notes

- Ezt a nézetet mindig a fájlok tényleges kódtömbjei (code block) után generáld le, mintegy összefoglalóként.
- A `{}` közötti helyőrzőket cseréld ki az újonnan generált persona valós adataira.