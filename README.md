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

Voer vanuit de map `Website` uit:

```powershell
python -m pip install -r requirements.txt
python -m mkdocs serve
```

De lokale versie is vervolgens standaard beschikbaar via `http://127.0.0.1:8000/`.

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

Bij de omzetting zijn de verwisselde laag- en hoogdoorlaatschema's uit de
bron gecorrigeerd. PDF-figuren zijn omgezet naar PNG; TikZ-schema's naar SVG.
De figuur- en vergelijkingsnummers gelden per webpagina.

## Publiceren

Wijzigingen die naar de GitHub-repository worden gepusht, kunnen via GitHub Pages worden gepubliceerd naar de bovenstaande website.
