<!-- Concept voor volgend studiejaar; uitgesloten van de websitebuild. -->

# Practicum: Spectrometer week 2 - Absorptie en concentratiebepaling

## Leerdoelen

- Je kunt een meetplan maken voor absorptie- en transmissiemetingen.
- Je kunt met de in week 1 gebouwde en gekalibreerde spectrometer een absorptiespectrum meten.
- Je kunt met de complementaire kleur voorspellen in welk golflengtegebied sterke absorptie optreedt en dit met een absorptiespectrum onderzoeken.
- Je kunt een ijklijn maken en daarmee een onbekende concentratie bepalen.
- Je kunt meetgegevens analyseren in Python en resultaten met onzekerheden bespreken.

## Uitgangspunt

Je gebruikt de spectrometer en golflengtekalibratie uit week 1, met een **LED als lichtbron**. Met de complementaire kleur van de oplossing voorspel je waar je sterke absorptie verwacht. Vervolgens onderzoek je met de ijkreeks waar de absorptie maximaal is binnen het bruikbare meetbereik van de LED en de spectrometer.

!!! veiligheid "Veiligheid"

    De lenzen, spiegeltjes en overige optische onderdelen zijn erg duur en kwetsbaar. Ga hier voorzichtig mee om.

## Absorptie en transmissie van licht

In deze week gaan jullie metingen doen aan oplossingen van koper(II)sulfaat (\(\mathrm{CuSO_4}\)). Dit zout geeft in oplossing een heldere blauwe kleur. Omdat de oplossing blauw is, kan het absorptiespectrum worden voorspeld op basis van de complementaire kleur (zie [Appendix 3: Complementaire kleuren](#complementaire-kleuren)).

De transmissie \(T\) is:

\[
T=\frac{I}{I_0}.
\]

De absorbantie \(A\) wordt gedefinieerd met de logaritme met grondtal 10:

\[
A=-\log_{10}(T)=-\log_{10}\left(\frac{I}{I_0}\right).
\]

Meet \(I_0\) met een blanco (dezelfde cuvet met oplosmiddel) en \(I\) met de oplossing, bij dezelfde golflengte en instellingen. Corrigeer beide signalen voor de donkerachtergrond. Volgens de [wet van Beer–Lambert](https://goldbook.iupac.org/terms/view/B00626) is de absorbantie bij een vaste golflengte en weglengte evenredig met de concentratie, zolang de wet toepasbaar is.

Jullie meten verschillende concentraties \(\mathrm{CuSO_4}\)-oplossingen en onderzoeken het verband tussen concentratie en absorbantie. Met een ijklijn bepalen jullie uiteindelijk de concentratie van een onbekende oplossing.

!!! voorbereiding "Voorbereidingsopdracht week 2"

    1. Maak een meetplan voor het meten van een Cu(II)sulfaatoplossing met de door jullie gemaakte spectrometer. Het meetplan moet maximaal 1 pagina zijn en aanwezig zijn in het labjournaal.[^meetplan] Formuleer het hoofddoel/de onderzoeksvraag, geef een theoretische verwachting en maak een meetstrategie.
    2. Bepaal met de tabel met complementaire kleuren in welk golflengtegebied je sterke absorptie verwacht. Gebruik dit als voorspelling voor je metingen.
    3. Bereken de concentraties van de ijkreeks uit de verdunningstabel in Appendix 1. Hoe gaat je ijklijn eruitzien? Wat staat er op de x-as en y-as?
    4. Maak een Jupyter notebook waarin je een voorbeeldanalyse hebt uitgewerkt.

!!! opdracht "Opdracht 2(a)"

    1. Maak de ijkreeks volgens de verdunningstabel in Appendix 1. Gebruik demiwater als blanco.
    2. Meet met de LED het blancospectrum en de spectra van de ijkreeks. Corrigeer voor de donkerachtergrond en bereken de absorptiespectra. Zet deze in je labjournaal.
    3. Vergelijk de spectra met je voorspelling op basis van de complementaire kleur. Bepaal waar de absorptie maximaal is binnen het bruikbare meetbereik. Gebruik alleen golflengten waarbij de LED voldoende licht geeft en de gemeten signalen betrouwbaar zijn.
    4. Kies op basis hiervan een vaste golflengte voor de ijklijn. Bepaal bij diezelfde golflengte de absorbantie van alle oplossingen uit de ijkreeks en zet deze uit tegen de concentratie. Fit een ijklijn met Python (zie Appendix 2).
    5. Meet de onbekende oplossing bij dezelfde golflengte en instellingen. Bepaal met de ijklijn de concentratie, inclusief eenheid en onzekerheid.
    6. Houd je voortgang en de onderbouwing van je golflengtekeuze bij in het labjournaal.

!!! afronding "Afronding week 2"

    1. Zet de gemaakte figuren in je digitaal labjournaal en maak een duidelijk onderschrift.
    2. Vul de **Resultaat- en Discussie**-sectie aan. Vermeld de uiteindelijke waarde van jouw experiment (met onzekerheid) en bespreek of deze waarde **realistisch** en **betrouwbaar** is.

# Appendix 1: Materialen

## Materialenlijst (per groep)

De opgebouwde spectrometer uit week 1, met:

- 1× verstelbare dunne spleet
- 1× concave spiegel, \(f=15\,\mathrm{cm}\)
- 1× concave spiegel, \(f=10\,\mathrm{cm}\)
- 1× transmissietralie
- 1× camera (fotodetector)
- 1× LED-lichtbron
- 1× breadboard van 45×60 cm

Voor de oplossingen en absorptiemetingen:

- Cuvetten voor de blanco en de oplossingen
- Stockoplossing koper(II)sulfaat van 0,1 mol/L
- Demiwater
- Koper(II)sulfaatoplossing met onbekende concentratie
- Glaswerk om de volumes uit de onderstaande tabel af te meten en de oplossingen te bereiden

Stockoplossing koper(II)sulfaat: **0,1 M (0,1 mol/L)**.

| Cuvet nummer | 1 | 2 | 3 | 4 |
| --- | ---: | ---: | ---: | ---: |
| Stockoplossing koper(II)sulfaat (mL) | 0 | 20 | 40 | 60 |
| Demiwater (mL) | 100 | 80 | 60 | 40 |
| Concentratie (zelf uitrekenen in mol/L) | | | | |

# Appendix 2: Data fitten

```python
import numpy as np
from scipy.optimize import curve_fit

def linear(x, a, b):
    return a * x + b

xdata = np.array([1, 2, 3, 4, 5])
ydata = np.array([1.1, 1.9, 3.2, 3.9, 5.1])
yerr = np.array([0.1] * 5)

p0 = [1, 0]

popt, pcov = curve_fit(linear, xdata, ydata, sigma=yerr, p0=p0, absolute_sigma=True)

perr = np.sqrt(np.diag(pcov))
print("a =", popt[0], "+-", perr[0])
print("b =", popt[1], "+-", perr[1])
```

# Appendix 3: Complementaire kleuren {#complementaire-kleuren}

| \(\lambda\) geabsorbeerd | \(E\) (eV) | Geabsorbeerde kleur | Waargenomen kleur |
| ------------------------ | ---------: | ------------------- | ----------------- |
| \(>700\,\mathrm{nm}\)    |  \(<1.77\) | Infrarood           | Niet waarneembaar |
| 700–635 nm              | 1.77–1.95 | Rood                | Groen             |
| 635–590 nm              | 1.95–2.10 | Oranje              | Blauw             |
| 590–560 nm              | 2.10–2.21 | Geel                | Violet            |
| 560–520 nm              | 2.21–2.38 | Groen               | Rood              |
| 520–490 nm              | 2.38–2.53 | Cyaan               | Rood–oranje      |
| 490–450 nm              | 2.53–2.76 | Blauw               | Oranje            |
| 450–400 nm              | 2.76–3.10 | Violet              | Geel              |
| \(<400\,\mathrm{nm}\)    |  \(>3.10\) | Ultraviolet (UV)    | Niet waarneembaar |

[^meetplan]: Zie Brightspace voor een korte uitleg over een meetplan.
