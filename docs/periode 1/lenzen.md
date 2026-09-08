# Practicum: Bepaling van de brandpuntsafstand van een onbekende lens

## Leerdoelen

- Begrip van het belang van het gebruik van een (digitaal) labjournaal bij natuurkundig onderzoek.
- Zelfstandig kunnen bijhouden van een (digitaal) labjournaal in natuurkundepractica.
- Begrip van en toepassen van de lenzenformule.
- Basisvaardigheid in datamanipulatie en visualisatie in Python.

!!! veiligheid "Veiligheid"

    1. We werken dit practicum met lenzen en LED-lampen. Ga voorzichtig om met de lenzen en pas op voor de LED-lampen; deze kunnen heet worden en mogen niet warm opgeborgen worden.
    2. De LED-lamp kan maximaal **12 volt** aan!

## Introductie

Al sinds de oudheid gebruiken mensen lenzen om beelden te vergroten of scherp te stellen. De oude Grieken en Romeinen kenden al glaskogeltjes die het licht bundelden, en in de middeleeuwen verschenen de eerste brillen. In de 17e eeuw werden brillen en lenzen steeds verfijnder, en in die tijd begon men microscopen en telescopen te ontwikkelen. Een van de bekendste Nederlanders, Antoni van Leeuwenhoek, bouwde met zelfgeslepen lenzen ontzettend sterke microscopen.[^leeuwenhoek] Zie de onderstaande figuur.

![Een replica van één van de eerste microscopen van Antoni van Leeuwenhoek.](../assets/periode%201//Leeuwenhoek_microscoop.png)

*Figuur: Een replica van één van de eerste microscopen van Antoni van Leeuwenhoek.*

Met deze microscopen werden voor het eerst bacteriën, spiervezels en bloedcellen ontdekt. Zijn werk markeert het begin van de microscopie, en laat zien hoe een relatief eenvoudige lens tot grote wetenschappelijke ontdekkingen kan leiden.

De werking van een lens is in essentie eenvoudig: een lens buigt lichtstralen af doordat het licht bij de overgang van lucht naar glas (of andersom) van richting verandert. Hierdoor kunnen lichtstralen die uit één punt van een voorwerp komen, weer in één punt samenkomen: het beeldpunt. Hoe sterk een lens lichtstralen bundelt of spreidt, wordt bepaald door de *brandpuntsafstand* \(f\).

De wiskundige relatie tussen voorwerpafstand \(v\), beeldafstand \(b\) en brandpuntsafstand \(f\) staat bekend als de *lenzenformule*:

\[
\frac{1}{f}=\frac{1}{v}+\frac{1}{b}.
\]

In dit practicum ga je deze relatie zelf onderzoeken. Door voor verschillende voorwerpsafstanden \(v\) de bijbehorende beeldafstanden \(b\) te meten, kun je de brandpuntsafstand van een onbekende lens afleiden. Op deze manier volg je in zekere zin de voetsporen van Van Leeuwenhoek: met een lens de wereld op een nieuwe manier zichtbaar maken.

!!! voorbereiding "Voorbereidingsopdracht 1"

    1. Neem een laptop mee.
    2. Zorg voor een goede installatie van Python en Jupyter notebooks.

!!! opdracht "Opdracht 1(a)"

    Meet voor verschillende voorwerpsafstanden \(v\) de bijbehorende beeldafstanden \(b\) en vergrotingen.

    1. Noteer bij elke meting ook de meetfout \(\sigma_b\).
    2. Leg uit hoe je de grootte van \(\sigma_b\) hebt bepaald. Hoe kun je deze nauwkeuriger bepalen?
    3. Noteer deze gegevens in je Digitaal Labjournaal.

    **Tip!** Gebruik de onderstaande code en plak deze in je labjournaal.

```python title="Data invoeren"
import numpy as np

# meetwaarden
b = np.array([])
v = np.array([])
b_err = np.array([])
```

!!! opdracht "Opdracht 1(b)"

    Maak in Python een grafiek waarin je \(b\) uitzet tegen \(v\). Voeg duidelijke labels en eenheden toe.

    **Tip!** Gebruik de onderstaande code en plak deze in je labjournaal.

```python title="Grafiek maken"
import matplotlib.pyplot as plt

# plotten
plt.errorbar(v, b, yerr=b_err, fmt='o')
plt.xlabel("v (m)")
plt.ylabel("b (m)")
plt.show()
```

Zoals je kunt zien in het figuur is er een duidelijk, maar soms ook verwarrend, verband tussen de beeldafstand en de voorwerpsafstand. De lenzenformule

\[
\frac{1}{f} = \frac{1}{v} + \frac{1}{b},
\]

geeft echter niet direct het verband aan tussen \(b\) en \(v\).

!!! opdracht "Opdracht 1(c)"

    1. Herschrijf de lensvergelijking zodat \(b\) wordt uitgedrukt als functie van \(v\) en \(f\).
    2. Gebruik onderstaande Python-code en vul deze correct aan.
    3. Noteer je afleiding in je Digitaal Labjournaal.

```python title="Functie maken"
def beeldafstand(v, f):
    return (...)
```

!!! opdracht "Opdracht 1(d)"

    1. Maak een array die loopt van 0 tot 1 meter in stapjes van 1 cm.
    2. Teken de functie van de *beeldafstand* voor verschillende waarden van de brandpuntsafstand \(f\). Welke waarde komt het meest overeen met de onbekende lens?

```python title="Lineaire span"
v_fit = np.linspace(0, 1, 101)  # in meters
```

Het invullen van verschillende waarden van *f* en het vervolgens tekenen van meerdere lijnen werkt niet erg efficiënt. Vaak levert dit alleen een ruwe schatting van de parameter op.[^eyeballing] Daarnaast wordt de onzekerheid in de datapunten niet meegenomen, terwijl de metingen bij grote beeld- en voorwerpsafstanden juist preciezer zijn. Er bestaan complexe methoden waarmee via de omgeschreven formule *f* direct kan worden bepaald, inclusief foutanalyse. Echter, deze zijn voor dit moment te complex en hierin gaan we bij wiskunde 2.1 verder. Om toch een betere schatting te maken, maken we ditmaal gebruik van een slimme truc: *linearizeren*. Hierbij schrijven we een niet-lineaire functie om tot een lineaire vorm. Deze truc is bij veel wiskundige functies toepasbaar en staat bekend als *inverteerbaarheid*.

!!! opdracht "Opdracht 1(e)"

    1. Maak een nieuwe grafiek waarbij je \(1/b\) uitzet tegen \(1/v\).
    2. Schrijf de lenzenformule om in de vorm

       \(
       \frac{1}{b} = f(v,f)
       \)

    3. Maak een nieuwe functie genaamd *lineair*, waarbij je de functie van de vorige deelopdracht invult.
    4. Wat valt je op aan de grafiek? Wat is de betekenis van het snijpunt met de y-as?
    5. Voeg nu enkele lijnen toe met verschillende waarden van de brandpuntsafstand \(f\).

```python title="Functie maken"
def lineair(v, f):
    return (...)
```

Zoals je misschien hebt opgemerkt, ziet de grafiek er nu aanzienlijk beter uit. De vraag blijft echter wat het snijpunt met de y-as betekent en welke waarde hier precies bij hoort. Om dit op een natuurkundig correcte manier uit te werken, gebruiken natuurkundigen vaak modellen. In dit geval is dat natuurlijk de functie `lineair`.

Nu moeten we ons model nog toetsen (*fitten*!) aan de gemeten data. Dit is in principe een optimalisatieprobleem: we moeten de fitwaarde *f* zo kiezen dat de afwijkingen tussen model en meting zo klein mogelijk zijn.[^fitten] Hiervoor maken we gebruik van de rekenkracht van Python, met de wetenschappelijke module scipy.

```python title="Data fitten"
from scipy.optimize import curve_fit

# Schatting van parameters
p0 = [1]  # eerste schatting van f, 1 meter

# aanroepen fit
popt, pcov = curve_fit(lineair, 1/v, 1/b, sigma=(...), p0=p0)

# resultaat printen
print("$f$ =", popt, "+-", np.sqrt(pcov))
```

!!! opdracht "Opdracht 1(f)"

    1. Bereken de fout op \(\frac{1}{b}\), gebruik hiervoor de relatieve fout van \(b\). Als dit niet lukt, sla deze stap dan over.
    2. Bepaal \(f\) door middel van een fit, gebruik hiervoor de *scipy*-module. Mocht het bepalen van de fout in de vorige opdracht niet gelukt zijn, verwijder dan de regel `sigma = (...)`.
    3. Wat is de gevonden waarde voor *f*, en welke onzekerheid hoort hierop?

!!! afronding "Afronding"

    1. Zet de gevonden figuren in je digitaal labjournaal en maak een duidelijk onderschrift waarin je uitlegt wat de figuren laten zien.
    2. Vul de **Resultaat- en Discussie**-sectie aan in je labjournaal. Hierin moet de uiteindelijke waarde van \(f\) (met onzekerheid) staan en een korte discussie of deze waarde **realistisch** en **betrouwbaar** is.

## Appendix: data fitten met `curve_fit`

Wanneer je meetpunten hebt \((x_i, y_i)\) met meetfouten \(\sigma_i\), wil je vaak een model \(y(x;\theta)\) vinden dat de data zo goed mogelijk beschrijft. Hierbij zijn \(\theta\) de onbekende parameters (bijvoorbeeld een brandpuntsafstand \(f\), of de richtingscoëfficiënt \(a\) en het intercept \(b\) van een lijn).

### Least squares-principe

Het idee van een least squares-fit is dat je de afwijkingen tussen model en meting (de residuen) minimaliseert:

\[
\epsilon_i = y_i^{(\text{gemeten})} - y(x_i;\theta).
\]

### Zonder meetfouten

Als de individuele meetonzekerheden \(\sigma_i\) niet bekend zijn, minimaliseer je de som van de kwadraten van de residuen:

\[
R^2(\theta) = \sum_i \epsilon_i^2.
\]

Dit heet een ordinary least squares-fit (OLS): alle meetpunten wegen even zwaar mee.

### Met meetfouten

Als de onzekerheden \(\sigma_i\) wel bekend zijn, deel je de residuen door de fout en minimaliseer je

\[
\chi^2(\theta) = \sum_i \left( \frac{\epsilon_i}{\sigma_i} \right)^2.
\]

Dit heet een weighted least squares-fit (WLS) of \(\chi^2\)-fit. Het resultaat is statistisch optimaal bij normaal verdeelde meetfouten.

### Uitkomst

De functie `curve_fit` levert:

- de optimale parameters \(\hat\theta = \texttt{popt}\);
- de covariantiematrix \(C = \texttt{pcov}\), die een schatting geeft van de onzekerheden en correlaties van de parameters.

De standaardfout van parameter \(\theta_j\) volgt uit

\[
\sigma_{\theta_j} = \sqrt{C_{jj}}.
\]

In Python komt dit overeen met:

- geen `sigma` meegeven \(\to\) ordinary least squares (\(R^2\));
- wel `sigma` meegeven \(\to\) weighted least squares (\(\chi^2\)).

### Interpretatie

De kwaliteit van de fit hangt af van:

- het gekozen model \(y(x;\theta)\) (is het fysisch correct en past het bij de data?);
- de spreiding van de meetpunten en hun onzekerheden \(\sigma_i\);
- de initiële schatting \(p_0\) voor de parameters: bij een niet-lineaire fit kan een slechte start leiden tot lokale minima.

In vergelijking met een linearisatie heeft een directe least squares-fit als voordeel dat alle beschikbare informatie wordt gebruikt en dat er geen systematische fouten ontstaan door transformaties. Daarom is `curve_fit` de meest robuuste methode, zeker bij fysische modellen die niet-lineair zijn in de parameters.


### Voorbeeld figuur \& fit:
```python title="Voorbeeld: fitten met curve_fit"
import numpy as np
from scipy.optimize import curve_fit

# Modeldefinitie (hier: rechte lijn)
def linear(x, a, b):
    return a * x + b

# Meetdata (x,y) met fouten
xdata = np.array([1,2,3,4,5])
ydata = np.array([1.1,1.9,3.2,3.9,5.1])
yerr  = np.array([0.1]*5)

# Eerste schatting van parameters a,b
p0 = [1, 0]

# Fit aanroepen
popt, pcov = curve_fit(linear, xdata, ydata, sigma=yerr, p0=p0)

# Resultaten
perr = np.sqrt(np.diag(pcov))
print("a =", popt[0], "+-", perr[0])
print("b =", popt[1], "+-", perr[1])
```

## Appendix: Materialen Lijst Practica

- Onbekend Lens (1x)
- Optische rail
- Dia-houders + dia (letter F)
- Projectiescherm
- Rolmaat
- Ruiters (3x)
- LED-bron, 2 kabels en voedingsbron.

[^leeuwenhoek]: Het vakmanschap van Antoni van Leeuwenhoek was zo uitzonderlijk dat het tot voor kort een raadsel bleef hoe hij zulke krachtige microscopen kon bouwen. Pas enkele jaren geleden is dit mysterie deels ontrafeld in de nucleaire reactor in Delft. Zie [dit artikel](https://phys.org/news/2018-03-mystery-superior-leeuwenhoek-microscope-years.html).

[^eyeballing]: In het natuurkundig onderzoek wordt deze eerste schatting vaak met de hand uitgevoerd. Het heeft zelfs een naam: *eyeballing*, niet te verwarren met de vodka-variant.

[^fitten]: Het maakt niet uit als deze stap nog onduidelijk is; het is een trucje dat tijdens wiskunde 2.1 verder wordt uitgelegd.
