# Practicum: dieetzout & afbuiging $\beta^-$-straling

## Leerdoelen

- Je kan straling detecteren met een geigerteller.

- Je kunt een ijklijn opstellen en hieraan rekenen.

- Je kunt de onzekerheid van je fout bepalen met Poisson-verdeelde fouten.

- Je kan de richting van magneetveld bepalen doormiddel van afbuiging van bèta-straling.

!!! veiligheid "Veiligheid"

    1.  In dit practicum werken wij met ioniserende straling, was na afloop van het practicum goed je handen.

    2.  In dit practicum werken wij met sterke magneten. Wees voorzichtig met het gebruik van deze magneten, bij botsingen kunnen ze hele scherpe splinters creëren.

    3.  Wij werken met Geigertellers in dit practicum, raak het zwarte membraan van de Geigerteller met niets aan!

    4.  Twijfel je over een handeling of apparaat? Vraag dit altijd aan de practicumbegeleider.

## Introductie

In dit practicum maak je kennis met **twee** (historische) technieken van deeltjesdetectie. Beide experimenten hebben een aparte voorbereiding. In de eerste proef gaan we aan de slag met het bepalen van het Kaliumgehalte in dieetzout. In de tweede proef gaan we de straling manipuleren met een extern magneet veld.

Je werkt in tweetallen aan:

- Proef A --- KCL concentratie bepalen in dieetzout.

- Proef B --- Afbuigen van straling.

<span id="figuur-1"></span>

![Een schematische weergave van $\beta^-$-verval](../assets/periode%203/Beta-minus_Decay.svg.png)

*Figuur 1: Een schematische weergave van $\beta^-$-verval*

## Proef A: KCL concentratie bepalen in dieetzout

Dieetzout is bedoeld voor mensen met een verhoogde bloeddruk die minder natrium (Na) moeten consumeren, maar toch zout willen strooien over hun eten. Het bevat naast het gebruikelijke natriumchloride (NaCl, keukenzout) ook kaliumchloride (KCl). De smaak van KCl is wat bitterder dan van NaCl, maar ook minder sterk, vandaar dat het gebruik van dieetzout niet in alle gevallen gewenster is. Met chemische methoden is KCl lastig te detecteren, omdat het in veel eigenschappen overeenkomt met NaCl. Wat we in dit experiment gaan bekijken is of we met een geigerteller de concentratie van KCl in dieetzout kunnen bepalen. Dit doen we door een ijking uit te voeren middels zelf gemengde monsters met verschillende KCl/NaCl verhoudingen.

### Theorie

Kalium bevat van nature $0{,}012\%$ van de isotoop ${}^{40}\mathrm{K}$ ("kalium-40"), deze vervalt volgens

<span id="vergelijking-1"></span>

$$
{}^{40}\mathrm{K} \rightarrow {}^{40}\mathrm{Ca} + e^{-} + \bar{\nu}_{e}.
\tag{1}
$$

Merk op dat dit verval bètastraling ($e^{-}$, $\beta$-straling) produceert die we kunnen meten met een geigerteller. Normaal gesproken moet je voor het bepalen van gehaltes van radioactieve stoffen rekening houden met een groot aantal variabelen: de activiteit van de straler, de isotopenverhouding en de efficiëntie van de detector, om maar eens wat te noemen. We kunnen echter al deze variabelen ondervangen door een ijklijn te meten met bekende monsterverhoudingen. Wij gebruiken hiervoor dus de literatuurwaardes voor de activiteit van bepaalde stoffen. Hiermee maak je een aantal aannamen die in de praktijk niet altijd op gaan.

!!! voorbereiding "Voorbereiding Kalium-40 Meting"

    1.  Bestudeer hoofdstuk *10.3 Radioactive Decay* uit *University Physics Volume 3 \| OpenStax* [Link](https://openstax.org/books/university-physics-volume-3/pages/10-3-radioactive-decay).

    2.  Zoek literatuurwaarden op voor de concentratie van KCl in verschillende soorten dieetzout en voeg de bron(nen) toe aan je journaal.

    3.  Welke relatie verwacht je tussen het KCl-gehalte van het monster en de gemeten activiteit met de geigerteller. Wat gebeurt er als je langer meet?

    4.  Bereken de vervalconstante $\lambda$ voor ${}^{40}\mathrm{K}$ op basis van de bekende halfwaardetijd $t_{1/2}$.

    5.  Zoek de molmassa van KCl op en bereken hoeveel ${}^{40}\mathrm{K}$-atomen er aanwezig zijn in $1{,}0\,\mathrm{g}$ KCl. *Hint: gebruik $N = n N_\mathrm{A}$, waarbij $N_\mathrm{A}$ het getal van Avogadro is.*

    6.  Bereken de initiële activiteit $A_0 = \lambda N_0$ van $1{,}0\,\mathrm{g}$ KCl. Schat of dit niveau praktisch meetbaar is met een geigerteller.

    7.  Formuleer de onderzoeksvraag en jouw verwachting van dit experiment.

!!! methode "Methode & uitvoering Proef A"

    1.  Bouw een meetopstelling om de activiteit systematisch te kunnen bepalen met de geigerteller.

    2.  Zet de geigerteller aan en kies: counts per minute (CPM), continue meting (vernieuwing elke 5 s). Wacht één minuut totdat het scherm stabiele waarden toont.

    3.  Meet achtergrondstraling en noteer de activiteit in intervallen van $\leq 30$ seconden.

    4.  Bepaal de fout in het massapercentage van ieder monster.

    5.  Meet de activiteit van alle ijkmonsters volgens je vaste meetmethode.

    6.  Meet de activiteit van $10\,\mathrm{g}$ dieetzout volgens dezelfde meetmethode.

!!! opdracht "Verwerking Proef A"

    1.  Verwerk alle meetdata in Python.

    2.  Bepaal de gemiddelde achtergrondactiviteit en corrigeer alle monstermetingen. Wat gebeurd er met je fout op jouw meting?

    3.  Bepaal de standaarddeviatie per monster.

    4.  Maak een ijkgrafiek (activiteit vs. massapercentage KCl) en kies een passende fit om de parameters van de ijkcurve te bepalen.

    5.  Bepaal de activiteit van keukenzout met een 95%-betrouwbaarheidsinterval.

!!! opdracht "Resultaten en Discussie Proef A"

    1.  Toon grafieken van activiteit als functie van meettijd.

    2.  Bespreek of langere meetduur had geleid tot kleinere onzekerheden.

    3.  Toon de ijkgrafiek en bespreek de fitkwaliteit.

    4.  Onderzoek of er systematische afwijkingen zichtbaar zijn en hoe deze de regressie beïnvloeden.

    5.  Verklaar eventuele verschillen tussen jouw metingen en jouw verwachting. Komt jouw verwachting overeen?

!!! afronding "Afronding Proef A"

    1.  Laat resultaten controleren door de practicum begeleider.

    2.  Zet de gevonden figuren in je digitaal labjournaal en maak een duidelijk onderschrift waarin je uitlegt wat de figuren laten zien.

    3.  Vul de **Resultaat- en Discussie**-sectie aan in je labjournaal. Bespreek conclusies en discussie over de kalibratie, concentratie en de fluorescentie.

## Proef B: Afbuigen van $\beta^-$-straling

Radioactiviteit werd aan het einde van de 19e eeuw ontdekt door Henri Becquerel, die spontaan straling uit uraniumverbindingen observeerde. Kort daarna karakteriseerden Pierre en Marie Curie de straling verder en introduceerden zij de termen $\alpha$- en $\beta$-straling. Ernest Rutherford liet zien dat $\beta$-straling sterk wordt afgebogen in elektrische en magnetische velden, terwijl $\alpha$-straling vrijwel onveranderlijk rechtdoor gaat. De richting en mate van de afbuiging maakten duidelijk dat $\beta$-deeltjes licht en negatief geladen moeten zijn. J.J. Thomson kon dit bevestigen door de lading-massa-verhouding te meten en identificeerde $\beta$-straling als elektronen. Daarmee werd duidelijk dat radioactief verval een proces is waarin atoomkernen elektronen kunnen uitzenden (zogenoemd $\beta^{-}$-verval). De studie van de afbuiging van $\beta$-straling speelde een centrale rol bij het begrijpen van de aard van ioniserende straling en de eerste modellen van radioactieve kernen.

### Theorie

Radioactieve bèta-min ($\beta^-$) straling ontstaat wanneer de instabiele isotoop ^40^K in natuurlijk kalium vervalt. Slechts 0,012 % van al het kalium bestaat uit ^40^K, maar dit is voldoende om een meetbare flux van elektronen te produceren. Het verval verloopt via

<span id="vergelijking-2"></span>

$$
{}^{40}\mathrm{K} \;\rightarrow\; {}^{40}\mathrm{Ca} + e^- + \bar{\nu}_e .
\tag{2}
$$

Het uitgezonden $\beta^-$-deeltje is een elektron met kinetische energie in de orde van enkele honderd keV. Omdat het elektron negatief geladen is, ondervindt het in een magnetisch veld een Lorentzkracht. Voor een elektron met snelheid $\mathbf{v}$ in een magnetisch veld $\mathbf{B}$ geldt

<span id="vergelijking-3"></span>

$$
\mathbf{F}_{\mathrm{L}} = -e\, \mathbf{v} \times \mathbf{B},
\tag{3}
$$

waarbij het minteken de negatieve lading van het elektron aangeeft. De richting van de afbuiging is altijd loodrecht op zowel de bewegingsrichting als het magneetveld.

<span id="figuur-2"></span>

![Lorentz-kracht op een bewegende negatieve lading met een magneet veld.](../assets/periode%203/magneetveld_tikz.svg)

*Figuur 2: Lorentz-kracht op een bewegende negatieve lading met een magneet veld.*

Dit is een gevolg van de Lorentzkracht $\vec{F} = q\,\vec{v}\times\vec{B}$: het vectorproduct garandeert dat er geen component van de kracht in de bewegingsrichting zit, zodat het deeltje niet versnelt of vertraagt, maar alleen van richting verandert. Hierdoor levert het magnetisch veld precies de centripetale kracht die nodig is voor een kromlijnige baan. Kwantitatief volgt voor de baanstraal uit

<span id="vergelijking-4"></span>

$$
r = \frac{m_e v_e}{|q|B},
\tag{4}
$$

waarbij $m_e$ en $v_e$ de massa en snelheid zijn van het elektron, $q$ is de lading van het elektron en $B$ is de sterkte van het magnetische veld. Dit resulteert in een cirkel- of spiraalvormig traject wanneer het veld homogeen genoeg is. Deze afbuiging vormt de basis van veel meet- en versnellertechnieken in de natuurkunde: in cyclotrons, synchrotrons en storage rings worden geladen deeltjes gecontroleerd geleid door zorgvuldig ingestelde magnetische veldconfiguraties.

In dit practicum onderzoek je dit verschijnsel op kleine schaal door een bron van $\beta^-$-straling te combineren met ringmagneten en een Geiger--Müller detector. Door het stapelen en oriënteren van de magneten varieert de lokale veldsterkte en veldrichting. Hierdoor verandert de mate waarin de elektronenbundel afbuigt voordat deze de detector bereikt. In dit practicum ga je de oriëntatie van het magneetveld bepalen en bepaal je de optimale sterkte van het magneetveld voor jouw detector.

<span id="figuur-3"></span>

![Voorbeeldopstelling voor detectie van $\beta^-$-straling via een Geiger-Müller teller.](../assets/periode%203/Opstelling_afbuigin.png)

*Figuur 3: Voorbeeldopstelling voor detectie van $\beta^-$-straling via een Geiger-Müller teller.*

!!! voorbereiding "Voorbereiding Proef B"

    1.  Bereken de snelheid van het elektron als de energie enkele honderden KeV bedraagt.

    2.  Zoek op welke sterkte een typisch Neodynium magneet heeft.

    3.  Bereken de Lorentzkracht op het elektron vlak boven het oppervlakte van het magneet.

    4.  Wat is het gevolg van de Lorentzkracht op de bewegingsrichting van het elektron?

    5.  Geef een inschatting geven van de straal van de baan die het elektron aflegt hiermee.

!!! methode "Methode & Uitvoering Proef B"

    1.  Zet de geigerteller aan en kies de *Real-Time* meetmodus (datavernieuwing elke 5 s). Wacht 1--2 minuten tot stabiele waarden zichtbaar zijn.

    2.  Meet de achtergrondstraling en noteer de activiteit. Herhaal deze in tussenpozen van 1 minuut.

    3.  Maak de meetopstelling voor een nulmeting (meting zonder magneetveld) en meet de activiteit. Herhaal deze in tussenpozen van 1 minuut.

    4.  Bouw de opstelling weergegeven in Fig. [3](#figuur-3) 2 met 6 magneten (3 links en 3 rechts), waarbij het magnetisch veld aan beide zijden dezelfde richting heeft. Meet de activiteit.

    5.  Draai vervolgens de richting van het magnetisch veld om en meet opnieuw de activiteit.

    6.  Bepaal de richting van het magnetisch veld met behulp van de gemeten verschillen.

    7.  Bepaal experimenteel de optimale magneetveldsterkte, varieer hierbij het aantal magneten en noteer de activiteit. Wissel qua opstelling en ga niet zelf de magneten aanpassen!

!!! opdracht "Verwerking Proef B"

    1.  Verwerk alle meetgegevens in Python.

    2.  Bepaal de gemiddelde achtergrondactiviteit en de fout hierop.

    3.  Bepaal de gemiddelde activiteit van de nulmeting en de fout hierop.

    4.  Corrigeer de gemeten activiteiten met magneten voor de nulmeting.

    5.  Bepaal de standaarddeviatie van de gecorrigeerde activiteit.

    6.  Maak een figuur waarin de activiteit wordt uitgezet als functie van de richting van het magnetisch veld.

    7.  Maak een grafiek van de activiteit als functie van het aantal ringmagneten en kies een passende regressie om het optimum te bepalen.

!!! opdracht "Resultaten en Discussie Proef B"

    1.  Toon grafieken van de activiteit uitgezet tegen het aantal magneten.

    2.  Toon grafieken van de activiteit uitgezet tegen de richting.

    3.  Hoe zeker weet je welke kant het magneetveld op staat?

    4.  Wanneer is jouw gemeten activiteit maximaal, hoeveel magneten heb je hiervoor nodig?

!!! afronding "Afronding Proef B"

    1.  Laat resultaten controleren door de practicum begeleider.

    2.  Zet de gevonden figuren in je digitaal labjournaal en maak een duidelijk onderschrift waarin je uitlegt wat de figuren laten zien.

    3.  Vul de **Resultaat- en Discussie**-sectie aan in je labjournaal.

## Appendix: Voorbereidingsformulier practicum proef A

**Materialen**

- Dieetzout

- Keukenzout (NaCl)

- Kaliumchloride (KCl)

- Weegschaal

- Afweegpapiertjes

- Vijzel

- Geigerteller (zie Safecast-documentatie en practicumhandleiding)

- 6 samples (0% - 20 % $\dots$ - 100%) + onbekende concentratie. Studenten wegen de massa af. Practicumbegeleider zet potten klaar.

## Appendix: Voorbereidingsformulier practicum proef B

**Materialen**

- Kaliumchloride (KCl)

- 8 ringmagneten

- 2 statieven

- 2 statiefklemmen

- 2 universele klemmen

- U-paalhouder

- Geigerteller (zie Safecast-documentatie en practicumhandleiding)
