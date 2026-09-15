# Practicum: Digitale viscosimeter en niet-Newtoniaanse vloeistoffen

## Leerdoelen

- Je kan de dynamische viscositeit meten met een digitale viscosimeter.

- Je kan het verschil tussen Newtoniaanse en niet-Newtoniaanse vloeistoffen bepalen.

!!! veiligheid "Veiligheid"

    1.  De rotor (spindle) en koppeling van de viscosimeter zijn fragiel. Ga hier voorzichtig mee om.

    2.  Zorg dat de rotor correct gemonteerd is voordat je de meting start.

    3.  Werk zorgvuldig met vloeistoffen en voorkom morsen.

## Introductie

In het vorige practicum heb je de viscositeit bepaald met een Ubbelohde viscometer. In dit practicum gebruik je een digitale viscosimeter, zie Fig. [1](#figuur-1), waarmee de viscositeit direct wordt bepaald via een koppelmeting.

<span id="figuur-1"></span>

![Een digitale viscometer](../assets/periode%204/Digitale_viscometer.png)

*Figuur 1: Een digitale viscometer*

Het doel van dit practicum is tweeledig:

- het vergelijken van de precisie van beide meetmethodes,

- het bepalen van het vloeistofgedrag van een glycerine-oplossing en een zetmeeloplossing.

!!! voorbereiding "Voorbereidingsopdracht"

    **Experiment 1:**

    1.  Bekijk de video over het gebruik van de digitale viscosimeter [Link](https://www.youtube.com/watch?v=FSid8a-MUCw).

    2.  Bepaal met behulp van de handleiding de juiste instellingen en rotor.

    3.  Schrijf een meetstrategie uit in je labjournaal.

    4.  Neem de data van het vorige practicum over in Python.

    **Experiment 2:**

    1.  Bepaal de waarde van $n$ voor verschillende vloeistoftypes.

    2.  Voer een dimensie-analyse uit voor $k$.

    3.  Zoek het verwachte gedrag van een maizena-oplossing.

## Theorie

De digitale viscosimeter die we in dit practicum gebruiken werkt anders dan de Ubbelohde-viscometer. De digitale viscosimeter maakt gebruik van een zogeheten spil (Engels: *spindle*), een opzetstuk waarmee de vloeistof in beweging wordt gebracht. Hierbij wordt het koppel $M$ (Engels: *torque*) gemeten. De viscositeit volgt dan uit:

<span id="vergelijking-1"></span>

$$
\eta = \frac{M}{K}
\tag{1}
\tag{1}
$$

Let op: voor Newtoniaanse vloeistoffen wordt de dynamische viscositeit vaak aangeduid met $\mu$, terwijl voor niet-Newtoniaanse vloeistoffen $\eta$ wordt gebruikt. In dat geval is de viscositeit afhankelijk van de shear-rate $\dot{\gamma}$ en wordt dit geschreven als $\eta(\dot{\gamma})$.

Hierbij is $\eta$ de dynamische viscositeit, $M$ het koppel en $K$ de kalibratieconstante van de viscosimeter. Deze kalibratieconstante is afhankelijk van de geometrie (bijvoorbeeld cilindrisch) en de rotatiesnelheid van de spil.

Voor een cilindrische geometrie kan worden afgeleid dat:

<span id="vergelijking-2"></span>

$$
\eta = \frac{M}{2\pi \left(\frac{R_i^3 L \omega}{R_0 - R_i}\right)}
\tag{2}
\tag{2}
$$

Hierbij is $R_i$ de straal van de binnenste cilinder, $R_0$ de straal van de buitenste cilinder (spil), $L$ de dompelhoogte van de spil en $\omega$ de hoeksnelheid.

De viscosimeter gebruikt een koppelmeter om het moment $M$ te bepalen, waarna de dynamische viscositeit wordt berekend.  
<span id="figuur-2"></span>

![schuifspanning als functie van de vervormingssnelheid voor verschillende typen vloeitstoffen.](../assets/periode%204/Viscositeit_regimes.png)

*Figuur 2: schuifspanning als functie van de vervormingssnelheid voor verschillende typen vloeitstoffen.*

**Newtoniaanse en niet-Newtoniaanse vloeistoffen**

Een fundamenteel onderscheid in de stromingsleer (reologie) is dat tussen Newtoniaanse en niet-Newtoniaanse vloeistoffen. Dit onderscheid is gebaseerd op het verband tussen de schuifspanning $\tau$ en de afschuifsnelheid $\dot{\gamma}$ (shear-rate) van een vloeistof:

<span id="vergelijking-3"></span>

$$
\tau(\dot{\gamma}) = \eta(\dot{\gamma}) \, \dot{\gamma}
\tag{3}
\tag{3}
$$

Newtoniaanse vloeistoffen, zoals water en lucht, worden gekenmerkt door een lineaire relatie tussen deze grootheden, waarbij de viscositeit constant is.

Echter, er zijn ook vloeistoffen die hier niet aan voldoen: de niet-Newtoniaanse vloeistoffen. In dit geval is de viscositeit $\eta(\dot{\gamma})$ niet-lineair afhankelijk van de shear-rate $\dot{\gamma}$, zie Fig. [2](#figuur-2). Er wordt onderscheid gemaakt tussen twee typen gedrag:

- **Shear-thinning**: de viscositeit daalt bij toenemende shear-rate (bijvoorbeeld ketchup, verf, polymeeroplossingen). Deze worden ook wel pseudoplastisch genoemd.

- **Shear-thickening**: de viscositeit stijgt bij toenemende shear-rate (bijvoorbeeld maizena-oplossingen, silicagel-oplossingen). Deze worden ook wel dilatant genoemd.

Dit gedrag kan worden gemodelleerd met een zogenaamd power-law model:

<span id="vergelijking-4"></span>

$$
\eta(\dot{\gamma}) = k \, \dot{\gamma}^{\,n - 1}
\tag{4}
\tag{4}
$$

Hierbij is $\eta$ de schijnbare viscositeit, $k$ de consistentie-index (stroperigheidsindex), $\dot{\gamma}$ de shear-rate en $n$ de gedragscoëfficiënt van de vloeistof. De waarde van $n$ bepaalt het type vloeistof:

- $n = 1$: Newtoniaans gedrag

- $n < 1$: shear-thinning

- $n > 1$: shear-thickening

## Practicum

!!! methode "Experiment deel I: Digitale viscosimeter"

    In dit practicum werken we met een digitale viscosimeter van Vevor. Let op: de rotor en de koppeling aan de viscosimeter zijn fragiel en kostbaar. Ga hier dus voorzichtig mee om.

    Net als in het vorige practicum meet je de viscositeit van verschillende glycerol-oplossingen. Ditmaal wordt hiervoor echter een digitale viscosimeter gebruikt in plaats van een Ubbelohde-viscometer.

    1.  Meet de dynamische viscositeit $\eta$ van dezelfde vloeistoffen als in het vorige practicum.

    2.  Maak een schatting van de bijbehorende meetfout. Bepaal daarbij welke foutbron waarschijnlijk de grootste bijdrage levert.

!!! opdracht "Verwerking deel I"

    1.  Maak een grafiek van de viscositeit van de water--glycerol oplossingen.

    2.  Voeg deze grafiek toe aan de grafiek uit het vorige practicum.

    3.  Komt dit verband overeen met de waarden die je hebt bepaald met de Ubbelohde-viscometer?

    4.  Welke viscometer heeft jullie voorkeur en waarom?

!!! methode "Experiment deel II: Niet-Newtoniaanse vloeistoffen"

    Wij verwachten dat jullie zelfstandiger worden in het opstellen van een passende meetmethode. De methode hieronder is daarom bewust beknopt gehouden. Breng vooraf in kaart welke stappen nodig zijn.

    1.  Meet de dynamische viscositeit $\eta$ van één van de water--glycerol oplossingen en bepaal het type vloeistof (bepaal $n$).

    2.  Meet de dynamische viscositeit $\eta$ van de zetmeeloplossing en maak een inschatting van de bijbehorende meetfout.

    3.  Meet de dynamische viscositeit $\eta$ van de zetmeeloplossing bij verschillende rotatiesnelheden en maak een inschatting van de bijbehorende meetfout.

!!! opdracht "Verwerking deel II"

    Tijdens het practicum noteer je je observaties in je labjournaal.

    1.  Maak een grafiek van de dynamische viscositeit $\eta$ als functie van de afschuifsnelheid $\dot{\gamma}$. Gebruik hiervoor:

        <span id="vergelijking-5"></span>

        $$
        \dot{\gamma} = \frac{2\pi C\, \mathrm{RPM}}{60}
        \tag{5}
        $$

        Hierbij is $C$ een apparaatconstante, die je gelijk aan 1 mag nemen.

    2.  Maak een fit met behulp van vergelijking (4).

    3.  Bereken de waarde van $n$ met bijbehorende onzekerheid. Onder welk type vloeistof valt de water--glycerol oplossing? En hoe zit dit voor de maizena-oplossing?

!!! afronding "Resultaten en discussie"

    1.  Vergelijk de precisie van beide meetmethodes.

    2.  Bepaal het type vloeistof van de zetmeeloplossing.

    3.  Bespreek systematische fouten.

    4.  Verklaar verschillen met de verwachting.

!!! afronding "Afronding"

    1.  Werk je labjournaal volledig uit.

    2.  Laat je werk controleren door de begeleider.
