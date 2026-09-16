# Practica Technische Natuurkunde – Jaar 2

Deze repository bevat het lesmateriaal voor de **practica van leerjaar 2 van Technische Natuurkunde aan de Hogeschool van Amsterdam (HvA)**.

De practicumwebsite is hier te vinden:

**[Practica Technische Natuurkunde – Jaar 2](https://hva-tn.github.io/Website-Practicum/)**

## Inhoud

Op de website vind je de algemene practicumregels, informatie over voorbereiding, het digitaal labjournaal, veiligheid, meetplannen en het gebruik van AI. Daarnaast bevat de website per onderwijsperiode de bijbehorende practica.

De practica zijn gericht op het steeds zelfstandiger uitvoeren van experimenteel onderzoek. Hierbij ligt de nadruk onder andere op:

* zorgvuldig en veilig werken in het laboratorium;
* gebruik van meetapparatuur en experimentele opstellingen;
* analyseren van meetgegevens en onzekerheden;
* fysisch interpreteren van resultaten;
* documenteren van experimenten in het digitaal labjournaal.

## Website lokaal draaien

De website is gebouwd met **MkDocs Material**. Na installatie van de benodigde packages kan de website lokaal worden gestart met:

Voer vanuit de hoofdmap van deze repository uit:

```powershell
python -m pip install -r requirements.txt
python -m mkdocs serve
```

De lokale versie is vervolgens standaard beschikbaar via `http://127.0.0.1:8000/`.

## Afbeeldingen en gegenereerde website

`docs/assets/` bevat de originele afbeeldingen. MkDocs kopieert die tijdens
`mkdocs build` naar `site/assets/`, zodat de gebouwde website zelfstandig kan
worden gepubliceerd. Dit is dus bronmateriaal plus bouwresultaat. Bewerk alleen
de afbeeldingen in `docs/assets/`; wijzigingen in `site/` worden bij een volgende
build overschreven.

`site/` staat in `.gitignore`, maar er zijn al eerder gegenereerde bestanden in
Git opgenomen. Een ignore-regel verwijdert bestaande bestanden niet uit Git.
Die bestaande bestanden zijn hier behouden; controleer vóór verwijdering of de
publicatie-inrichting ervan afhankelijk is. Nieuwe builds hoeven niet als
bronmateriaal te worden gecommit.

Alle hyperlinks openen een nieuw tabblad (of venster, afhankelijk van de browser),
ook interne navigatie en ankerlinks. Dit is centraal ingesteld in
`overrides/main.html` en `docs/javascript/links.js`, inclusief zoekresultaten.
De pagina `docs/code-snippets.md` bevat zelfstandig uitvoerbare Python-voorbeelden.

Controleer vóór publicatie de volledige website:

```powershell
python -m mkdocs build --strict
```

## Bronmateriaal en indeling

De indeling volgt `../Natuurkunde-practicum-2026-2027/Leerjaar2.tex`.
SEM-EDX hoort in periode 3. UV-VIS en dieetzout staan onder aanvullend
materiaal, omdat de hoofdhandleiding deze practica niet opneemt.
De bron `Practicum/Na2.2/Constante_planck.tex` en de bijbehorende bestaande
webpagina zijn leeg; de Planck-pagina wordt daarom niet gepubliceerd.

De practicumteksten staan in `docs`, de figuren in `docs/assets` en de
Arduino-downloads in `docs/downloads`. De pagina's zijn zelfstandig te
bewerken Markdown; wijzigingen in de LaTeX-bronnen worden niet automatisch
gesynchroniseerd. Behoud bij wijzigingen ook de veiligheidsinstructies,
voorbereiding, opdrachten, figuurverwijzingen en codevoorbeelden.

De verwisselde laag- en hoogdoorlaatschema's zijn gecorrigeerd in zowel de
LaTeX-bronnen als de website. De SVG's `lowpass.svg` en `highpass.svg` zijn
opnieuw opgebouwd uit de bijbehorende bestanden `Lowpass.tex` en `Highpass.tex`
in `../Natuurkunde-practicum-2026-2027/Practicum/Na2.3/Figuren/`.
Laagdoorlaat: R in serie, uitgang over C naar massa. Hoogdoorlaat: C in serie,
uitgang over R naar massa. PDF-figuren zijn omgezet naar PNG; TikZ-schema's naar SVG.
De figuur- en vergelijkingsnummers gelden per webpagina.

## Publiceren

Wijzigingen die naar de GitHub-repository worden gepusht, kunnen via GitHub Pages worden gepubliceerd naar de bovenstaande website.
