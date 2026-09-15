# Practicum: Efficiëntie en vermogen van zonnecellen

## Leerdoelen

Na afloop van dit practicum:

- kun je aan de hand van een zelfstandig opgesteld meetplan een experiment uitvoeren met een fotovoltaïsche (PV) cel;
- kun je de stroom-spanningskarakteristiek (I-V-curve) van een zonnecel uitleggen en experimenteel bepalen;
- kun je het maximale vermogen, de fill factor en de efficiëntie van een zonnecel bepalen;
- kun je zelfstandig een verdiepend experiment bedenken, opzetten en uitvoeren.


!!! veiligheid "Veiligheid"

    In dit practicum werk je met elektrische apparatuur. Ga zorgvuldig om met de apparatuur en schakel bij twijfel altijd de practicumbegeleider in.


## Introductie

Zonnecellen vormen een belangrijk toepassingsgebied binnen de technische natuurkunde, waarin halfgeleiderfysica, optica en elektrische netwerkanalyse samenkomen. Een zonnecel, of fotovoltaïsche (PV) cel, zet invallend licht direct om in elektrische energie door middel van het fotovoltaïsche effect. Hierbij komen elektronen vrij wanneer fotonen met voldoende energie het halfgeleidermateriaal raken, meestal silicium. De vrijgekomen ladingsdragers worden vervolgens gescheiden door een intern elektrisch veld, waardoor een meetbare stroom ontstaat.

![Een zonnecel module.](../assets/periode 2/Zonnecel_foto.png)

*Figuur: Een zonnecel module.*

Zonnecellen spelen een steeds belangrijkere rol in de energietransitie, doordat zij zonlicht direct omzetten in elektrische energie zonder CO₂-uitstoot. Binnen de technische natuurkunde vormt het begrijpen van de werking, het rendement en het systeemgedrag van zonnecellen een essentieel onderdeel van duurzame technologieontwikkeling. De prestatie van een zonnecel hangt af van factoren zoals de bandkloof, de intensiteit van het licht en interne verliezen, en kan experimenteel worden onderzocht door spanning en stroom te meten bij verschillende belastingen.

!!! voorbereiding "Voorbereidingsopdracht 1"

    1. Bekijk de volgende voorbereidingsfilmpjes:
    
        - [How do solar panels work](https://www.youtube.com/watch?v=xKxrkht7CpY){ target="_blank" rel="noopener" }
        - [Solar cell](https://www.youtube.com/watch?v=4BX2mEQf09c&t=162s){ target="_blank" rel="noopener" }
        - [Efficiency of solar cells - Measurements](https://www.youtube.com/watch?v=IkVLQALtdQw){ target="_blank" rel="noopener" }
        
    2. Maak een meetplan voor bepalen van het vermogen van een zonnecel.[^meetplan] Formuleer het hoofddoel/onderzoeksvraag, geef een theoretische verwachting en maak een meetstrategie.
    3. Maak een duidelijke opstelling voor het doormeten van een zonnecel.
    4. Bedenk voor jezelf al wat voor verdiepend onderzoek je wilt doen bij de zonnecel.

[^meetplan]: Zie Brightspace voor een korte uitleg over een meetplan.


## Theorie

Een fotovoltaïsche (PV) zonnecel is in essentie een belichte pn-junction. Een pn-junction wordt gemaakt door één stuk halfgeleidermateriaal aan de ene kant p-type te doteren (met acceptoren) en aan de andere kant n-type (met donoren). In het p-gebied is de ladingsdragerdichtheid van gaten hoog, terwijl in het n-gebied de elektronen domineren. Zodra deze twee regio’s met elkaar in contact staan, diffunderen elektronen vanuit het n-gebied naar het p-gebied en diffunderen gaten de andere kant op. Hierdoor blijft in het grensvlak een gedepleteerde (*depletion zone*) laag achter: een gebied waar vrijwel geen vrije ladingsdragers meer aanwezig zijn.

Deze depletion zone bevat wel vaste, geïoniseerde donoren (positief) en acceptoren (negatief), waardoor er een intern elektrisch veld ontstaat dat de diffusie stopt. Dit veld vormt de basis van de pn-juntion. In een zonnecel zorgt juist dit veld ervoor dat nieuw gegenereerde elektronen en gaten, door de absorptie van fotonen, uit elkaar worden getrokken en richting de n- en p-zijde bewegen. Wanneer er nu een extern draad tussen de n- en p-zijde wordt gelegd ontstaat er een stroom. Deze fotonen gegeneerde stroom is dus lichtafhankelijke stroom \(I_{\mathrm{ph}}\).

![Schematische weergave van een zonnecel.](../assets/periode 2/Zonnecel_schematisch.png)

*Figuur: Schematische weergave van een zonnecel.*

Wanneer een externe belasting \(R\) wordt aangesloten, ontstaan er een spanning \(V\) en stroom \(I\) waarvan de waarde afhankelijk is van het gekozen belasting \(R\). Door \(R\) te variëren kun je de stroomsterkte en voltage variëren en krijg je een volledige I-V-curve. Het maximale elektrische vermogen volgt uit

\[
P = IV,
\]

en het punt waarop dit vermogen maximaal is heet het *maximum power point* (\(P_{\mathrm{mpp}}\)). In commerciële PV-systemen wordt dit punt automatisch gevolgd door de omvormer, die tevens de DC-uitgang omzet naar net-geschikte AC.

De interne kwaliteit van een zonnecel wordt gewoonlijk gekarakteriseerd met de *fill factor* (FF):

\[
FF = \frac{P_\mathrm{mpp}}{V_{\mathrm{oc}} I_{\mathrm{sc}}} \times 100\%.
\]

Hierbij zijn \(V_{\mathrm{oc}}\) de openklemspanning en \(I_{\mathrm{sc}}\) de kortsluitstroom. De FF geeft aan hoe rechthoekig de I-V-curve is. De totale efficiëntie vereist daarnaast kennis van het aangeboden lichtvermogen \(P_{\mathrm{lamp}}\):

\[
\eta = \frac{P_\mathrm{mpp}}{P_{\mathrm{lamp}}} \times 100\%.
\]

![Equivalent elektrisch model van een zonnecel.](../assets/periode 2/zonnecel_model.svg)

*Figuur: Equivalent elektrisch model van een zonnecel met fotostroombron \(I_{\mathrm{ph}}\), diode \(I_D\), uitgangsstroom \(I\) en spanning \(V\) over de variabele belasting \(R\).*

Het elektrisch gedrag van een zonnecel wordt doorgaans beschreven met het één-diode-model (zie figuur hierboven). De fotostroom \(I_{\mathrm{ph}}\) werkt als een spanningsonafhankelijke lichtbron, terwijl de diode het spanningsafhankelijke recombinatiepad vormt. Uit de knooppuntvergelijking volgt:

\[
I = I_{\mathrm{ph}} - I_D.
\]

De diodestroom wordt beschreven door de wet van Shockley[^shockley]:

\[
I_D = I_0 \left( e^{\frac{qV}{nkT}} - 1 \right),
\]

zodat de volledige I-V-relatie van de zonnecel wordt:

\[
I = I_{\mathrm{ph}}
    - I_0 \left( e^{\frac{qV}{nkT}} - 1 \right).
\]

De twee uiterste punten van de I-V-curve volgen direct uit dit model. Bij \(V=0\) is de diodestroom verwaarloosbaar en geldt:

\[
I_{\mathrm{sc}} = I_{\mathrm{ph}}.
\]

Bij \(I=0\) verkrijgt men de openklemspanning:

\[
V_{\mathrm{oc}} = \frac{nkT}{q}
\ln\!\left( \frac{I_{\mathrm{ph}}}{I_0} + 1 \right).
\]

Door de belasting \(R\) systematisch te variëren kan de volledige I-V-curve experimenteel worden bepaald en daarmee het maximum power point, de fill factor en de efficiëntie van de zonnecel.

[^shockley]: De benaming “de wet van Shockley” verdient enige nuance. Hoewel William Shockley een belangrijke bijdrage leverde aan de halfgeleiderfysica, is hij later bekend geworden om zijn controversiële en onwetenschappelijke uitspraken over intelligentie en ras. Deze opvattingen staan haaks op de waarden van de academische gemeenschap. Om die reden kiezen sommige instellingen ervoor om de betreffende diodevergelijking neutraal te benoemen, bijvoorbeeld als de ideale diodevergelijking of de pn-overgangsvergelijking.
# Practicum

## Opstelling en belichting

!!! opdracht "Opdracht 1 — Opstelling"

    1. Plaats de zonnecel in de opstelling.
    2. Richt de lamp zo dat het oppervlak van de zonnecel zo homogeen mogelijk wordt belicht.
    3. Noteer de afstand tussen de zonnecel en de lamp.
    4. Controleer de lichtverdeling door de intensiteit op meerdere plaatsen te meten:
       
        - in het midden;
        - in de vier hoeken;
        - langs de randen.
       
    5. Noteer de resultaten in je digitale labjournaal.
    6. Beoordeel op basis van je metingen of de zonnecel voldoende homogeen wordt belicht.


## I-V-meting

!!! opdracht "Opdracht 2 — I-V-karakteristiek"

    1. Bouw de schakeling uit je meetplan op.
    2. Controleer de schakeling voordat je begint met meten.
    3. Voer een volledige I-V-meting uit door de belasting $R$ systematisch te variëren.
    4. Gebruik minimaal **15–20 meetpunten**.
    5. Zorg ervoor dat je zowel het gebied rond de kortsluitstroom als het gebied rond de openklemspanning voldoende bemonstert.
    6. Registreer voor ieder meetpunt:
       
        - de weerstand $R$;
        - de spanning $V$;
        - de stroom $I$.


## Analyse

!!! opdracht "Opdracht 3 — Analyse"

    1. Plot de gemeten **I-V-curve**.
    2. Bepaal uit je meetgegevens de kortsluitstroom $I_{\mathrm{sc}}$ en de openklemspanning $V_{\mathrm{oc}}$, inclusief een schatting van de onzekerheid.
    3. Bereken voor ieder meetpunt het elektrische vermogen:
    
        $$
        P = IV.
        $$
    
    4. Maak een **P-V-curve**.
    5. Bepaal het maximum power point en daarmee:
       
        - $P_{\mathrm{mpp}}$;
        - $V_{\mathrm{mpp}}$;
        - $I_{\mathrm{mpp}}$.
       
    6. Bereken de **fill factor** van de zonnecel.
    7. Bepaal de **efficiëntie** van de zonnecel.
    8. Maak ook een **P-R-curve**.
    9. Onderzoek of het zinvol is om de P-R-curve met een model te fitten. Beargumenteer je keuze.


# Verdiepend onderzoek

Als je bovenstaande opdrachten hebt afgerond, kun je in de basis een zonnecel karakteriseren. De volgende stap is om zelf een klein onderzoek op te zetten.

Misschien heb je tijdens de eerdere metingen al iets gezien waarvan je wilt weten hoe het de prestaties van de zonnecel beïnvloedt.

Mogelijke voorbeelden zijn:

- afstand tot de lamp;
- invalshoek van het licht;
- lichtintensiteit;
- gedeeltelijke afscherming;
- temperatuur;
- verschillende soorten lichtbronnen.

!!! opdracht "Opdracht 4 — Eigen onderzoek"

    1. Formuleer een korte onderzoeksvraag.
    2. Schrijf een kort **projectvoorstel/Plan van Aanpak** van maximaal 10 regels.
    3. Beschrijf hierin kort:
       
        - wat je wilt onderzoeken;
        - wat je verwacht;
        - welke grootheid je varieert;
        - welke grootheden je meet;
        - hoe je de resultaten gaat analyseren.
       
    4. Bespreek je voorstel met de practicumbegeleider.
    5. Voer na akkoord het experiment uit.
    6. Noteer je meetmethode, resultaten en observaties in je digitale labjournaal.


!!! afronding "Afronding"

    1. Zet de gemaakte figuren in je digitale labjournaal.
    2. Geef iedere figuur een duidelijk onderschrift waarin je uitlegt wat de figuur laat zien.
    3. Vul de **Resultaten en Discussie** aan.
    4. Rapporteer de belangrijkste gevonden waarden met hun onzekerheid.
    5. Bespreek of de gevonden waarden fysisch realistisch zijn.
    6. Bespreek de belangrijkste bronnen van onzekerheid en eventuele systematische afwijkingen.
    7. Trek een conclusie over zowel de karakterisering van de zonnecel als je eigen verdiepende onderzoek.