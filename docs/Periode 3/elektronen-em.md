# Practicum: bepaling van de verhouding $e/m_e$ met een elektronenbundel

## Leerdoelen

- De student kan de verhouding $e/m_e$ bepalen door de data te lineariseren en hierop een passende fit toe te passen.

- De student kan veilig werken met hoogspanningsbronnen.

!!! veiligheid "Veiligheid"

    1.  De elektronenbuis is kwetsbaar en duur; ga er altijd zorgvuldig mee om.

    2.  Sluit voedingen pas aan wanneer alle draaiknoppen op $0\,\mathrm{V}$ en $0\,\mathrm{A}$ staan.

    3.  Laat de opstelling controleren door een practicumbegeleider voordat je spanning toepast.

## Introductie

De verhouding van de elementaire lading e over de elektron massa $m_e$ is in 1897 voor het eerst gemeten door Joseph John Thomson. Hiermee toonde hij aan dat het elektron een deeltje is met zowel een massa als een lading.

Een elektronenkanon is een van de meest eenvoudige deeltjesversnellers. Door een stroom door een gloeidraad te laten lopen wordt op macroscopisch niveau de gloeidraad warm. Op microscopisch niveau gebeuren er verschillende dingen. Één van deze dingen is dat de elektronen meer energie krijgen. Hierdoor hebben ze een grotere kans om te ontsnappen uit de vaste stof van de gloeidraad, een proces dat bestaat uit thermische emissie. Brengen we dit geheel in een uniform elektrisch veld door een spanningsverschil aan te leggen tussen de gloeidraad en een positieve anode, dan zullen de (bijna) vrije elektronen gaan versnellen. Zo krijg je elektronen die een redelijk uniforme snelheid krijgen in de richting van de anode.

In de opstelling zoals weergegeven in Fig. [2](#figuur-2) kun je deze elektronenbundel zichtbaar maken doordat er een verdund fluorescerend gas is aangebracht binnen het hermetisch afgesloten glaswerk. Dit maakt de bundel zichtbaar als een groene streep. Vervolgens kun je met zogenaamde Helmholtz spoelen een magnetisch veld aanleggen waardoor je de bundel kan afbuigen, dit volgt uit de wet van Lorentz. Het uiteindelijke doel van dit experiment is om de verhouding $e/m_e$ te bepalen.

!!! voorbereiding "Voorbereidingsopdracht"

    1.  Bereken vooraf de theoretische verhouding $e/m_e$.

    2.  Stel een hypothese op over de waarde die jij experimenteel zult meten.

    3.  Schrijf vergelijking (2) om zodat $r$ als functie van $B$ wordt geschreven.

    4.  Hoe kun je uit de richtingscoëfficiënt van jouw fit $e/m_e$ bepalen?

    5.  Bepaal vooraf hoeveel verschillende waarden van $I_H$ je wilt gebruiken.

## Theorie

Wanneer een elektron zich beweegt in een homogeen magnetisch veld, werkt er een Lorentzkracht op het deeltje. Voor een elektron dat loodrecht door een magnetisch veld beweegt geldt:

<span id="vergelijking-1"></span>

$$
F_L = e v B .
\tag{1}
$$

De kracht staat altijd loodrecht op zowel de bewegingsrichting als het magnetisch veld. Hierdoor verricht het magnetisch veld geen arbeid op het elektron: het verandert niet de snelheid, maar uitsluitend de bewegingsrichting.

Een kracht loodrecht op de snelheid fungeert als centripetale kracht en veroorzaakt een kromlijnige, idealiter cirkelvormige, baan. Uit de krachtenbalans volgt de baanstraal:

<span id="vergelijking-2"></span>

$$
r = \frac{m_e v}{e B}.
\tag{2}
$$

**Kinetische energie en versnelspanning**  
Elektronen worden versneld door de anodespanning $U$. De kinetische energie van het elektron wordt dan:

<span id="vergelijking-3"></span>

$$
eU = \frac{1}{2} m_e v^2,
\tag{3}
$$

zodat de snelheid volgt als:

<span id="vergelijking-4"></span>

$$
v = \sqrt{\frac{2 e U}{m_e}}.
\tag{4}
$$

Door deze snelheid in de straalvergelijking te substitueren en te elimineren ontstaat na herschrijven de klassieke uitdrukking:

<span id="vergelijking-5"></span>

$$
\frac{e}{m_e} = \frac{2U}{B^{2} r^{2}}.
\tag{5}
$$

Deze formule vormt de kern van het experiment: met bekende $U$, en gemeten $B$ en $r$, kan de verhouding $e/m_e$ worden bepaald zonder directe snelheidsmeting.

**Magnetisch veld van Helmholtz-spoelen**  
Voor twee spoelen met straal $R$, elk met $n$ windingen en spoelstroom $I_H$, is het magnetisch veld in het centrum:

<span id="vergelijking-6"></span>

$$
B = \mu_0 H
    = \left( \frac{4}{5} \right)^{3/2}
      \frac{\mu_0 n}{R} I_H .
\tag{6}
$$

Voor $n=320$ windingen en $R=68\,\text{mm}$ volgt numeriek:

<span id="vergelijking-7"></span>

$$
B \approx 4.17 \times 10^{-3} I_H .
\tag{7}
$$

Het veld is dus lineair evenredig met de spoelstroom $I_H$, wat experimentele controle en kalibratie eenvoudig maakt. De baanstraal kan niet rechtstreekt gemeten worden, maar volgt uit twee meetbare grootheden $x$ en $y$ binnen de buis, zie Fig. [1](#figuur-1):

<span id="vergelijking-8"></span>

$$
r = \frac{x^2 + y^2}{2y}.
\tag{8}
$$

<span id="figuur-1"></span>

![Geometrie van de elektronenbuis en de straalbepaling.](../assets/periode%203/Geometrie_elektronenbuis1.png)

![Geometrie van de elektronenbuis en de straalbepaling.](../assets/periode%203/E_m_bepaling_stralen.png)

*Figuur 1: Geometrie van de elektronenbuis en de straalbepaling.*

<span id="figuur-2"></span>

![Opstelling elektronenkanon](../assets/periode%203/E_m_bepaling_ZA.png)

*Figuur 2: Opstelling elektronenkanon*

## Practicum

!!! methode "Experiment"

    1.  Stel de opstelling op zoals weergegeven in Figuur [3](#figuur-3).

    2.  Sluit de minpool van de anodespanning aan op de 4 mm aansluiting met min-markering.

    3.  Plaats de Helmholtz-spoelen in de buishouder.

    4.  Sluit de verwarmingsspanning aan op de lamp (deze kan je niet varieren en is $U_F = 6.3-6.5 \mathrm{V}$) en wacht enkele minuten tot de lamp brand.

    5.  Kies een anode spanning $U_A$ tussen 1000 en 5000 V en wacht tot de anodestroom stabiliseert.

    6.  Breng spanning aan op de Helmholtz-spoelen en observeer de afbuiging van de bundel.

    7.  Meet $x$ en $y$ voor verschillende waarden van spoelstroom $I_H$.

    8.  Indien tijd: herhaal voor andere waarden van $U_A$.

<span id="figuur-3"></span>

![Opstelling elektronenkanon](../assets/periode%203/E_m_bepaling_BA.png)

*Figuur 3: Opstelling elektronenkanon*

!!! opdracht "Verwerking"

    1.  Bepaal $U$, $r$ en $B$ voor alle metingen.

    2.  Plot $r$ versus $1/B$ inclusief onzekerheden.

    3.  Pas een lineaire regressie toe en bepaal daaruit $e/m_e$.

    4.  Bepaal de standaardfout van $e/m_e$ via de regressie (en foutenpropagatie).

    5.  Visualiseer jouw meetwaarden in een histogram en observeer wat er gebeurt als je meer data toevoegt.

!!! opdracht "Resultaten en Discussie"

    1.  Laat de grafiek zien van $r$ tegen $1/B$.

    2.  Bespreek of de trend overeenkomt met jouw theoretische verwachting.

    3.  Onderzoek systematische afwijkingen en hun invloed op de fit.

    4.  Verklaar eventuele verschillen tussen jouw gemeten waarde en de verwachting.

!!! afronding "Afronding"

    1.  Zet de gevonden figuren in je digitaal labjournaal en maak een duidelijk onderschrift waarin je uitlegt wat de figuren laten zien.

    2.  Vul de **Resultaat- en Discussie**-sectie aan in je labjournaal. Hierin moet de uiteindelijke waarde van jouw experiment (met onzekerheid) staan en een korte discussie of deze waarde **realistisch** en **betrouwbaar** is.

    3.  Ruim pas op na akkoord van de begeleider.
