# Periode 2

In periode 2 staan **modelleren, meten, regelen en energieomzetting** centraal. In week 3 tot en met 6 werk je met de **aeropendulum**. Je onderzoekt eerst het gedrag van het systeem zonder terugkoppeling en gaat daarna aan de slag met een **PID-regelaar** om de hoek van de pendulum actief te regelen.

In week 7 en 8 staat het **zonnecelpracticum** centraal. Hier onderzoek je experimenteel de eigenschappen van een zonnecel en analyseer je de verkregen meetgegevens met Python.

## Rooster
<button class="rooster-open" onclick="document.getElementById('rooster-modal').showModal()">
  Bekijk rooster Periode 2
</button>

<dialog id="rooster-modal" class="rooster-modal" aria-labelledby="rooster-titel">
  <div class="rooster-modal-header">
    <h2 id="rooster-titel">Rooster Periode 2</h2>

    <button class="rooster-close" onclick="document.getElementById('rooster-modal').close()" aria-label="Sluiten">×</button>
  </div>

  <div class="rooster-modal-content">

    <table class="rooster">
      <thead>
        <tr><th>Kalender-<br>week</th><th>Periode-<br>week</th><th>Ma<br>12:00–14:30</th><th>Ma<br>14:30–17:00</th><th>Vr<br>15:20–17:50</th><th>Activiteit bijeenkomst 1</th><th>Activiteit bijeenkomst 2</th><th>Activiteit bijeenkomst 3</th></tr>
      </thead>

      <tbody>
        <tr class="blok"><td colspan="8"><strong>Blok 2</strong></td></tr>

        <tr><td>46</td><td>1</td><td>9 nov</td><td>9 nov</td><td>13 nov</td><td colspan="3">—</td></tr>

        <tr><td>47</td><td>2</td><td>16 nov</td><td>16 nov</td><td>20 nov</td><td colspan="3">—</td></tr>

        <tr><td>48</td><td>3</td><td>23 nov</td><td>23 nov</td><td>27 nov</td><td colspan="2">Aeropendulum (open-loop) · Groep 1</td><td>—</td></tr>

        <tr><td>49</td><td>4</td><td>30 nov</td><td>30 nov</td><td>4 dec</td><td colspan="2">Aeropendulum (open-loop) · Groep 2</td><td>—</td></tr>

        <tr><td>50</td><td>5</td><td>7 dec</td><td>7 dec</td><td>11 dec</td><td colspan="2">Aeropendulum (PID) · Groep 1</td><td>—</td></tr>

        <tr><td>51</td><td>6</td><td>14 dec</td><td>14 dec</td><td>18 dec</td><td colspan="2">Aeropendulum (PID) · Groep 2</td><td>—</td></tr>

        <tr class="vakantie"><td>52</td><td>—</td><td colspan="6"><strong>Kerstvakantie (22–28 dec)</strong></td></tr>

        <tr class="vakantie"><td>1</td><td>—</td><td colspan="6"><strong>Kerstvakantie (29 dec–4 jan)</strong></td></tr>

        <tr><td>2</td><td>7</td><td>4 jan</td><td>4 jan</td><td>8 jan</td><td colspan="2">Zonnecelpracticum · Groep 1</td><td>—</td></tr>

        <tr><td>3</td><td>8</td><td>11 jan</td><td>11 jan</td><td>15 jan</td><td colspan="2">Zonnecelpracticum · Groep 2</td><td>—</td></tr>

        <tr><td>4</td><td>9</td><td colspan="6"><strong>Herkansing op afspraak</strong></td></tr>

        <tr class="tentamens"><td>5</td><td>10</td><td colspan="6"><strong>Geen practicum / tentamens</strong></td></tr>
      </tbody>
    </table>

    <p class="rooster-footnote">
      Voor alle practica word je geacht de volledige practicumdag (12:00–17:00) aanwezig te zijn.
    </p>
  </div>
</dialog>

[Rooster openen als PDF](P2.pdf)

---

## Week 3 en 4 — Aeropendulum: open-loop

In deze weken maak je kennis met de **aeropendulum**: een pendulum waarvan de hoek wordt beïnvloed door de stuwkracht van een elektromotor met propeller.

Je onderzoekt het systeem eerst **open-loop**. Dit betekent dat de motor wordt aangestuurd zonder dat de gemeten hoek automatisch wordt teruggekoppeld naar de aansturing.

Je brengt experimenteel het gedrag van het systeem in kaart en vergelijkt de metingen met een theoretisch model. Daarbij werk je onder andere met de motoraansturing, de hoeksensor en het uitlezen en verwerken van meetgegevens.

De resultaten uit deze weken vormen de basis voor het regelen van de aeropendulum in week 5 en 6.

[Naar Aeropendulum – open-loop →](aeropendulum-openloop.md)

---

## Week 5 en 6 — Aeropendulum: PID-regeling

In week 5 en 6 wordt de gemeten hoek van de aeropendulum gebruikt om de motor automatisch aan te sturen. Het systeem wordt daarmee **closed-loop** geregeld.

Hiervoor maak je gebruik van een **PID-regelaar**. De regelaar vergelijkt continu de gewenste hoek met de gemeten hoek en past op basis van het verschil de motoraansturing aan.

Je onderzoekt de invloed van de verschillende onderdelen van de PID-regelaar en stelt de regelparameters zo in dat de aeropendulum de gewenste hoek zo goed mogelijk volgt.

Hierbij komen theorie, programmeren en experimenteren samen: je gebruikt de hoeksensor als terugkoppeling, implementeert de regelaar en analyseert het dynamische gedrag van het systeem.

[Naar Aeropendulum – PID-regeling →](aeropendulum-pid.md)

---

## Week 7 en 8 — Zonnecel

In week 7 en 8 onderzoek je de eigenschappen van een **zonnecel**. Een zonnecel zet invallende stralingsenergie om in elektrische energie.

Tijdens het practicum voer je metingen uit aan de zonnecel en onderzoek je hoe spanning, stroom en geleverd vermogen van elkaar afhangen.

De meetgegevens worden verwerkt en geanalyseerd met Python. Op basis daarvan bepaal je karakteristieke eigenschappen van de zonnecel en onderzoek je onder welke omstandigheden het elektrisch vermogen maximaal is.

[Naar het practicum Zonnecel →](zonnecel.md)

---

!!! voorbereiding "Voorbereiding"

    Bekijk vóór iedere practicumweek de bijbehorende pagina. Hier staat aangegeven welke voorbereiding je vóór aanvang van het practicum moet uitvoeren.
