# Practicum: Trekbankproef II

## Leerdoelen

- Je kan een trekbankproef uitvoeren en nauwkeurig kracht en verlenging meten

- Je kan spannings-rekdiagrammen opstellen en interpreteren

- Je kunt energie-dissipatie tijdens een compressie experiment.

!!! veiligheid "Veiligheid"

    1.  Een trekbank werkt met hoge krachten en opgeslagen elastische energie. Bij breuk kan het monster plotseling losschieten of fragmenteren. Houd daarom altijd voldoende afstand en blijf buiten de directe lijn van het monster.

    2.  Raak het monster en de klemmen niet aan tijdens de meting. Wacht tot de machine volledig stilstaat voordat je iets aanpast of verwijdert.

    3.  We werken op een werktuigbouwkundige afdeling: volg altijd de instructies van Jan-Willem (en/of collega's) op met betrekking tot veilig werken.

## Introductie

In dit vervolgexperiment onderzoek je het gedrag van visco-elastische materialen, zoals rubber, onder compressie. In tegenstelling tot metalen, die in eerste benadering elastisch en energiebehoudend gedrag vertonen, combineren deze materialen elastische respons met dissipatieve processen. Dit betekent dat een deel van de mechanische energie tijdens vervorming wordt omgezet in warmte.  
Wanneer een rubberen monster herhaaldelijk wordt samengedrukt en ontlast, volgt het kracht-verplaatsings diagram niet hetzelfde pad bij belasten en ontlasten. Er ontstaat een hysterese-lus, waarvan de oppervlakte direct overeenkomt met het energieverlies per cyclus. Dit energieverlies is een macroscopische manifestatie van interne processen, zoals ketenbewegingen en relaxatie in het polymeernetwerk.  
De mate van dissipatie hangt sterk af van factoren zoals vervormingssnelheid, temperatuur en de interne structuur van het materiaal. Bij hogere belastingssnelheden of grotere vervormingen wordt doorgaans meer energie gedissipeerd.  
Een herkenbaar voorbeeld hiervan is het opwarmen van autobanden tijdens het rijden. Terwijl de band continu vervormt bij contact met het wegdek, doorloopt het rubber steeds cycli van belasting en ontlasting. Door de hysterese in het materiaal gaat hierbij energie verloren, die wordt omgezet in warmte. Dit verklaart waarom banden warm worden tijdens gebruik en waarom materiaalkeuze een belangrijke rol speelt in rolweerstand, slijtage en energie-efficiëntie.

De compressieproef in dit practicum maakt het mogelijk om deze dissipatieve eigenschappen kwantitatief te karakteriseren via de oppervlakte van de hysterese-lus en zo inzicht te krijgen in het visco-elastisch gedrag van het materiaal.

!!! voorbereiding "Voorbereidingsopdracht 1"

    1.  Neem een USB-stick mee om de data uit de trekbank op te kunnen slaan.

    2.  Maak een schets de elasticiteit-modulus tegenover de tijd voor een viscoelastisch materiaal met twee tijdschalen (vergelijking 8, met i = 1,2). Je mag hiervoor zelf de waardes kiezen van $E_i$ en $\tau_i$. Zet deze schets in jouw labjournaal. Gebruik hiervoor pen en papier óf Desmos [Link](https://www.desmos.com/calculator?lang=nl).

    3.  Hoe haal ik uit deze schets de waarde van $E_\infty$? Geef dit aan in je schets.

    4.  Hoe bepaal je $E_{\infty}$ met een fit, welke vergelijking heb je hiervoor nodig?

## Theorie

Tijdens de compressie meet je de kracht $F$ en de indrukking $\Delta L$ van het rubbermonster. Analoog aan de trekproef definieer je de spanning en rek als:

<span id="vergelijking-1"></span>

$$
\sigma = \frac{F}{A}, \qquad \varepsilon = \frac{\Delta L}{L_0}
\tag{1}
$$

Hierbij is $A$ het contactoppervlak van het monster en $L_0$ de oorspronkelijke hoogte. Voor een ideaal elastisch materiaal zou de spanning op elk moment alleen afhangen van de actuele rek. In dat geval is er een eenduidig verband tussen $\sigma$ en $\varepsilon$, en lopen belasten en ontlasten over hetzelfde pad.

Bij rubbers en andere visco-elastische materialen is dat anders. Daar hangt de spanning niet alleen af van de huidige vervorming, maar ook van de eerdere belastinggeschiedenis en van de snelheid waarmee het materiaal wordt belast. Een deel van de mechanische energie wordt tijdelijk opgeslagen, terwijl een ander deel wordt gedissipeerd. Daardoor vallen het belastingspad en ontlastingspad niet samen en ontstaat een hysterese-lus in het spanning-rekdiagram.

De energie die per cyclus verloren gaat is gegeven door:

<span id="vergelijking-2"></span>

$$
E_{\text{verlies}} = \oint \sigma \, d\varepsilon
\tag{2}
$$

Deze integraal is gelijk aan de oppervlakte binnen de hysterese-lus. Hoe groter deze oppervlakte, hoe meer energie per cyclus als warmte in het materiaal wordt omgezet.  
**Maxwell-model** In het Maxwell-model is de totale rek de som van de rek in de veer en de demper:

<span id="vergelijking-3"></span>

$$
\varepsilon = \varepsilon_{\text{veer}} + \varepsilon_{\text{demper}}
\tag{3}
$$

Voor de afzonderlijke elementen geldt:

<span id="vergelijking-4"></span>

$$
\sigma = E \varepsilon_{\text{veer}}, \qquad 
    \sigma = \eta \frac{d\varepsilon_{\text{demper}}}{dt}
\tag{4}
$$

Combineren van deze relaties leidt tot de constitutieve vergelijking van het Maxwell-model:

<span id="vergelijking-5"></span>

$$
\frac{d\varepsilon}{dt} = \frac{1}{E}\frac{d\sigma}{dt} + \frac{\sigma}{\eta}
\tag{5}
$$

Hierin is $E$ de elastische modulus van de veer en $\eta$ de viscositeit van de demper.  
**Spanningsrelaxatie**

Beschouw een experiment waarbij het materiaal plots op een constante rek $\varepsilon_0$ wordt gebracht en vervolgens wordt vastgehouden:

<span id="vergelijking-6"></span>

$$
\varepsilon(t) = \varepsilon_0
\tag{6}
$$

Bij een visco-elastisch materiaal zal de spanning in de tijd afnemen: het materiaal "ontspant". In het eenvoudige Maxwell-model gebeurt dit exponentieel:

<span id="vergelijking-7"></span>

$$
\sigma(t) = \sigma_0 e^{-t/\tau}, \qquad \tau = \frac{\eta}{E}
\tag{7}
$$

Dit model beschrijft dat de spanning uiteindelijk volledig verdwijnt. Het materiaal gedraagt zich op lange tijdschalen dus vloeistofachtig.

Voor veel echte materialen, zoals rubbers, is dit echter te simpel. Daar blijft vaak een deel van de spanning behouden door een elastisch netwerk in het materiaal. In dat geval wordt het gedrag beter beschreven door een gegeneraliseerd Maxwell-model, zie Fig. [1](#figuur-1):

<span id="vergelijking-8"></span>

$$
E(t) = \frac{\sigma(t)}{\varepsilon_0} =  \left( E_\infty + \sum_i E_i e^{-t/\tau_i} \right)
\tag{8}
$$

Hierin is $E_\infty$ de blijvende (lange-tijd) elasticiteitsmodulus, en beschrijven de exponentiële termen relaxatieprocessen op verschillende tijdschalen $\tau_i$.

<span id="figuur-1"></span>

![Generalized Maxwell-model.](../assets/periode%204/GMWM.png)

*Figuur 1: Generalized Maxwell-model.*

Hieruit volgt dat het materiaal op korte tijdschalen stijver is (hoge effectieve modulus), terwijl op langere tijdschalen relaxatie optreedt en de modulus afneemt naar een constante waarde $E_\infty$.

Dit tijdsafhankelijke gedrag ligt ten grondslag aan hysterese en energieverlies bij cyclische belasting.

### Interpretatie voor het experiment

Bij cyclische belasting, zoals in dit practicum, wordt het materiaal voortdurend belast en ontlast. Door de tijdsafhankelijke respons ontstaat een faseverschil tussen spanning en rek, wat resulteert in een hysterese-lus in het spanning-rekdiagram. De oppervlakte van deze lus komt overeen met het energieverlies per cyclus:

<span id="vergelijking-9"></span>

$$
E_{\text{verlies}} = \oint \sigma \, d\varepsilon
\tag{9}
$$

Dit energieverlies is een directe maat voor de dissipatieve eigenschappen van het materiaal en hangt samen met de interne relaxatieprocessen zoals beschreven door het Maxwell-model. Het is dus niet een constant energieverlies, maar hangt af van de snelheid van o.a. (de)compressie.

## Practicum

!!! methode "Experiment 1: relaxatie rubber"

    1.  Bepaal de elasticiteitsmodulus voor Shore A 10 & 30 samples.

    2.  Analyseer de uniforme rek $\varepsilon_0$ data. Hoeveel tijdschalen zie je? Welke waarde van $E_\infty$ heb je gevonden?

!!! methode "Experiment 2: energieverlies per cyclus"

    1.  Plaats een rubber monster tussen de drukplaten.

    2.  Voer meerder laad-en ontlaadcycli uit.

    3.  Meet de kracht en verplaatsing continu.

    4.  Varieer eventueel de maximale compressie en snelheid van de belasting.

!!! opdracht "Verwerking experiment 1"

    1.  Maak een spanning-tijd diagram.

    2.  Bepaal $E_\infty$ en onderzoek hoeveel tijdschalen je nodig hebt om deze rubber goed te kunnen modelleren.

    3.  Noteer het aantal tijdschalen, de tijdschalen $\tau_i$ (in de juiste eenheid) en de visco-elasticiteit per tijdsschaal $E_i$.

!!! opdracht "Verwerking experiment 2"

    1.  Zet kracht en verplaatsing om naar spanning en rek

    2.  Plot het spanning-rekdiagram voor meerdere cycli

    3.  Bepaal de oppervlakte van de hysterese-lus (numeriek)

    4.  Vergelijk energieverlies tussen verschillende cycli

    5.  Onderzoek het effect van belastingssnelheid (indien gemeten)

!!! opdracht "Resultaten en Discussie"

    - Hoe groot is het energieverlies per cyclus?

    - Hoe verandert de hysterese bij herhaald belasten?

    - Wat is het effect van de belastingssnelheid?

    - Verklaar het energieverlies fysisch (denk aan interne wrijving / relaxatieprocessen)

!!! afronding "Afronding"

    1.  Verwerk alle figuren en resultaten in je labjournaal.

    2.  Schrijf een duidelijke resultaat- en discussiesectie.

    3.  Laat je werk controleren door de begeleider.
