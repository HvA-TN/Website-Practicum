# Practicum: Viscositeit met de Ubbelohde viscometer

## Leerdoelen

- Je kan de kinematische en dynamische viscositeit meten met een Ubbelohde viscosimeter.

- Je kan een foutanalyse uitvoeren met behulp van foutenpropagatie.

- Je kan de dynamische viscositeit van mengsels experimenteel bepalen.

!!! veiligheid "Veiligheid"

    1.  De Ubbelohde viscometer is gemaakt van dun glas en zeer breekbaar. Ga hier voorzichtig mee om.

    2.  Werk zorgvuldig met vloeistoffen en voorkom morsen. Ruim gemorste vloeistoffen direct op.

    3.  Gebruik de viscometer alleen volgens de instructies van de begeleider.

## Introductie

In dit practicum onderzoek je de viscositeit van vloeistoffen met behulp van een Ubbelohde viscometer. Dit is een klassieke meetmethode waarbij de stroming van een vloeistof door een dunne capillair wordt gebruikt om de viscositeit te bepalen.

Hoewel moderne apparatuur vaak gebruik maakt van roterende systemen, biedt de Ubbelohde viscometer een eenvoudige en nauwkeurige manier om viscositeit te meten op basis van stromingstijd, [Link](https://cannoninstrument.com/ubc-2-ubbelohde-visc-cal9721-r68.html). In dit practicum bepaal je de dynamische viscositeit van water en vergelijk je verschillende methoden om de meetnauwkeurigheid te evalueren.

<span id="figuur-1"></span>

![Een Ubbelohode viscometer.](../assets/periode%204/Ubbelohde.png)

*Figuur 1: Een Ubbelohode viscometer.*

In het tweede deel van het practicum onderzoek je mengsels van vloeistoffen en bestudeer je hoe moleculaire interacties de viscositeit beïnvloeden.

!!! voorbereiding "Voorbereidingsopdracht 1"

    1.  Bekijk de video over het gebruik van de Ubbelohde viscometer.

    2.  Lees de handleiding van de UBC-2 viscometer op Brightspace.

    3.  Noteer:

        - de dynamische en kinematische viscositeit van water.

        - de bijbehorende eenheden en dimensies.

    4.  Stel een foutpropagatieformule op voor $\mu$.

    5.  Zoek viscositeiten van water en glycerol op.

    6.  Bereken $x_1$ en $x_2$ voor verschillende mengverhoudingen.

    7.  Bedenk een strategie om $G_{12}$ te bepalen.

## Theorie

**Kinematische viscositeit van een vloeistof**

De tijd t die het vloeistofniveau nodig heeft om te dalen van positie $E$ naar positie $F$ heeft een direct verband met de zogenaamde kinematische viscositeit $\nu$:

<span id="vergelijking-1"></span>

$$
\nu = kt
\tag{1}
$$

Hierin is $k$ de kalibratieconstante van de specifieke Ubbelohde viscometer. Deze moet dus altijd gekalibreerd worden met een vloeistof waarvan de (kinematische) viscositeit bekend is.

Je kunt je waarschijnlijk voorstellen dat de dichtheid van invloed is op hoe snel een vloeistof als gevolg van de zwaartekracht door een buis naar beneden stroomt. De kinematische viscositeit $\mu$ is dan ook niks anders dan de dynamische viscositeit gedeeld door de dichtheid van de vloeistof:

<span id="vergelijking-2"></span>

$$
\nu = \frac{\mu}{\rho}.
\tag{2}
$$

**Mengels van oplossingen**

Voor mengsels (Engels: mixtures) van vloeistoffen kan de dynamische viscositeit ook bepaald worden. Een eerste-orde benadering hiervoor is de massa-gewogen som van de individuele viscositeiten:

<span id="vergelijking-3"></span>

$$
\mu_{\text{mix}} = \sum_i w_i \mu_i = (1 - w)\,\mu_1 + w\,\mu_2
\tag{3}
\tag{3}
$$

Hierbij is $w_i$ de massafractie van vloeistof $i$ met dynamische viscositeit $\mu_i$. Voor twee vloeistoffen kan dit vereenvoudigd worden door te schrijven in termen van het massapercentage $w$ van het mengsel (bijvoorbeeld: $w = 0{.}1$ voor 10% glycerol in water). Echter, deze benadering werkt in het algemeen niet goed.  
De reden hiervoor is dat de individuele moleculen vaak complexe interacties met elkaar aangaan (sterke intermoleculaire interacties, zoals waterstofbruggen, zwavelbruggen, etc.). Voor mengsels (bijvoorbeeld water--glycerol) kan een betere benadering worden gemaakt door te corrigeren voor het molecuulgewicht $M_i$ en door een interactieparameter te introduceren.

De eerste correctie betreft het molecuulgewicht van de individuele vloeistoffen. Voor water geldt $M_w = 18.015\,\mathrm{g/mol}$ en voor glycerol $M_g = 92.093\,\mathrm{g/mol}$. De molfracties worden dan bepaald via:

<span id="vergelijking-4"></span>

$$
n_1 = \frac{1 - w}{M_w}, \qquad n_2 = \frac{w}{M_g}
\tag{4}
\tag{4}
$$

Vervolgens definiëren we de genormaliseerde fracties:

<span id="vergelijking-5"></span>

$$
x_1 = \frac{n_1}{n_1 + n_2}, \qquad x_2 = 1 - x_1
\tag{5}
\tag{5}
$$

De viscositeit kan vervolgens worden bepaald met de Grunberg--Nissan-formule:

<span id="vergelijking-6"></span>

$$
\ln \mu_{\text{mix}} = x_1 \ln \mu_w + x_2 \ln \mu_g + x_1 x_2 G_{12}
\tag{6}
\tag{6}
$$

Hierbij is $\mu_w$ de viscositeit van water, $\mu_g$ de viscositeit van glycerol en $G_{12}$ een maat voor de interactiesterkte tussen de moleculen.

## Practicum

!!! methode "Experiment deel I: Water"

    In dit practicum wordt gewerkt met een UBC-2 Ubbelohde Calibrated viscometer. Let op: Ubbelohde-viscometers zijn fragiel en kostbaar, ga hier zorgvuldig mee om.

    De onderstaande methode is bewust beknopt geformuleerd. Van jullie wordt verwacht dat je zelfstandig een geschikte meetstrategie opstelt en onderbouwt.

    1.  Meet de stromingstijd van water minimaal 20 keer en bepaal de kinematische viscositeit $\nu$ voor elke meting.

    2.  Maak een schatting van de meetfouten. Identificeer de dominante foutbron (bijvoorbeeld timing, temperatuur, aflezen).

    3.  Bepaal de dynamische viscositeit $\mu$ van water en bereken de bijbehorende onzekerheid via foutenpropagatie.

    4.  Spoel de Ubbelohde-viscometer zorgvuldig schoon na afloop van de metingen.

!!! opdracht "Verwerking deel I"

    1.  Maak een histogram van de gemeten waarden van $\mu$. Kies een passende bin-grootte en bepaal:

        - het gemiddelde van $\mu$

        - de fout op het gemiddelde

    2.  Onderzoek of de metingen normaal verdeeld zijn, bijvoorbeeld door een Gaussiaanse fit op het histogram toe te passen.

    3.  Vergelijk de spreiding tussen individuele metingen met de geschatte meetfouten. Welke bijdrage domineert?

    4.  Noteer de eindwaarde van de dynamische viscositeit van water inclusief onzekerheid.

!!! methode "Experiment deel II: Mengsels"

    Iedere groep bepaalt de dynamische viscositeit van één mengsel (mixture). De verzamelde data wordt klassikaal gecombineerd voor verdere analyse.

    1.  Meet de kinematische viscositeit $\nu$ van jullie mengsel. Herhaal de meting totdat je een betrouwbare schatting hebt van de gemiddelde waarde en de spreiding.

    2.  Bepaal de dynamische viscositeit $\mu$ van het mengsel en bereken de bijbehorende onzekerheid.

    3.  Noteer jullie waarde van $\mu$ (inclusief onzekerheid) op het bord, zodat deze beschikbaar is voor de gehele groep.

    4.  Verzamel de viscositeitsgegevens van de andere groepen.

    5.  Spoel de Ubbelohde-viscometer zorgvuldig schoon na afloop van de metingen.

!!! opdracht "Verwerking deel II"

    1.  Bepaal de interactieparameter $G_{12}$ (water--glycerol) met bijbehorende onzekerheid, gebruikmakend van de gecombineerde dataset.

    2.  Leg uit of er bij je metingen sprake is van systematische afwijking(en) en hoe dit je metingen beïnvloed.

    3.  Verklaar jouw gevonden waarde voor de interactiesterkte met de literatuurwaarde.

!!! afronding "Afronding"

    1.  Werk alle resultaten uit in je labjournaal

    2.  Laat je werk controleren door de begeleider.
