# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`mayfirst` ist ein kleines, rein statisches Test-Projekt (HTML/CSS/JavaScript, ohne Build-Tooling und ohne Abhängigkeiten). Der UI-Text ist auf Deutsch — neue UI-Strings ebenfalls auf Deutsch verfassen. Code-Identifier bleiben Englisch.

## Struktur

- `index.html` — einzige Seite, lädt `styles.css` und `app.js` per `<link>`/`<script src>` (keine Module).
- `styles.css` — globale Styles, Design-Tokens als CSS-Custom-Properties auf `:root`.
- `app.js` — gesamtes Verhalten in einer IIFE; greift per `getElementById` auf die in `index.html` definierten IDs zu. Wenn IDs in `index.html` umbenannt/entfernt werden, muss `app.js` synchron angepasst werden.

## Lokal ausführen

Da kein Build-Schritt existiert, reicht es, `index.html` direkt im Browser zu öffnen. Falls etwas einen HTTP-Kontext erfordert (z. B. `fetch` auf lokale Dateien), genügt ein einfacher Server, z. B. `python3 -m http.server`.

Es gibt **keine** `package.json`, kein Lint-Setup und keine Tests. Solche Tooling-Schritte erst hinzufügen, wenn ausdrücklich gewünscht — und diese Datei dann entsprechend aktualisieren.

## Konventionen

- HTML semantisch halten (`<main>`, `<section>`, `<output>`, `aria-live` für dynamische Werte).
- Keine externen Abhängigkeiten oder CDNs hinzufügen, ohne dies vorher zu klären — das Projekt soll bewusst dependency-frei bleiben.
- Branch-Konvention für KI-gestützte Änderungen: auf den vom Task vorgegebenen Branch pushen (aktuell `claude/add-claude-documentation-188mL`) und einen Draft-PR öffnen.
