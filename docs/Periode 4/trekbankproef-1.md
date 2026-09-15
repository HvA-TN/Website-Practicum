# Practicum: Trekbankproef I

## Leerdoelen

- Je kan een trekbankproef uitvoeren en nauwkeurig kracht en verlenging meten

- Je kan spannings-rekdiagrammen opstellen en interpreteren

- Je kan een foutanalyse uitvoeren en de onzekerheid in de elasticiteitsmodulus afleiden en bepalen

!!! veiligheid "Veiligheid"

    1.  Een trekbank werkt met hoge krachten en opgeslagen elastische energie. Bij breuk kan het monster plotseling losschieten of fragmenteren. Houd daarom altijd voldoende afstand en blijf buiten de directe lijn van het monster.

    2.  Raak het monster en de klemmen niet aan tijdens de meting. Wacht tot de machine volledig stilstaat voordat je iets aanpast of verwijdert.

    3.  We werken op een werktuigbouwkundige afdeling: volg altijd de instructies van Jan-Willem (en/of collega's) op met betrekking tot veilig werken.

## Introductie

In dit practicum onderzoek je hoe een materiaal reageert op mechanische belasting door het gecontroleerd uit te rekken in een trekbankproef (zie Fig. [1](#figuur-1)). Terwijl de kracht wordt opgevoerd, doorloopt het materiaal verschillende regimes: eerst elastisch gedrag (omkeerbare vervorming), daarna plastische vervorming en uiteindelijk breuk.  
Door de gemeten kracht en verlenging om te rekenen naar spanning en rek, stel je een spanning-rekdiagram op. Hieruit bepaal je fundamentele materiaaleigenschappen zoals de elasticiteitsmodulus, rekgrens en breukspanning. Deze grootheden beschrijven niet alleen hoe sterk een materiaal is, maar vooral hoe het zich gedraagt en faalt onder belasting.  
<span id="figuur-1"></span>

![Een trekbank in het makerslab.](../assets/periode%204/Trekbank.png)

*Figuur 1: Een trekbank in het makerslab.*

!!! voorbereiding "Voorbereidingsopdracht 1"

    1.  Bekijk de video over de trekbankproef op Brightspace

    2.  Lees paragraaf 12.3 en 12.4 uit *OpenStax University Physics I*

    3.  Neem een USB-stick mee om de data uit de trekbank op te kunnen slaan.

    4.  Beantwoord in je labjournaal:

        - Leid de foutpropagatieformule voor $E$ af

        - Welke meetfout heeft de grootste invloed op $E$?

        - Hoe bepaal je $E$ met een fit, welke vergelijking heb je hiervoor nodig?

## Theorie

Tijdens de trekproef worden de kracht $F$ en de verlenging $\Delta L$ van het monster gemeten als functie van de aangelegde belasting. Deze grootheden worden omgerekend naar spanning en rek via:

<span id="vergelijking-1"></span>

$$
\sigma = \frac{F}{A}, \qquad \varepsilon = \frac{\Delta L}{L_0}
\tag{1}
$$

Hierbij is $A$ de oorspronkelijke doorsnede van het monster en $L_0$ de beginlengte. In het lineair-elastische regime geldt een lineair verband tussen spanning en rek (de wet van Hooke), waarbij de elasticiteitsmodulus $E$ de helling van de spanning-rekcurve bepaalt:

<span id="vergelijking-2"></span>

$$
E = \frac{\sigma}{\varepsilon} = \frac{F L_0}{A \Delta L}
\tag{2}
$$

In de praktijk wordt $E$ bepaald uit een lineaire fit van het elastische gedeelte van het spanning-rekdiagram, omdat individuele metingen ruis en meetonzekerheden bevatten. Aangezien alle gemeten grootheden ($F$, $\Delta L$, $L_0$ en $A$) onzekerheden bevatten, moet ook de onzekerheid in de elasticiteitsmodulus worden bepaald met behulp van foutenpropagatie. Hierbij is het belangrijk om te beseffen dat $E$ relatief gevoelig is voor kleine fouten in $\Delta L$, omdat deze grootheid in de noemer voorkomt.  
De doorsnede $A$ hangt af van de geometrie van het trekmonster. Twee veelgebruikte vormen zijn rechthoekige en cilindrische (ronde) monsters. Rechthoekige monsters zijn eenvoudig te vervaardigen en hebben een constante doorsnede, maar zijn gevoeliger voor spanningsconcentraties aan randen en hoeken. Dit kan leiden tot vroegtijdige lokale plastische vervorming en minder representatieve breukkarakteristieken.  
Cilindrische monsters daarentegen hebben een axiaal-symmetrische geometrie en worden doorgaans nauwkeuriger machinaal bewerkt. Door deze symmetrie is de spanningsverdeling homogener, wat resulteert in betrouwbaardere metingen van materiaaleigenschappen zoals elasticiteitsmodulus, vloeigrens en breukspanning.

## Practicum

!!! methode "Experiment: Trekproef"

    Tijdens het practicum wordt met pennen een trekproef uitgevoerd. Er wordt een kleine introductie over de pennen en de trekbank gegeven. Gegevens noteer je in je labjournaal en op een logformulier die je bij het practicum zult krijgen, zie Brightspace. Na de trekproef vullen jullie de resterende gevraagde gegevens in voor de pen die je zelf onderzoekt.  
    **Let op:** Het is belangrijk dat je een inschatting van de fout in de oppervlak via de diameter of rechthoek, de lengte, en de fout in de kracht bepaalt om de fout in de elasticiteitsmodulus te kunnen berekenen.  

    1.  Voer een trekproef uit op het materiaal

    2.  Meet kracht en verlenging tijdens de proef

    3.  Noteer alle gegevens in je labjournaal of logformulier

    4.  Bepaal en noteer schattingen van de meetfouten in:

        - kracht $F$

        - lengte $L_0$

        - verlenging $\Delta L$

        - oppervlak $A$

!!! opdracht "Verwerking"

    1.  Zet de kracht en uitrekking om naar spanning en rek.

    2.  Plot de spanning-rekdiagram.

    3.  Bepaal de elasticiteitsmodulus in het elastische gebied, welke eenheid hoort hierbij?

    4.  Bepaal de fout in $E$ via de lineaire fit in het elastische gebied.

    5.  Stel een tabel op met de waarden, zie logformulier:

        - maximale trekspanning

        - elasticiteitsgrens

        - breukspanning

        - breukrek

        - insnoering

!!! opdracht "Resultaten en Discussie"

    - Welk materiaal heb je gemeten? Motiveer je antwoord en houd rekening met de onzekerheid op $E$.

    - Zijn er systematische afwijkingen aanwezig? Was de correctie via de lineaire fit nodig?

!!! afronding "Afronding"

    1.  Verwerk alle figuren en resultaten in je labjournaal.

    2.  Schrijf een duidelijke resultaat- en discussiesectie.

    3.  Laat je werk controleren door de begeleider.
