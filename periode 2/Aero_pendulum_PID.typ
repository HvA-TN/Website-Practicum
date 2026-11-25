#import "../../styl.typ": *
#show: stijl.with(titel: "Aero pendulum PID", kop: "Technische Natuurkunde — Na2.2")

#show: vergelijking_refs
#praktikumtitle[PID-regeling van een aeropendulum]

#heading(level: 1, numbering: none)[Leerdoelen]

#[
  #set list(marker: leerdoel-teken)
  - Je kunt uitleggen hoe terugkoppeling wordt gebruikt om de hoek van het aeropendulum te regelen.

  - Je kunt de invloed van P, D en I op de beweging experimenteel onderzoeken.

  - Je kunt verschillende vormen van demping herkennen en een PID-regelaar stapsgewijs afstellen.

  - Je kunt meetgegevens in Python weergeven en de regeling beoordelen op overshoot, insteltijd en blijvende afwijking.

  - Je kunt uitleggen wat softwarematige begrenzingen doen en waarom ook hardwarematige beveiliging nodig is.
]

#v(1fr)

#veiligheid(title: [Veiligheid])[
  + Houd voldoende afstand van de draaiende propeller. Zorg dat handen, haar en losse voorwerpen buiten het bewegingsbereik blijven.

  + Schakel de motorvoeding uit voordat je de bedrading, sensor of het Arduino-programma aanpast. Laat de opstelling en voedingsinstellingen controleren door de practicumbegeleider.

  + Houd de uitschakeling van de motorvoeding bereikbaar. Schakel direct uit als de uitslagen steeds groter worden of de arm richting een mechanische aanslag beweegt.

  + Wacht tot de propeller stilstaat voordat je de opstelling benadert. Twijfel je over een handeling? Vraag dit aan de practicumbegeleider.
]

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Introductie]

In het open-looppracticum heb je onderzocht hoe het aeropendulum reageert op een ingestelde motoruitgang. Je koos een PWM-waarde en mat welke hoek de arm aannam. Voor een andere gewenste hoek moest je zelf een nieuwe instelling kiezen. Ook als de arm door een verstoring van positie veranderde, bleef de ingestelde motoruitgang gelijk.\
\
Veel technische systemen moeten hun uitgang juist automatisch op een gewenste waarde houden. Denk aan de cruisecontrol van een auto. Wanneer de auto een helling oprijdt, is meer aandrijfkracht nodig om dezelfde snelheid te behouden. De cruisecontrol vergelijkt de gemeten snelheid met de ingestelde snelheid en past de aandrijving aan. Het steeds opnieuw meten, vergelijken en bijsturen noemen we #emph[terugkoppeling].\
\
Bij het aeropendulum kunnen we hetzelfde principe gebruiken. We kiezen nu een gewenste hoek. De hoeksensor meet waar de arm zich bevindt en de regelaar past de motoruitgang aan. Staat de arm te laag, dan moet de propeller meer stuwkracht leveren. Nadert de arm de gewenste hoek, dan moet de regelaar op tijd terugregelen. De arm en motor reageren immers niet onmiddellijk: te laat terugregelen kan ervoor zorgen dat de arm doorschiet.\
\
In dit practicum onderzoek je hoe je die correctie kunt verbeteren. Je begint met een eenvoudige P-regelaar, die reageert op het verschil tussen de gewenste en gemeten hoek. Daarna voeg je D toe om de beweging te dempen en I om een blijvende afwijking te verkleinen. Met je eigen metingen onderzoek je of de arm snel en rustig tot stilstand komt bij 30, 60 en 90 graden. Tot slot bekijk je hoe begrenzingen het regelgedrag en de veiligheid beïnvloeden.

*Leeswijzer.* Werk in `Arduino/Closed_loop/script.ipynb`: eerst de hoekmeting, daarna PID en meetdata, vervolgens de hoekgrens en PWM-stapbegrenzing. Alle proeven gebruiken `Stap_4_Closed_loop.ino`. Python verzorgt de instellingen en meetdata; de Arduino voert de regeling uit. De appendix bevat achtergrond en uitleg bij de Python-code.

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Theorie]

#heading(level: 2, numbering: none)[Van open loop naar terugkoppeling]

De opstelling blijft hetzelfde als bij open loop: een propeller beweegt de arm omhoog en de zwaartekracht trekt de arm naar beneden. Het verschil zit in de aansturing. De motoruitgang wordt nu voortdurend aangepast aan de gemeten hoek. @aero_pendulum_pid--fig:aeropid_regelkring laat deze gesloten regelkring zien.

#figure(
  [#include "Figuren/pid_regelkring.typ"],
  caption: [Gesloten regelkring van het aeropendulum. De gemeten hoek wordt teruggekoppeld en vergeleken met de gewenste hoek.],
  kind: image,
) <aero_pendulum_pid--fig:aeropid_regelkring>

De gewenste hoek noemen we het #emph[setpoint], $r(t)$. De gemeten hoek schrijven we als $theta(t)$. Beide hoeken meten we vanaf de verticale ruststand. Het verschil is de #emph[regelfout]:

$ e(t) = r(t) - theta(t). $

Bij een gewenste hoek van 60 graden en een gemeten hoek van 50 graden is de fout dus +10 graden. De arm staat nog te laag. Staat de arm op 65 graden, dan is de fout −5 graden en staat de arm te hoog.


#heading(level: 2, numbering: none)[P: reageren op de afwijking]

Een proportionele regelaar berekent een bijdrage die evenredig is met de fout:

$ u_P(t) = K_p e(t). $

De factor $K_p$ bepaalt hoe sterk de regelaar corrigeert. Bij dezelfde fout geeft een grotere P-waarde meer motoruitgang. De arm kan daardoor sneller omhoog bewegen, maar ook verder doorschieten en gaan oscilleren.

Met alleen P kan een blijvende afwijking ontstaan. Om de arm omhoog te houden is voortdurend stuwkracht nodig. Als de fout nul is, is de P-bijdrage ook nul. Een P-regelaar zonder extra basisuitgang heeft daarom een fout nodig om een niet-nul motoruitgang te leveren.

#heading(level: 2, numbering: none)[D: de beweging dempen]

De D-term reageert op hoe snel de hoek verandert. Beweegt de arm snel omhoog, dan vermindert deze bijdrage de motoruitgang al voordat de gewenste hoek is bereikt. Dat kan het doorschieten verminderen. In de gebruikte regeling geldt:

$ u_D(t) = -K_d frac(upright(d) theta, upright(d) t). $

Een grotere D-waarde geeft meer tegenwerking bij dezelfde hoeksnelheid. Te veel D kan de respons traag maken en kleine schommelingen in de hoekmeting sterk laten doorwerken in de motoruitgang.

#heading(level: 2, numbering: none)[I: een blijvende afwijking wegwerken]

De I-term telt de fout in de tijd op:

$ u_I(t) = K_i integral_0^t e(tau) thin upright(d) tau. $

Blijft de arm onder het setpoint, dan groeit deze bijdrage totdat er voldoende motoruitgang is. De opgebouwde bijdrage kan daarna aanwezig blijven, ook wanneer de fout nul is. Zo kan I de blijvende afwijking van de P-regelaar verkleinen. Een te grote I-waarde kan echter opnieuw overshoot en oscillaties veroorzaken: een opgebouwde bijdrage verdwijnt niet meteen wanneer de arm het setpoint bereikt.

De PID-regelaar combineert deze drie bijdragen: $u(t) = u_P(t) + u_D(t) + u_I(t)$. De werkelijk toegepaste PWM is begrensd tussen nul en `max_pwm`. Een negatieve berekende uitgang kan de motor dus niet omgekeerd aandrijven. In het experiment stel je ze in die volgorde af. Zo kun je bij iedere stap zien wat de toegevoegde bijdrage verandert.

#pagebreak(weak: true)

#heading(level: 2, numbering: none)[De respons beoordelen]

Een grafiek van de hoek tegen de tijd laat zien hoe de arm naar een nieuwe doelhoek beweegt. We noemen dit de #emph[respons]. Om verschillende instellingen te vergelijken, kijken we naar drie eigenschappen:

- *Overshoot:* hoeveel graden de arm maximaal boven de doelhoek uitkomt.
- *Insteltijd:* de tijd die nodig is voordat de hoek binnen een afgesproken band rond het setpoint komt en daar gedurende de rest van de meting blijft.
- *Stationaire fout:* het verschil tussen het setpoint en de gemiddelde hoek nadat de beweging tot rust is gekomen.

Gebruik voor alle proeven dezelfde tolerantieband en vermeld de meetduur. Neem de overshoot als nul wanneer de arm niet boven het setpoint komt. Een stabiele eindhoek buiten de band heeft wel een stationaire fout, maar geen bereikte insteltijd. Als de respons nog niet stationair is, rapporteer je de stationaire fout als niet bepaald en verleng je zo nodig de meting.

Ook de vorm van de beweging is belangrijk. Een ondergedempte respons heeft uitdovende oscillaties. Bij een standaard tweedeordesysteem met vaste eigenfrequentie geeft kritische demping de snelste staprespons zonder overshoot. Een overgedempte respons nadert die eindwaarde langzamer, eveneens zonder oscillaties. Kritische demping is iets anders dan de grens van instabiliteit: bij die grens doven oscillaties juist niet meer uit.

#figure(
  image("Arduino/ClosedLoop/figuren/Niet_Critisch.pdf", width: 85%),
  caption: [Ondergedempte respons bij een doelhoek van 60 graden. De arm schiet door en oscilleert met afnemende amplitude. De onderste grafiek laat zien hoe de PWM daarbij verandert.],
  kind: image,
) <aero_pendulum_pid--fig:ondergedempt>

#pagebreak(weak: true)

In @aero_pendulum_pid--fig:ondergedempt blijft de arm lange tijd heen en weer bewegen. In @aero_pendulum_pid--fig:bijna-kritisch nadert de arm dezelfde doelhoek veel rustiger. De tweede respons noemen we hier bijna kritisch gedempt: er is nog een kleine overshoot zichtbaar. De meting is daarmee een praktisch voorbeeld van rustig regelgedrag, geen bewijs van exact kritische demping. Het aeropendulum met motor en PID is bovendien ingewikkelder dan een ideaal tweedeordesysteem.

#figure(
  image("Arduino/ClosedLoop/figuren/Critisch.pdf", width: 85%),
  caption: [Bijna kritisch gedempte respons bij een doelhoek van 60 graden: weinig overshoot en een snelle benadering van de doelhoek. Vergelijk zowel de hoek als de PWM met de ondergedempte respons.],
  kind: image,
) <aero_pendulum_pid--fig:bijna-kritisch>

In opdracht 2 probeer je deze twee soorten respons zelf te maken. Het gaat om het herkennen en beïnvloeden van het gedrag; de precieze meetcurve hangt af van jouw opstelling en instellingen. De appendix geeft de verdere afleiding van de beweging en de invloed van motorvertraging op stabiliteit.

#voorbereiding(title: [Voorbereiding])[
  + Installeer de Arduino IDE en de Python-omgeving op je laptop. Controleer of de Arduino Uno R4 Minima wordt herkend en dat de juiste poort kan worden geselecteerd #link("https://www.arduino.cc/en/software/")[*Link naar Arduino IDE*].

  + Installeer de bibliotheken `AS5600` en `PID_v1` (PID) in de Arduino IDE. Controleer de installatie door de meegeleverde stap-4-sketch te compileren; upload met uitgeschakelde motorvoeding.

  + Clone of download de GitHub-repository van de practicumhandleiding. Controleer of de bestanden correct zijn gedownload en dat je toegang hebt tot de arduino- en pythonbestanden in de map. #link("https://github.com/HvA-TN/Practica")[*Link naar github repository*]
  + Leg in eigen woorden @aero_pendulum_pid--fig:aeropid_regelkring uit. Welke signalen worden gemeten en welke worden aangestuurd?

  + Leg in eigen woorden uit wat P, D en I doen en hoe ze elkaar beïnvloeden. Gebruik de bewegingsvergelijking en de drie bijdragen van de PID-regelaar om dit te onderbouwen.

  + Welke risico's voorzie je bij het experimenteren met een PID-regelaar? Beschrijf één concrete situatie waarbij actieve feedback gevaarlijk kan zijn. Welke voorzorgsmaatregelen kun je nemen? Welke rol hebben softwarematige en hardwarematige beveiliging hierbij? Onderbouw welke combinatie je zou gebruiken.
]

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Experiment]

#opdracht(title: [Opdracht 0: opstelling opbouwen en controleren])[
  + Bouw de opstelling op volgens @aero_pendulum_PID--tab:aansluitingen. Laat de bedrading en voedingsinstellingen controleren. Spreek de maximale voedingsspanning en PWM af en noteer deze.

  + Upload `Stap_4_Closed_loop.ino` met uitgeschakelde motorvoeding. Open `script.ipynb`, stel de juiste poort in en sluit Serial Monitor en Serial Plotter.

  + Bepaal met *1. Hoek meten* de sensorhoek in de verticale ruststand. Gebruik deze als `beginhoek` en controleer de hoekmeting bij optillen.

  + Controleer in *2. PID instellen* de werkhoek met `max_pwm=0` en de motorvoeding uit. Deze moet in rust ongeveer nul zijn en toenemen bij optillen. Je zult dit moeten corrigeren als dit niet klopt. Controleer voor iedere meetcel je eigen instellingen: het uitvoeren van de cel start ook de proef.
]


#figure(
  table(
    columns: (1.2fr, 0.8fr, 1fr, 0.8fr),
    align: left + horizon,
    inset: (x: 8pt, y: 5pt),
    stroke: none,
    fill: none,
    table.hline(y: 0, stroke: 0.8pt),
    table.header([*Van Arduino*], [*Draadkleur*], [*Naar component*], [*Aansluiting*]),
    table.hline(y: 1, stroke: 0.4pt),
    [GND (Analog)], [Zwart], [Hoeksensor], [GND],
    [3.3 V], [Rood], [Hoeksensor], [VCC],
    [A4], [Groen], [Hoeksensor], [SDA],
    [A5], [Wit], [Hoeksensor], [SCL],
    table.hline(y: 5, stroke: 0.4pt),
    [D9 (digitaal, PWM)], [Paars], [H-brug], [ENA],
    [D10 (digitaal)], [Oranje], [H-brug], [IN1],
    [D11 (digitaal)], [Geel], [H-brug], [IN2],
    table.hline(y: 8, stroke: 0.8pt),
  ),
  caption: [Signaalaansluitingen van de Arduino naar de AS5600-hoeksensor en de L298N H-brug. Gebruik daarnaast de motor- en voedingsaansluitingen uit het open-looppracticum, met een gemeenschappelijke GND.],
  kind: table,
  supplement: [Tabel],
) #label("aero_pendulum_PID--tab:aansluitingen")



#pagebreak(weak: true)

#opdracht(title: [Opdracht 1: P-regeling onderzoeken])[
  + Kies een doelhoek van 30 graden en begin met een kleine P-waarde, met I en D op nul. Gebruik de afgesproken PWM-grens. Voorspel de respons.

  + Onderzoek minstens vijf P-waarden vanuit dezelfde beginstand. Houd de overige instellingen gelijk. Bewaar de meetdata en instellingen (`opslaan=True`).

  + Maak vergelijkbare grafieken van hoek, setpoint en PWM tegen de tijd. Bepaal overshoot, insteltijd en stationaire fout.

  + Onderzoek binnen de veilige grenzen wanneer oscillaties niet meer uitdoven. Stop direct bij sterk toenemende uitslagen; vermeld wanneer de veilige grens verder onderzoek verhindert.

  + Verklaar je waarnemingen met de theorie en vergelijk ze met je voorspelling. Betrek de stabiliteitsafleiding in de appendix bij je verklaring.
]

#pagebreak(weak: true)

#opdracht(title: [Opdracht 2: P, D en I afstellen en de voorbeeldfiguren namaken])[
  + Begin bij 60 graden met een P-instelling uit opdracht 1 en controleer opnieuw de stabiliteit. Onderzoek vervolgens de invloed van D en daarna van I. Verander telkens slechts een parameter.

  + Maak met eigen metingen de twee soorten respons uit @aero_pendulum_pid--fig:ondergedempt en @aero_pendulum_pid--fig:bijna-kritisch na. Onderbouw je keuze van de instellingen.

  + Vergelijk de responsen in grafieken met gelijke asschalen. Bepaal overshoot, insteltijd en stationaire fout en beoordeel de demping. Leg instellingen en resultaten vast in je labjournaal, inclusief doelhoek, P, I, D, regelinterval en ingestelde grenzen.

  + Onderzoek of je de arm ook op 90 graden kunt stabiliseren. Welke aanpassingen zijn nodig en hoe verklaar je die?
]


#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Veiligheid bij PID-regeling]

Een regeling die uiteindelijk de juiste waarde bereikt, kan onderweg toch een gevaarlijke situatie veroorzaken. Denk aan een drukinstallatie: als een pomp te lang blijft toevoeren, kan de druk boven de toegestane waarde uitkomen. Het later herstellen van de druk maakt die overschrijding niet ongedaan. Ook bij het aeropendulum kan overshoot ongewenst zijn, bijvoorbeeld wanneer de arm een mechanische aanslag raakt.\
\

*Softwarematige beveiliging* gebruikt metingen om in te grijpen. Je kunt bijvoorbeeld de motor uitschakelen wanneer een maximale hoek wordt gemeten, of voorkomen dat de motoruitgang te snel toeneemt. Dit werkt alleen als de sensor, het programma en de aansturing correct functioneren. Bovendien verdwijnt de beweging niet meteen als de motor wordt uitgeschakeld: de arm kan door zijn snelheid nog verder bewegen. Ook het meetinterval en de verwerking kosten tijd: een grensoverschrijding wordt niet onmiddellijk gedetecteerd. Een PWM-stapbegrenzing beïnvloedt de aansturing, maar garandeert op zichzelf geen veilige hoek.\
\

*Hardwarematige beveiliging* kan onafhankelijk van het regelprogramma ingrijpen. Voorbeelden zijn een noodstop die de motorvoeding onderbreekt en een eindschakelaar die de aandrijving rechtstreeks uitschakelt. Afscherming beperkt de kans op contact met de propeller. Bij drukinstallaties kan een geschikt veiligheidsventiel overdruk afvoeren (overdrukventiel). Welke voorziening nodig is, hangt af van het gevaar en de opgeslagen energie. Beoordeel daarom naast het regelgedrag ook wat er bij een storing kan gebeuren.\
\

In de volgende opdrachten onderzoek je twee softwarematige maatregelen. Eerst test je een stop bij overschrijding van de hoekgrens, daarna een begrenzing van de PWM-toename. Beoordeel telkens zowel de invloed op de beweging als de beperkingen van de maatregel.

#opdracht(title: [Opdracht 3: maximale hoek van 100 graden])[
  + Gebruik 4. Hoekgrens instellen met kies zelf een maximale hoek. Neem je eigen nulstand en PID-instellingen over en kies zelf een geschikte doelhoek.

  + Test de hoekstop eerst met uitgeschakelde motorvoeding en `max_pwm=0`. Beweeg de arm alleen voorbij de grens als dit mechanisch mogelijk is. Noteer je voorspelling en waarneming.

  + Herstel de afgesproken PWM-grens en vergelijk de respons bij 90 graden met opdracht 2. Onderzoek of je de regeling kunt verbeteren. Lok met draaiende propeller geen overschrijding uit.

  + Beoordeel de beperkingen van deze beveiliging. Welke aanvullende hardwarematige voorziening zou je kiezen en waarom?
]

#pagebreak(weak: true)

#opdracht(title: [Opdracht 4: de PWM-toename per tijdstap verkleinen])[
  + Gebruik 5. PWM-stap begrenzen met dezelfde sketch en je eigen instellingen. Behoud de hoekgrens van 100 graden. Maak bij 60 graden een referentiemeting met `max_pwm_stap=0` (begrenzing uit).

  + Onderzoek verschillende positieve waarden van `max_pwm_stap`. Deze begrenst alleen de stijging per regelstap; dalen en stoppen gaan direct. Houd de overige instellingen gelijk en voorspel telkens de respons.

  + Vergelijk hoek en PWM met de referentiemeting. Onderzoek ook welke rol `delta_t` speelt. Onderbouw je conclusie met de meetgegevens.

  + Stel de PID-regelaar opnieuw af voor een gekozen stapgrens en test bij 30, 60 en 90 graden. Herhaal je eindinstellingen minstens drie keer. Verklaar wanneer stabiliseren wel of niet lukt.
]

#afronding(title: [Afronding])[
  + Schakel de motorvoeding uit en wacht tot de propeller stilstaat. Laat de meetresultaten controleren door de practicumbegeleider.

  + Voeg de grafieken en parametertabellen toe aan je digitale labjournaal. Geef iedere figuur een duidelijk onderschrift met de gebruikte instellingen.

  + Beschrijf in *Resultaten en Discussie* hoe P, D en I de respons beïnvloedden.

  + Bespreek de invloed en beperkingen van de hoekstop en de PWM-stapbegrenzing. Vergelijk je conclusies met je verwachtingen uit de voorbereiding.

  + Doe eventueel eerst het onderdeel *Extra* hieronder. Breek daarna de opstelling af en ruim de werkplek op. Controleer of alle componenten compleet zijn.
]

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Extra: Arduino aanpassen met PlatformIO]

Met de extensie *PlatformIO IDE* kun je de Arduino-code vanuit VS Code aanpassen, compileren en uploaden.

+ Installeer de extensie en maak via *PlatformIO Home > New Project* een project voor *Arduino Uno R4 Minima*, met framework *Arduino*.
+ Verwijder de gegenereerde `src/main.cpp` en kopieer `Stap_4_Closed_loop.ino` naar `src`. Laat de extensie `.ino` behouden. Voeg via *Libraries > Add to Project* de bibliotheken *AS5600* van Rob Tillaart en *PID* van Brett Beauregard toe.
+ Kies *Project Tasks > Build*. Los eventuele compilatiefouten op voordat je verdergaat.
+ Pas in je kopie de precisie van de verzonden werkhoek aan: verander `Serial.print(werkhoek, 3)` naar `Serial.print(werkhoek, 1)`. Voorspel wat je in de meetdata terugziet.
+ Schakel de motorvoeding uit, verbind de Arduino via USB en sluit actieve notebookmetingen en seriële monitors. Kies *Upload* in PlatformIO. Controleer daarna in de notebook de meting met `max_pwm=0`. Zet de wijziging terug en upload opnieuw.

Lukt uploaden niet? Controleer eerst het gekozen board, de USB-verbinding en of een ander programma de poort gebruikt. De basisinstellingen in `platformio.ini` zijn:

```ini
[env:uno_r4_minima]
platform = renesas-ra
board = uno_r4_minima
framework = arduino
```

Laat de door *Add to Project* toegevoegde `lib_deps` staan. Meer uitleg: #link("https://docs.platformio.org/en/latest/integration/ide/vscode.html")[PlatformIO in VS Code] en #link("https://docs.platformio.org/en/latest/boards/renesas-ra/uno_r4_minima.html")[Uno R4 Minima].

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Appendix: Materialenlijst]
- Arduino Uno R4 Minima;
- L298N H-brug;
- AS5600 magnetische hoeksensor;
- Elektromotor met propeller;
- Externe voeding;
- USB-C kabel en koppelstuk;
- Platform met paal en 3D geprint aansluitstuk, arm met draaipunt en magneet;
- Diverse aansluitdraden (Male-Male, Male-Female, Female-Female);
- Laptop of computer met Arduino IDE en Python 3.11+;

#heading(level: 1, numbering: none)[Appendix: Python-aansturing en meetdata]

De functies staan in `Arduino/Closed_loop/closed_loop/meting.py`. Je hoeft deze module niet aan te passen. `test_hoek` meet de ruwe sensorhoek met de motoruitgang op nul. `voer_pid_meting_uit` stuurt de instellingen naar de Arduino en retourneert twee resultaten: de meetpunten en het pad naar de CSV (of `None` als opslaan uitstaat). Elk PID-meetpunt bevat achtereenvolgens tijd in seconden, doelhoek, werkhoek in graden en toegepaste PWM.

De werkhoek is de sensorhoek minus `beginhoek`, omgerekend naar het bereik van -180 tot 180 graden. De CSV bevat de kolommen `tijd`, `hoek` en `pwm`; de doelhoek en andere instellingen staan in de commentaarheader. Daarom gebruikt de notebook `pd.read_csv(bestand, comment="#")`. Zonder CSV maakt de notebook een DataFrame uit de vier waarden in het geheugen.

Voor CSV-opslag in de hoekgrenscel moet ook `opslaan=opslaan` aan de functieaanroep worden toegevoegd en de variabele op `True` staan.

Na de hoekgrensproef of de begrensde proef kun je met onderstaande cel de juiste meetreeks selecteren. De oorspronkelijke cel Meetdata bekijken verwijst alleen naar de eerste PID-meting.

#jupytercode([Meetgegevens van de vervolgproeven bekijken])[
  ```python
  # Kies de hoekgrensproef:
  punten, bestand = metingen_veiligheid, csv_pad_veiligheid
  # Of kies de proef met PWM-stapbegrenzing:
  # punten, bestand = metingen_begrensd, csv_pad_begrensd

  if bestand is None:
      df = pd.DataFrame(
          punten, columns=["tijd", "doelhoek", "hoek", "pwm"]
      )
  else:
      df = pd.read_csv(bestand, comment="#")
  display(df.head())
  ```
]

Bij een fout, zoals de hoekstop, keert de functie niet normaal terug: de resultaatvariabelen worden dan niet bijgewerkt en kunnen nog data van een vorige proef bevatten. Met `opslaan=True` worden reeds ontvangen meetpunten wel bewaard; lees in dat geval het CSV-pad uit de uitvoer en laad dat bestand expliciet.

#heading(level: 2, numbering: none)[Stoppen en communicatie]

Met `mode="fixed"` stopt de proef na `meetduur`; met `mode="continuous"` onderbreek je de notebookcel om te stoppen. Python verstuurt tijdens het meten ongeveer iedere halve seconde `PING`. De Arduino schakelt de motor uit als er langer dan drie seconden geen heartbeat is ontvangen. Daarnaast probeert Python bij afronding, onderbreking of een fout altijd `STOP` te versturen. De volgende ingekorte passage uit de meetfunctie laat dit zien:

#jupytercode([Stopcommando bij afsluiten van de meting])[
  ```python
  finally:
      try:
          _stuur(arduino, "STOP")
          arduino.flush()
      except (serial.SerialException, OSError) as exc:
          print(f"STOP kon niet worden verzonden: {exc}")
  ```
]

Dit fragment hoort bij de functie in de module en is geen losse notebookcel. Blijf bij onverwacht gedrag de motorvoeding zelf uitschakelen. De hoekgrens stopt de motor bij een gemeten werkhoek boven `max_hoek`; de PWM-stapgrens beperkt uitsluitend de stijging van de uitgang. Geen van beide neemt de bewegingsenergie van de arm direct weg.

#pagebreak(weak: true)

#heading(level: 1, numbering: none)[Appendix: Afleiding bewegingsvergelijking]

== Bewegingsvergelijking van het aeropendulum (open loop)
We beschouwen een aeropendulum bestaande uit een roterende arm met een propeller. De propeller levert een stuwkracht waardoor de arm om zijn draaipunt roteert.

Volgens de tweede wet van Newton voor rotaties geldt:

#math.equation(block: true, numbering: "(1)", $sum tau = J dot.double(theta).$)

Hierin is $J$ het traagheidsmoment rond het draaipunt en $theta$ de hoek van de arm ten opzichte van de verticale evenwichtspositie.\
\
Op de arm werken drie koppels:

- Het motorkoppel door de stuwkracht van de propeller.
- Het zwaartekrachtsmoment.
- Het dempende koppel door wrijving.

Het motorkoppel schrijven we als $tau_T = l_T F_T$, waarbij $l_T$ de afstand tussen het draaipunt en de aangrijpingslijn van de stuwkracht is. Het zwaartekrachtsmoment is: $tau_g = -m g l sin(theta)$. Hierin is $l$ de afstand van het draaipunt tot het massamiddelpunt. We modelleren de wrijving als een krachtmoment dat evenredig is met de hoeksnelheid: $tau_w = -b dot(theta)$.

De bewegingsvergelijking wordt daarmee:

#math.equation(block: true, numbering: "(1)", $J dot.double(theta) = l_T F_T - b dot(theta) - m g l sin(theta)$)


Of, na herschikken:

#math.equation(block: true, numbering: "(1)", $J dot.double(theta) + b dot(theta) + m g l sin(theta)= l_T F_T$)


=== Relatie tussen PWM en stuwkracht

We nemen aan dat de stuwkracht direct en lineair#footnote[De stuwkracht is in werkelijkheid een niet-lineaire functie van de PWM-waarde. Voor kleine afwijkingen rond het evenwicht kan deze relatie echter worden benaderd als lineair.]. afhangt van de PWM-waarde $u$:

#math.equation(block: true, numbering: "(1)", $ F_T = k_u u $)

Hierin is $k_u$ een evenredigheidsconstante. We defineren nu $A = l_T k_u$, zodat het motorkoppel kan worden geschreven als $tau_T = A u$.
Daarmee wordt de bewegingsvergelijking:

#math.equation(block: true, numbering: "(1)", eqbox[$J dot.double(theta) + b dot(theta) + m g l sin(theta) = A u$])

Dit is een niet-lineaire differentiaalvergelijking van de tweede orde. In deze afleiding zijn hoeken in radialen; de notebook gebruikt graden. Numerieke regelversterkingen kun je daarom alleen vergelijken na omzetting naar dezelfde hoekeenheid.

== De P-regelaar

We willen de pendulum stabiliseren rond een gewenste hoek $theta_r$. De fout tussen de gewenste en de gemeten hoek is:

#math.equation(block: true, numbering: "(1)", $ e(t) = theta_r - theta(t) $)

Een proportionele regelaar past de PWM-waarde aan op basis van deze fout:

#math.equation(block: true, numbering: "(1)", $ u(t) = u_0 + K_p e(t) $)

In deze afleiding nemen we een extra evenwichtsaansturing $u_0$ aan. De gebruikte sketch heeft geen afzonderlijke instelling voor deze basisuitgang: bij P-regeling ontstaat de benodigde uitgang door een blijvende fout, en bij PID kan de I-term deze leveren.

Hierin zijn:

- $u_0$: de PWM-waarde die nodig is om de gewenste hoek vast te houden.
- $K_p$: de proportionele versterking.

We nemen aan dat de gewenste hoek constant is.

Bij de gewenste hoek $theta_0 = theta_r$ is de pendulum in evenwicht. De hoeksnelheid en hoekversnelling zijn dan nul:

#math.equation(block: true, numbering: "(1)", $ dot(theta) = 0, quad dot.double(theta) = 0 $)

Uit de bewegingsvergelijking volgt:

#math.equation(block: true, numbering: "(1)", $ m g l sin(theta_0) = A u_0 $)

De PWM-waarde die nodig is om dit evenwicht te handhaven is dus:

#math.equation(block: true, numbering: "(1)", $ u_0 = (m g l sin(theta_0))/A $)

We combineren deze evenwichtsaansturing met de P-regelaar:

#math.equation(block: true, numbering: "(1)", $ u(t) = u_0 + K_p (theta_r - theta(t)) $)

== Kleine afwijkingen rond het evenwicht

We onderzoeken wat er gebeurt als de pendulum een kleine afwijking heeft ten opzichte van de gewenste hoek.

Schrijf de werkelijke hoek als:

#math.equation(block: true, numbering: "(1)", $ theta(t) = theta_0 + epsilon(t) $)

Hierin is $epsilon(t)$ de kleine afwijking van de evenwichtshoek.

Omdat $theta_r = theta_0$, geldt:

#math.equation(block: true, numbering: "(1)", $ e(t) = -epsilon(t) $)

De regelaar wordt daarmee:

#math.equation(block: true, numbering: "(1)", $ u(t) = u_0 - K_p epsilon(t) $)

Vul dit in bij de bewegingsvergelijking:

#math.equation(
  block: true,
  numbering: "(1)",
  $ J dot.double(theta) + b dot(theta) + m g l sin(theta) = A (u_0 - K_p epsilon) $,
)

Omdat $theta = theta_0 + epsilon$ en $theta_0$ constant is, geldt:

#math.equation(
  block: true,
  numbering: "(1)",
  $
           dot(theta) & = dot(epsilon) \
    dot.double(theta) & = dot.double(epsilon)
  $,
)
We krijgen:

#math.equation(
  block: true,
  numbering: "(1)",
  $ J dot.double(epsilon) + b dot(epsilon) + m g l sin(theta_0 + epsilon) = A u_0 - A K_p epsilon $,
)

=== Linearisatie

Voor kleine afwijkingen $epsilon$ kunnen we de sinusfunctie benaderen met een Taylorontwikkeling:

$ sin(theta_0 + epsilon) approx sin(theta_0) + epsilon cos(theta_0) $

Invullen geeft:

$
  J dot.double(epsilon) + b dot(epsilon)
  + m g l sin(theta_0)
  + m g l cos(theta_0) epsilon
  = A u_0 - A K_p epsilon
$

We weten dat in het evenwicht geldt:

$ m g l sin(theta_0) = A u_0 $

Deze constante termen vallen dus tegen elkaar weg.

Daarmee vinden we:

#math.equation(
  block: true,
  numbering: "(1)",
  $ J dot.double(epsilon) + b dot(epsilon) + m g l cos(theta_0) epsilon = -A K_p epsilon $,
)

Breng alle termen naar de linkerkant:

#math.equation(
  block: true,
  numbering: "(1)",
  eqbox[
    $
      J dot.double(epsilon) + b dot(epsilon)
      + (m g l cos(theta_0) + A K_p) epsilon = 0
    $
  ],
)

Dit is de gelineariseerde bewegingsvergelijking van de P-geregelde aeropendulum.


== Eigenfrequenties van aeropendulum
Om het frequentiegedrag van het systeem te analyseren, herschrijven we de bewegingsvergelijking in de standaardvorm van een gedempte harmonische oscillator:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    J dot.double(epsilon) + b dot(epsilon)
    + (m g l cos(theta_0) + A K_p) epsilon = 0
  $,
)
We noteren $k_"eff" = m g l cos(theta_0) + A K_p$ als de effectieve stijfheid van het systeem en delen we door $J$. De bewegingsvergelijking wordt dan:

$ dot.double(x) + b/J dot(x) + k_"eff"/J x = 0. $

Dit lijkt al bijna op de standaardvorm van een gedempte harmonische oscillator. We vergelijken dit met de algemene vorm:

$ dot.double(x) + 2 zeta omega_0 dot(x) + omega_0^2 x = 0 $


#intermezzo[De harmonische oscillator en stabiliteit][
  Een gedempte harmonische oscillator beschrijft een systeem waarin een herstellende kracht en een dempende kracht werkzaam zijn. Een bekend voorbeeld is een massa aan een veer.

  De bewegingsvergelijking luidt:

  $ m dot.double(x) + b dot(x) + k x = 0 $

  Hierin is $m$ de massa, $b$ de dempingscoëfficiënt en $k$ de veerconstante.

  De herstellende kracht $F = -k x$ werkt de uitwijking tegen, terwijl de dempende kracht $F = -b dot(x)$ de beweging tegenwerkt.

  == Eigenfrequentie en demping

  De ongedempte eigenhoekfrequentie wordt gegeven door:

  $ omega_0 = sqrt(k/m) $

  De dimensieloze dempingsratio is:

  $ zeta = b / (2 sqrt(m k)) $

  Voor $m > 0$ en $k > 0$ onderscheiden we drie situaties:

  - *Ondergedempt* ($0 < zeta < 1$): het systeem oscilleert rond de evenwichtspositie, waarbij de amplitude geleidelijk afneemt.
  - *Kritisch gedempt* ($zeta = 1$): het systeem keert zonder oscillaties zo snel mogelijk terug naar de evenwichtspositie.
  - *Overgedempt* ($zeta > 1$): het systeem keert zonder oscillaties terug naar de evenwichtspositie, maar langzamer dan bij kritische demping.

  == Stabiliteit

  Voor het ondergedempte geval is de oplossing:

  $ x(t) = X_0 e^(-b/(2m) t) cos(omega_d t + phi) $

  met de gedempte eigenhoekfrequentie:

  $ omega_d = sqrt(k/m - b^2/(4m^2)) $

  De exponentiële factor bepaalt hoe de amplitude zich ontwikkelt:

  $ X(t) = X_0 e^(-b/(2m) t) $

  Hieruit volgt:

  - Bij $b > 0$ neemt de amplitude af: de oscillaties doven uit.
  - Bij $b = 0$ blijft de amplitude constant: het systeem oscilleert zonder energieverlies.
  - Bij $b < 0$ neemt de amplitude toe: het systeem is instabiel.

  Deze uitspraken over de amplitude gelden voor oscillerende oplossingen. Voor $k > 0$ is het evenwicht bij $b > 0$ asymptotisch stabiel, ook wanneer het systeem niet oscilleert.

]

De frequentie van het P-geregelde aeropendulum wordt bepaald door de effectieve stijfheid $k_"eff"$ en het traagheidsmoment $J$:

$ eqbox(omega_0^2 = (m g l cos(theta_0) + A K_p)/J) $

De relatieve demping hangt af van $b$, $J$ en de effectieve stijfheid:

$ eqbox(zeta = b/(2 sqrt(J (m g l cos(theta_0) + A K_p))).) $

=== Invloed van de proportionele versterking

Als we $K_p$ verhogen, neemt de effectieve stijfheid dus toe.

Hierdoor:

- Neemt de eigenfrequentie $omega_0$ toe.
- Neemt de relatieve demping $zeta$ af.
- Worden de oscillaties sneller.
- Kan de overshoot bij een verandering van het setpoint toenemen.

Een kleinere dempingsratio betekent echter niet automatisch dat het systeem instabiel wordt. Hoe kan het dan dat een te grote proportionele versterking in de praktijk toch instabiliteit kan veroorzaken?



=== Invloed van een vertraagde kracht

Tot nu toe hebben we aangenomen dat de stuwkracht van de motor onmiddellijk verandert wanneer de proportionele regelaar de PWM-waarde aanpast. In werkelijkheid heeft de motor echter een eindige reactietijd. Wanneer de regelaar de PWM-waarde verhoogt, duurt het enige tijd voordat de motor versnelt en de stuwkracht toeneemt.

Dit betekent dat de motor nog een relatief grote kracht kan leveren op het moment dat de pendulum de gewenste hoek al heeft bereikt. De regelaar probeert de motor dan af te remmen, maar de stuwkracht reageert vertraagd. Hierdoor kan de pendulum doorschieten.

Om dit effect te beschrijven, introduceren we een tijdconstante $tau_m$ voor de motor. We nemen aan dat de werkelijke stuwkracht $F_T$ de gewenste stuwkracht $F_"gewenst"$ volgt volgens:

#math.equation(block: true, numbering: "(1)", $ tau_m dot(F_T) + F_T = F_"gewenst" $)

Dit is een eersteorde-differentiaalvergelijking. De tijdconstante $tau_m$ bepaalt hoe snel de motor reageert. Na één tijdconstante heeft de stuwkracht ongeveer 63% van een opgelegde stapverandering bereikt.

Bij een P-regelaar is de gewenste stuwkracht afhankelijk van de afwijking $epsilon$ ten opzichte van de evenwichtshoek:

#math.equation(block: true, numbering: "(1)", $ F_"gewenst" = F_0 - k_u K_p epsilon $)

Hierin is $F_0$ de stuwkracht die nodig is om de pendulum in evenwicht te houden.

We schrijven de werkelijke stuwkracht als:

$ F_T = F_0 + f $

waarbij $f$ de afwijking van de evenwichtsstuwkracht is.

Invullen in het motormodel geeft:

#math.equation(block: true, numbering: "(1)", $ tau_m dot(f) + f = -k_u K_p epsilon $)

Vermenigvuldig met de motorarm $l_T$ en gebruik $A = l_T k_u$. We definiëren bovendien het afwijkende motorkoppel $q = l_T f$.

Daarmee wordt:

#math.equation(block: true, numbering: "(1)", $ tau_m dot(q) + q = -A K_p epsilon $)

=== De nieuwe bewegingsvergelijking

De bewegingsvergelijking van de gelineariseerde pendulum is:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    J dot.double(epsilon) + b dot(epsilon)
    + m g l cos(theta_0) epsilon = q
  $,
)

Voor het gemak definiëren we:

$ B = m g l cos(theta_0) $

We hebben nu twee gekoppelde differentiaalvergelijkingen die samen de beweging van de pendulum en de respons van de motor beschrijven:

#math.equation(block: true, numbering: "(1)", $ J dot.double(epsilon) + b dot(epsilon) + B epsilon = q $)

#math.equation(block: true, numbering: "(1)", $ tau_m dot(q) + q = -A K_p epsilon $)

Om deze vergelijkingen samen te voegen, gebruiken we eliminatie door substitutie. Uit de eerste vergelijking drukken we het motorkoppel $q$ uit in termen van de hoek $epsilon$ en haar afgeleiden. Door deze uitdrukking naar de tijd te differentiëren, vinden we ook een uitdrukking voor $dot(q)$. \
\

Vervolgens substitueren we beide uitdrukkingen in de tweede vergelijking. Hiermee elimineren we de variabele $q$ en verkrijgen we één differentiaalvergelijking voor de hoekafwijking $epsilon$:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    eqbox(
      tau_m J dot.triple(epsilon)
      + (J + tau_m b) dot.double(epsilon)
      + (b + tau_m B) dot(epsilon)
      + (B + A K_p) epsilon = 0
    )
  $,
)

De resulterende vergelijking is van de derde orde, terwijl de oorspronkelijke bewegingsvergelijking van de pendulum van de tweede orde was. De extra orde ontstaat doordat de motor een eigen dynamische toestand heeft: de stuwkracht kan niet onmiddellijk veranderen, maar ontwikkelt zich in de tijd.

=== Wanneer ontstaat instabiliteit?

Om de stabiliteit te onderzoeken, gebruiken we het Routh-Hurwitz-criterium. Deze wiskundige methode bepaalt of een lineair systeem stabiel is aan de hand van de coëfficiënten van zijn karakteristieke vergelijking. We hoeven hiervoor de differentiaalvergelijking niet volledig op te lossen.

We zoeken oplossingen van de vorm:

#math.equation(block: true, numbering: "(1)", $ epsilon(t) = C e^(lambda t) $)

Hierin bepaalt de exponent $lambda$ het gedrag van de beweging. In het algemeen kan $lambda$ complex zijn:

- Als alle oplossingen voor $lambda$ een negatief reëel deel hebben, doven verstoringen uit en is het systeem asymptotisch stabiel.
- Als minstens één oplossing een positief reëel deel heeft, groeit een verstoring en is het systeem instabiel.
- Als een oplossing een reëel deel gelijk aan nul heeft, bevindt het systeem zich mogelijk op een stabiliteitsgrens.

Door de exponentiële oplossing in de bewegingsvergelijking te substitueren en de gemeenschappelijke factor $C e^(lambda t)$ weg te delen, vinden we de karakteristieke vergelijking:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    tau_m J lambda^3
    + (J + tau_m b) lambda^2
    + (b + tau_m B) lambda
    + (B + A K_p) = 0
  $,
)


#intermezzo[Het Routh-Hurwitz-criterium][

  Het Routh-Hurwitz-criterium is een wiskundige methode waarmee we de stabiliteit van een lineair dynamisch systeem kunnen bepalen, zonder de bijbehorende differentiaalvergelijking expliciet op te lossen.

  We beschouwen een differentiaalvergelijking van de derde orde:

  #math.equation(
    block: true,
    numbering: "(1)",
    $
      a_3 dot.triple(x) + a_2 dot.double(x)
      + a_1 dot(x) + a_0 x = 0
    $,
  )

  We zoeken oplossingen van de vorm $x(t) = C e^(lambda t)$. Substitutie levert de karakteristieke vergelijking:

  #math.equation(
    block: true,
    numbering: "(1)",
    $
      a_3 lambda^3 + a_2 lambda^2
      + a_1 lambda + a_0 = 0
    $,
  )

  De oplossingen voor $lambda$ bepalen het gedrag van het systeem. Een systeem is asymptotisch stabiel wanneer alle oplossingen een negatief reëel deel hebben. In dat geval doven kleine verstoringen uiteindelijk uit.

  Het Routh-Hurwitz-criterium stelt dat voor een derdeorde-systeem met $a_3 > 0$ aan de volgende voorwaarden moet worden voldaan:

  #math.equation(block: true, numbering: "(1)", $ a_2 > 0, quad a_1 > 0, quad a_0 > 0 $)

  Daarnaast geldt de aanvullende voorwaarde:

  #math.equation(block: true, numbering: "(1)", $ eqbox(a_2 a_1 > a_3 a_0) $)

  Wanneer aan al deze voorwaarden wordt voldaan, liggen alle wortels van de karakteristieke vergelijking in het linkerhalfvlak van het complexe vlak. Het systeem is dan asymptotisch stabiel.\
  \
  *Conclusie:* we kunnen de stabiliteit rechtstreeks uit de coëfficiënten bepalen, zonder de drie wortels van de karakteristieke vergelijking te berekenen.

]


=== Toepassing op de aeropendulum

Voor onze bewegingsvergelijking identificeren we de coëfficiënten:

$
  a_3 = tau_m J, quad
  a_2 = J + tau_m b
$

$
  a_1 = b + tau_m B, quad
  a_0 = B + A K_p
$

We nemen $J$, $b$, $A$ en $tau_m$ positief en $K_p >= 0$. Voor evenwichtshoeken onder 90 graden is $B > 0$ en zijn alle coëfficiënten positief. Bij 90 graden is $B = 0$; dan is bovendien $K_p > 0$ nodig.

De stabiliteit wordt dus volledig bepaald door de aanvullende voorwaarde van het Routh-Hurwitz-criterium:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    eqbox(
      (J + tau_m b)(b + tau_m B)
      > tau_m J (B + A K_p)
    )
  $,
)

Deze ongelijkheid laat zien dat een grotere proportionele versterking $K_p$ de stabiliteit kan verminderen. De rechterkant neemt immers toe met $K_p$, terwijl de linkerkant constant blijft.

Er bestaat daarom een kritische versterking waarbij de ongelijkheid overgaat in een gelijkheid. Dit is de grens tussen asymptotische stabiliteit en instabiliteit.


=== Kritische proportionele versterking

De stabiliteitsvoorwaarde laat zien dat een grotere proportionele versterking $K_p$ uiteindelijk tot instabiliteit kan leiden. De grens tussen stabiliteit en instabiliteit vinden we door de ongelijkheid te vervangen door een gelijkheid:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    (J + tau_m b)(b + tau_m B)
    = tau_m J (B + A K_(p,"krit"))
  $,
)

Hierin is $K_(p,"krit")$ de kritische proportionele versterking: de waarde waarbij het systeem zich precies op de stabiliteitsgrens bevindt.

Door de vergelijking op te lossen naar $K_(p,"krit")$ vinden we:

#math.equation(
  block: true,
  numbering: "(1)",
  $
    K_(p,"krit") =
    1/A (
      ((J + tau_m b)(b + tau_m B))/(tau_m J)
      - B
    )
  $,
)

Na vereenvoudiging volgt:


#math.equation(
  block: true,
  numbering: "(1)",
  $
    eqbox(
      K_(p,"krit") = b/A
      (1/tau_m + b/J + (tau_m B)/J)
    )
  $,
) <eq:kritische-versterking>


Onder de bovenstaande voorwaarden onderscheiden we drie situaties:

- *$K_p < K_(p,"krit")$*: het systeem is asymptotisch stabiel. Kleine verstoringen doven uiteindelijk uit.
- *$K_p = K_(p,"krit")$*: het systeem bevindt zich op de stabiliteitsgrens. Er kunnen oscillaties met constante amplitude optreden.
- *$K_p > K_(p,"krit")$*: het systeem is instabiel. Kleine verstoringen kunnen in de tijd groeien.

=== Fysische interpretatie

De kritische versterking hangt af van zowel de mechanische eigenschappen van de pendulum als de responstijd van de motor. Zonder gemeten modelparameters kun je @eq:kritische-versterking niet betrouwbaar numeriek invullen. De belangrijkste conclusie is: als de motor te traag reageert, kan een te grote proportionele versterking leiden tot instabiliteit. De motor kan dan op het verkeerde moment energie aan de beweging toevoegen, waardoor de oscillaties toenemen in plaats van afnemen.

#pagebreak(weak: true)


== PID-regeling en integral windup

*Integral windup* ontstaat wanneer de integrator fout blijft optellen terwijl de actuator de gevraagde aansturing niet kan uitvoeren. De opgebouwde I-bijdrage kan dan groter worden dan nodig is. Ook als de fout later klein of nul wordt, is die bijdrage niet direct verdwenen. Dit kan de terugkeer naar het setpoint vertragen en overshoot veroorzaken.

We leiden dit hieronder af met Laplace. Eerst beschrijven we de lineaire integrator; daarna voegen we de uitgangsbegrenzing toe. Voor de regels van de Laplacetransformatie, zie Brightspace.

=== De integrator onthoudt de fout

De regelfout is $e(t) = r(t) - theta(t)$. We schrijven de I-bijdrage direct in PWM-telwaarden als $i(t)$:

#math.equation(block: true, numbering: "(1)", $ i(t) = i_0 + K_i integral_0^t e(tau) dif tau, quad dot(i)(t) = K_i e(t). $)

Hierin is $i_0 = i(0)$ de al aanwezige I-bijdrage. Een positieve fout laat $i$ toenemen, een negatieve fout laat $i$ afnemen. Bij nul fout blijft $i$ gelijk: de integrator wordt niet vanzelf gereset.

Noem de Laplacetransformaties van $e(t)$ en $i(t)$ respectievelijk $E(s)$ en $I(s)$. De transformatieregel voor een afgeleide geeft:

#math.equation(block: true, numbering: "(1)", $ s I(s) - i_0 = K_i E(s). $)

Dus:

#math.equation(block: true, numbering: "(1)", $ eqbox(I(s) = K_i/s E(s) + i_0/s). $)

De factor $K_i/s$ is de overdrachtsfunctie van de integrator bij nulbeginvoorwaarde. De term $i_0/s$ beschrijft het geheugen waarmee een nieuw tijdsinterval begint. Juist die beginvoorwaarde is belangrijk wanneer we na een periode van begrenzing verder rekenen.

=== Van een constante fout naar een groeiende I-bijdrage

Neem gedurende een interval een constante positieve fout $e(t)=e_0$ aan. Dan is $E(s)=e_0/s$. Invullen levert:

#math.equation(block: true, numbering: "(1)", $ I(s) = (K_i e_0)/s^2 + i_0/s. $)

Met de transformatieparen $1/s arrow.l.r 1$ en $1/s^2 arrow.l.r t$ vinden we:

#math.equation(block: true, numbering: "(1)", $ eqbox(i(t) = i_0 + K_i e_0 t). $)

Een constante fout veroorzaakt dus een *lineair groeiende* I-bijdrage. De groeisnelheid is $K_i e_0$, in PWM-telwaarden per seconde. In de notebook gebruiken we graden; $K_i$ heeft daar de eenheid PWM-telwaarden per graad per seconde.

Dit is op zichzelf gewenst gedrag: de I-term bouwt de aansturing op die nodig is om een blijvende fout weg te werken. Het wordt windup wanneer die opbouw doorgaat terwijl de actuator de gevraagde correctie niet kan volgen en de bijdrage daardoor te groot wordt.

#pagebreak(weak: true)

=== Waarom nul fout de integrator niet leegt

Neem eerst een fout die alleen tussen $t=0$ en $t=T$ gelijk is aan $e_0$ en daarna nul wordt. Dit is het verschil van twee stappen. Bij $i_0=0$ geldt:

#math.equation(block: true, numbering: "(1)", $ E(s) = e_0/s (1 - e^(-T s)), quad I(s) = (K_i e_0)/s^2 (1 - e^(-T s)). $)

De inverse Laplacetransformatie is het verschil van twee hellingen:

#math.equation(block: true, numbering: "(1)", $ i(t) = K_i e_0 (t - (t-T) H(t-T)). $)

Hierin is $H(t-T)$ nul voor $t<T$ en een voor $t>T$. Voor $t >= T$ volgt dus:

#math.equation(block: true, numbering: "(1)", $ eqbox(i(t) = K_i e_0 T). $)

De fout is verdwenen, maar de *oppervlakte onder de eerdere foutcurve blijft opgeslagen*. Alleen een negatieve fout of een extra ingreep in de integrator kan deze bijdrage weer verlagen. Een niet-nul I-bijdrage is overigens normaal: er is motorvermogen nodig om de arm op hoogte te houden. Het probleem is een bijdrage die groter is dan daarvoor nodig is.

=== Windup bij een maximale PWM

Maak onderscheid tussen de *gevraagde* uitgang $v(t)$ en de *toegepaste* PWM $u(t)$. Voor D op de gemeten hoek, zoals in de sketch, schrijven we:

#math.equation(block: true, numbering: "(1)", $ v(t) = K_p e(t) + i(t) - K_d dot(theta)(t). $)

Een uitgangsbegrenzing geeft:

#math.equation(block: true, numbering: "(1)", $ u(t) = min(u_"max", max(0, v(t))). $)

Zolang $v > u_"max"$ is de toegepaste uitgang constant: $u=u_"max"$. Als de fout positief blijft, groeit de ideale integrator toch door. De regelaar vraagt dan steeds meer PWM, zonder dat de motor meer krijgt. Dit noemen we *verzadiging met integral windup*.

Om dit afzonderlijk te bekijken, nemen we tijdens zo'n interval een constante fout en constante overige regelbijdragen $C$ aan. Kies het begin van dit interval als $t=0$. Dan geldt:

#math.equation(block: true, numbering: "(1)", $ V(s) = (C+i_0)/s + (K_i e_0)/s^2, quad U(s) = u_"max"/s. $)

Voor het verschil $w(t)=v(t)-u(t)$ vinden we:

#math.equation(block: true, numbering: "(1)", $ W(s) = (C+i_0-u_"max")/s + (K_i e_0)/s^2. $)

Dus $w(t)=C+i_0-u_"max"+K_i e_0 t$: de niet-uitgevoerde aansturing groeit zolang deze aannames gelden. Een grotere I-bijdrage helpt de actuator tijdens verzadiging niet, maar moet later wel weer worden afgebouwd.

*Grens van de Laplace-aanpak.* Verzadiging is niet-lineair en heeft geen vaste overdrachtsfunctie $U(s)/V(s)$. We gebruiken Laplace hier voor de integrator en voor een afzonderlijk interval waarvan het begrenzingsgedrag bekend is. We beschrijven daarmee niet de volledige begrensde regelkring als een lineair systeem.

#pagebreak(weak: true)

=== Rekenvoorbeeld: opbouwen, vasthouden en afbouwen

Neem $K_i=2$, $i_0=0$ en gedurende vier seconden een fout van 10 graden. De I-bijdrage groeit dan met 20 PWM-telwaarden per seconde tot $i(4)=80$. Als de fout vervolgens nul wordt, blijft deze bijdrage 80.

Stel ter illustratie de overige bijdrage constant op $C=40$ en de maximale uitgang op $u_"max"=60$. De gevraagde uitgang is dan $40+80=120$, terwijl slechts 60 wordt toegepast. Deze getallen zijn een rekenvoorbeeld, geen aanbevolen proefinstellingen.

Vanaf $t=6$ nemen we een fout van -5 graden aan. Met $q=t-6$ als nieuwe tijd en de opgeslagen beginwaarde $i(6)=80$ geeft Laplace:

#math.equation(block: true, numbering: "(1)", $ I_"nieuw"(s) = 80/s - 10/s^2 quad arrow.r quad i(6+q)=80-10q. $)

De uitgang komt pas uit verzadiging wanneer $40+i < 60$, dus nadat de I-bijdrage tot onder 20 is afgenomen. Dat duurt hier zes seconden na het negatief worden van de fout. De fout vraagt al om minder aansturing, maar de eerder opgebouwde bijdrage houdt de uitgang nog op het maximum.

#figure(
  image("Figuren/integral_windup.png", width: 100%),
  caption: [Voorgeschreven foutverloop met een ideale, onbegrensde integrator en begrensde uitgang. De I-bijdrage groeit bij positieve fout, blijft staan bij nul fout en neemt pas af bij negatieve fout. De toegepaste PWM blijft tot t = 12 s op het maximum. Dit is een illustratie van het mechanisme, geen simulatie of meting van het aeropendulum; C is hier bewust constant gehouden.],
) <aero_pendulum_pid--fig:windup>

#pagebreak(weak: true)

=== Windup bij een beperkte PWM-stijgsnelheid

In opdracht 4 beperk je niet alleen de maximale uitgang, maar ook de stijging per regelstap. Noem de op het PWM-bereik begrensde vraag $v_("begr",k)$. Bij een ingeschakelde stapbegrenzer geldt, afgezien van afronding:

#math.equation(block: true, numbering: "(1)", $ u_k = min(v_("begr",k), u_(k-1)+Delta u_"max"), quad R_u = (Delta u_"max")/(Delta t). $)

Dalingen worden direct uitgevoerd. `max_pwm_stap=0` schakelt deze begrenzer uit; het betekent niet dat de uitgang constant wordt gehouden.

Tijdens een interval waarin de uitgang met de maximaal toegestane snelheid stijgt, benaderen we de trapvormige PWM door $u(t)=u_a+R_u t$. Neem opnieuw een constante fout $e_0$ en constante overige bijdrage $C$ aan, voordat de interne grenzen zijn bereikt. In het Laplacedomein is dan:

#math.equation(block: true, numbering: "(1)", $ V(s) = (C+i_0)/s + (K_i e_0)/s^2, quad U(s)=u_a/s+R_u/s^2. $)

Aftrekken en terugtransformeren geeft:

#math.equation(block: true, numbering: "(1)", $ eqbox(v(t)-u(t)=C+i_0-u_a+(K_i e_0-R_u)t). $)

Als $K_i e_0>R_u$, groeit in dit interval het verschil tussen gevraagde en toegepaste aansturing. De integrator bouwt sneller op dan de uitgang kan volgen. Deze ongelijkheid illustreert het windupmechanisme onder de genoemde aannames; het is geen algemene stabiliteitsgrens voor het aeropendulum.

Bij `max_pwm_stap=1` en `delta_t=0.02` s is $R_u=50$ PWM-telwaarden per seconde. Als bijvoorbeeld $K_i=3$ en $e_0=20$ graden, groeit de I-bijdrage met 60 telwaarden per seconde. Bij constante P- en D-bijdragen loopt de vraag dan 10 telwaarden per seconde verder voor op de uitgang. In de echte proef veranderen de fout en de andere bijdragen, en worden uiteindelijk grenzen bereikt.

=== Wat doet de gebruikte Arduino-code?

De sketch gebruikt `PID_v1`. Deze bibliotheek begrenst zowel de I-bijdrage als de PID-uitgang op het ingestelde uitgangsbereik. De integrator in de echte proef groeit dus niet onbeperkt door zoals in het ideale rekenvoorbeeld.

De extra PWM-stapbegrenzer wordt echter *na* de PID-berekening toegepast. De werkelijk toegepaste PWM wordt niet gebruikt om de integrator voor deze extra begrenzing te corrigeren. De I-bijdrage kan daardoor toch te groot worden voor de actuele toestand, ook al blijft zij binnen de interne grens. Zie de #link("https://github.com/br3ttb/Arduino-PID-Library/blob/master/PID_v1.cpp")[implementatie van PID_v1].

Overshoot alleen bewijst geen windup: ook P, D en motorvertraging kunnen overshoot veroorzaken. De notebook slaat de toegepaste PWM op, maar niet de interne I-bijdrage of de onbeperkte vraag. Gebruik een vergelijking van proeven met en zonder I en met verschillende stapgrenzen om het mechanisme te onderzoeken; een directe controle van de integrator vraagt extra logging in de firmware.

#pagebreak(weak: true)

=== Waarom een lineair stabiele PID toch windup kan vertonen

Voor kleine afwijkingen rond een evenwicht en zonder motorvertraging is de overdrachtsfunctie van het aeropendulum:

#math.equation(block: true, numbering: "(1)", $ G_p(s)=A/(J s^2+b s+B), quad B=m g l cos(theta_0). $)

Hierin geldt $A=l_T k_u$. We gebruiken afwijkingen ten opzichte van het evenwicht en nulbeginvoorwaarden. Voor een ideaal PID-model met D op de fout is:

#math.equation(block: true, numbering: "(1)", $ G_c(s)=K_p+K_i/s+K_d s. $)

Zonder begrenzing is de toegepaste uitgang gelijk aan de gevraagde uitgang. De gesloten overdrachtsfunctie van setpointafwijking naar hoekafwijking wordt dan:

#math.equation(block: true, numbering: "(1)", $ T(s)=(G_c(s)G_p(s))/(1+G_c(s)G_p(s)) = (A(K_d s^2+K_p s+K_i))/(J s^3+(b+A K_d)s^2+(B+A K_p)s+A K_i). $)

De Arduino gebruikt D op de gemeten hoek. Daarvoor wordt de teller $A(K_p s+K_i)$; de noemer blijft gelijk in dit vereenvoudigde model. Voor $K_i>0$ en positieve noemercoefficienten geeft Routh-Hurwitz de stabiliteitsvoorwaarde:

#math.equation(block: true, numbering: "(1)", $ (b+A K_d)(B+A K_p)>J A K_i. $)

Deze voorwaarde gaat over het *onbegrensde lineaire model*. Zodra de toegepaste uitgang afwijkt van de gevraagde uitgang, beschrijft deze overdrachtsfunctie de proef niet meer volledig. Een lineair stabiele regelaar kan daarom bij begrenzing toch windup en traag herstel vertonen. Andersom is niet iedere oscillatie het gevolg van windup. Bij $K_i=0$ is er geen integrerende actie en valt de gemeenschappelijke factor $s$ uit de overdrachtsfunctie weg.

=== Anti-windup: de integrator laten volgen wat werkelijk gebeurt

Een mogelijke verbetering is *back-calculation*: gebruik het verschil tussen toegepaste en gevraagde uitgang om de integrator bij te sturen. In een continu model:

#math.equation(block: true, numbering: "(1)", $ dot(i)=K_i e+K_b(u-v), quad K_b>0. $)

Zonder begrenzing is $u=v$ en verdwijnt de extra term. Als de regelaar meer vraagt dan wordt toegepast, is $u-v<0$: de extra term remt de opbouw af of bouwt de integrator af. $K_b$ heeft de eenheid per seconde.

Dit zie je ook met Laplace. Schrijf $v=c+i$, met $c$ de som van de overige bijdragen en $C(s)$ de transformatie daarvan. Dan volgt:

#math.equation(block: true, numbering: "(1)", $ s I(s)-i_0=K_i E(s)+K_b(U(s)-C(s)-I(s)). $)

Dus:

#math.equation(block: true, numbering: "(1)", $ eqbox(I(s)=(K_i E(s)+K_b(U(s)-C(s))+i_0)/(s+K_b)). $)

Bij een vastgehouden uitgang en constante overige bijdrage krijgt deze integratordynamica een hersteltijd $1/K_b$. Dit is geen overdrachtsfunctie van de volledige niet-lineaire regelkring. De extra terugkoppeling reageert juist op het verschil dat door de begrenzing ontstaat. Deze anti-windupmethode is niet in de huidige sketch ingebouwd; implementatie en afstelling vallen buiten de reguliere opdrachten. Zie ook de #link("https://www.mathworks.com/help/simulink/slref/anti-windup-control-using-a-pid-controller.html")[uitleg over anti-windup en back-calculation].
