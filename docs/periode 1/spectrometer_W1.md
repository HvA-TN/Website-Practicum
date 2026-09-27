<!-- Concept voor volgend studiejaar; uitgesloten van de websitebuild. -->

# Practicum: Spectrometer week 1 - Bouwen en kalibreren

## Leerdoelen

- Je kunt zelfstandig een onderzoeksvraag en (onderbouwde) verwachting opstellen over jouw experiment.
- Je bent in staat om een meetplan en experimentele opstelling te ontwerpen voor een relatief eenvoudig optica-experiment (spectrometer).
- Je kunt zelfstandig een optische opstelling bouwen vanuit een gegeven ontwerp.
- Basisvaardigheid in datamanipulatie, visualisatie én model toetsen in Python.

!!! veiligheid "Veiligheid"

    1. We werken dit practicum met spectraallampen; deze worden heet en kunnen niet warm opgeborgen worden.
    2. De lenzen, spiegeltjes en overige optische onderdelen zijn erg duur en kwetsbaar. Ga hier voorzichtig mee om.
    3. Dit practicum duurt twee weken; je hoeft de opstelling dus niet tussentijds af te breken.

## Introductie

De oorsprong van de spectroscopie ligt in het begin van de 19e eeuw. Isaac Newton had in de 17e eeuw al laten zien dat wit licht met behulp van een prisma in een spectrum uiteenvalt, maar pas veel later werd dit verschijnsel systematisch onderzocht. In 1802 beschreef William Hyde Wollaston donkere lijnen in het zonnespectrum. Enkele jaren later, in 1814, maakte Joseph von Fraunhofer nauwkeurige waarnemingen van deze lijnen. Hij ontwikkelde een verbeterde spectroscoop waarin een smalle spleet, een collimator en een prisma waren gecombineerd, waardoor een veel scherper spectrum zichtbaar werd. Fraunhofer kon hiermee honderden absorptielijnen in het zonlicht vastleggen, de later zogenoemde Fraunhoferlijnen. Deze uitvinding markeerde het begin van de spectroscopie als onderzoeksinstrument.

In bredere zin is een spectrometer een instrument waarmee het spectrum van een natuurkundige grootheid kan worden bepaald. Naast optische spectrometers bestaan er bijvoorbeeld massaspectrometers, NMR-spectrometers en Auger-elektronspectrometers. In dit experiment richten we ons op een optische spectrometer (spectrofotometer), waarmee zichtbaar licht kan worden geanalyseerd. Het principe berust erop dat licht in componenten van verschillende golflengtes wordt gescheiden. Op die manier kan informatie worden verkregen over de samenstelling en eigenschappen van materialen.

![Schematische weergave van een reflectiespectrometer.](../assets/periode 1/Spectrometer.jpg)

*Figuur: Schematische weergave van een reflectiespectrometer: licht gaat door een spleet, wordt via een holle spiegel parallel gemaakt, gescheiden door een tralie en opgevangen door een detector.*

In deze practicumreeks gaan jullie aan de slag met het opbouwen van een **transmissiespectrometer**, het kalibreren en doormeten van twee onbekende spectraallampen (week 1). In week 2 gaan jullie de spectrometer gebruiken voor het bepalen van de concentratie van een onbekende Cu(II)sulfaatoplossing.

!!! voorbereiding "Voorbereidingsopdracht week 1"

    1. Maak een meetplan voor het bouwen van een **transmissiespectrometer** van maximaal 1 pagina.[^meetplan] Formuleer een hoofddoel voor deze week en geef een korte theoretische onderbouwing over hoe je controleert of deze spectrometer dient te werken.
    2. Maak een schets van de **transmissiespectrometer** in PowerPoint of Inkscape.[^inkscape] Zet deze in jouw labjournaal.
    3. Maak een Jupyter notebook waarin het Python-script van de video-analyse klaarstaat. Je kunt de code van [deze GitHub-pagina](https://github.com/HvA-TN/Practica/tree/main/Practicum2_1) gebruiken.

## Theoretische achtergrond

Licht kan worden beschreven als een golf met een bepaalde golflengte \(\lambda\). Voor zichtbaar licht liggen deze golflengtes tussen ongeveer \(380\) en \(780\,\mathrm{nm}\). Een detector, zoals een camera, meet de intensiteit van dit licht: hoeveel licht er van een bepaalde golflengte aanwezig is.

Om wit licht te ontleden in zijn afzonderlijke golflengtes maken we gebruik van een tralie (*grating*). Door diffractie en interferentie wordt licht onder een hoek afgebogen die afhangt van de golflengte:

\[
\sin(\theta)=\frac{n\lambda}{d},
\]

Hier is \(n\) de orde van diffractie en \(d\) de afstand tussen twee tralielijnen. Deze vorm geldt bij loodrechte inval; \(\theta\) wordt gemeten ten opzichte van de normaal op het tralie.

In de spectrometer wordt het uitgespreide licht door de tralie op een camera geprojecteerd. Door posities op de detector te koppelen aan bekende golflengtes (ijking), kan de gemeten intensiteit worden weergegeven als functie van de golflengte: \(I(\lambda)\).

!!! opdracht "Opdracht 1(a)"

    1. Ga aan de slag met het bouwen van de spectrometer.
    2. Gebruik als lichtbron een LED-licht.
    3. Houd je voortgang bij in het labjournaal.

## Het ijken van de spectrometer

Bij het analyseren van lichtbronnen wordt vaak gebruikgemaakt van spectraallampen. Elke spectraallijn correspondeert met een specifieke elektronische overgang in het atoom of molecuul van het gebruikte gas.

![Het Bohrmodel.](<../assets/periode%201/Borh.png>)

*Figuur: Het Bohrmodel. Bij transitie van een elektron naar een andere baan komt er een specifieke kleur licht vrij: de spectraallijn.*

Een spectraallijn kan worden beschreven met een Lorentz-functie:[^lorentz]

\[
I(\lambda)=I_0\frac{\gamma^2}{(\lambda-\lambda_0)^2+\gamma^2}.
\]

Hierbij is \(\lambda_0\) de centrale golflengte, \(\gamma\) de halve breedte op halve hoogte en \(I_0\) de maximale intensiteit. Een eenvoudigere methode om pieken te vinden is het peak-detection-algoritme van SciPy.

```python
import numpy as np
from scipy.signal import find_peaks

# x en y zijn numpy arrays
peaks, _ = find_peaks(y, height=0)
peak_x = x[peaks]
peak_y = y[peaks]

print("Gevonden pieken:")
for xi, yi in zip(peak_x, peak_y):
    print(xi, yi)
```

Spectraallampen worden ook gebruikt om spectrometers te ijken. Met bekende referentielijnen kunnen posities op de detector worden gekoppeld aan golflengtes.

| x-pixel | Golflengte (nm) |
| ------: | --------------: |
|     100 |           430.3 |
|     500 |           589.0 |
|     900 |           706.5 |
|     ... |             ... |

Deze tabel is een fictief rekenvoorbeeld; gebruik voor de ijking je eigen gemeten pixelposities en bekende lijnen van de referentielamp. Een lineaire kalibratie is een benadering: controleer met meerdere lijnen of deze in het gebruikte bereik voldoende nauwkeurig is. Het model is:

\[
\text{Golflengte (nm)}=a\,\text{x-pixel}+b,
\]

waarbij \(a\) en \(b\) fitparameters zijn.

!!! opdracht "Opdracht 1(b)"

    1. Ga aan de slag met het ijken van de spectrometer.
    2. Meet het spectrum van een bekende lamp. Zet deze in je labjournaal.
    3. Bepaal van iedere emissielijn de pixelpositie van de piek met behulp van het peak-detection-algoritme van SciPy. Koppel deze posities aan bekende referentiegolflengten om de ijklijn te bepalen. Mocht dit te lastig zijn en kom je hier niet uit, probeer dan de locaties (x-pixels) op het oog te schatten.
    4. Houd je voortgang bij in het labjournaal.

Als je de spectrometer hebt geijkt, kun je jouw spectrometer gebruiken om ook van een onbekende lamp het spectrum te analyseren. Misschien lukt het jullie om op basis van de gemeten golflengten én tabel [spectraallijnen](#table-spectraallijnen-na-he-ne-hg) de juiste lamp te vinden.

!!! opdracht "Opdracht 1(c)"

    1. Meet de golflengten van de nieuwe lamp.
    2. Welke lamp(en) komen overeen met jouw gevonden golflengten?
    3. Houd je voortgang bij in het labjournaal.
!!! afronding "Afronding week 1"

    1. Zet de gemaakte figuren in je digitaal labjournaal en maak een duidelijk onderschrift.
    2. Vul de **Resultaat- en Discussie**-sectie aan. Vermeld de uiteindelijke waarde van jouw experiment (met onzekerheid) en bespreek of deze waarde **realistisch** en **betrouwbaar** is.

# Appendix 1: Materialen en tips

## Materialenlijst (per groep)

- 1× verstelbare dunne spleet
- 1× concave spiegel, \(f=15\,\mathrm{cm}\)
- 1× concave spiegel, \(f=10\,\mathrm{cm}\)
- 1× transmissietralie
- 1× camera (fotodetector)
- 1× LED-lichtbron
- 1× kwikspectraallamp per groep
- 1× neonspectraallamp per groep
- 1× natriumspectraallamp per groep
- 1× breadboard van 45×60 cm

## Tips

- Bepaal de onderlinge afstanden van alle componenten, beginnend bij de entreespleet en de eerste concave spiegel.
- Onderzoek op welke afstand de spiegels geplaatst moeten worden en hoe het licht optimaal op de tralie valt.
- Maak een schets van de stralengang.
- Zorg dat de opstelling op een breadboard van \(45\times60\,\mathrm{cm}\) past.

# Appendix 2: Spectraallijnen gasontladingslampen {#table-spectraallijnen-na-he-ne-hg}

![De sterke spectraallijnen van helium, neon, natrium en kwik.](../assets/periode 1/g4.svg)

| Na (nm) | He (nm) | Ne (nm) | Hg (nm) |
| ------: | ------: | ------: | ------: |
|   497.7 |   388.9 |   585.2 |   404.7 |
|   568.8 |   447.1 |   588.2 |   435.8 |
|   589.0 |   471.3 |   603.0 |   546.1 |
|   589.6 |   492.2 |   614.3 |   577.0 |
|   615.4 |   501.6 |   640.2 |   579.1 |
|   819.5 |   587.6 |   650.7 |   623.4 |
|         |   667.8 |   659.9 |   690.8 |
|         |   706.5 |   703.2 |   706.5 |
|         |         |   717.4 |         |
|         |         |   724.5 |         |
|         |         |   743.9 |         |
|         |         |   748.9 |         |
|         |         |   753.6 |         |
|         |         |   837.8 |         |

# Appendix 3: Data fitten

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

[^meetplan]: Zie Brightspace voor een korte uitleg over een meetplan.

[^inkscape]: Inkscape is bijzonder geschikt voor optische opstellingen. Zie de [GW Optics ComponentLibrary](https://www.gwoptics.org/ComponentLibrary/). Je moet deze bibliotheek download en openen, niet importeren.

[^lorentz]: Een Lorentz-profiel verschijnt bij resonanties doordat een aangeslagen toestand een beperkte levensduur heeft. Meer informatie staat bij [LibreTexts](https://chem.libretexts.org/Bookshelves/Physical_and_Theoretical_Chemistry_Textbook_Maps/Supplemental_Modules_(Physical_and_Theoretical_Chemistry)/Spectroscopy/Fundamentals_of_Spectroscopy/Lineshape_Functions).
