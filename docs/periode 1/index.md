# Periode 1

In periode 1 staan **Python, experimentele vaardigheden, optica en spectroscopie** centraal. In de eerste twee weken worden de benodigde programmeeromgeving en het digitaal labjournaal geïntroduceerd. Daarna werk je gedurende twee weken aan het bouwen en gebruiken van een spectrometer.

## Rooster
<button class="rooster-open" onclick="document.getElementById('rooster-modal').showModal()">
  Bekijk rooster Periode 1
</button>

<dialog id="rooster-modal" class="rooster-modal">
  <div class="rooster-modal-header">
    <h2>Rooster Periode 1</h2>

    <button
      class="rooster-close"
      onclick="document.getElementById('rooster-modal').close()"
      aria-label="Sluiten">
      ×
    </button>
  </div>

  <div class="rooster-modal-content">

    <table class="rooster">
      <thead>
        <tr>
          <th>Kalender-<br>week</th>
          <th>Periode-<br>week</th>
          <th>Ma<br>12:00–14:30</th>
          <th>Ma<br>14:30–17:00</th>
          <th>Vr<br>15:20–17:50</th>
          <th>Activiteit bijeenkomst 1</th>
          <th>Activiteit bijeenkomst 2</th>
          <th>Extra bijeenkomst</th>
        </tr>
      </thead>

      <tbody>
        <tr class="blok">
          <td colspan="8"><strong>Blok 1</strong></td>
        </tr>

        <tr>
          <td>36</td>
          <td>1</td>
          <td>31 aug</td>
          <td>31 aug</td>
          <td>4 sep</td>
          <td>Gr. 1 Python</td>
          <td>Gr. 2 Python</td>
          <td>—</td>
        </tr>

        <tr>
          <td>37</td>
          <td>2</td>
          <td>7 sep</td>
          <td>7 sep</td>
          <td>11 sep</td>
          <td>Gr. 1 Optica</td>
          <td>Gr. 2 Optica</td>
          <td>—</td>
        </tr>

        <tr>
          <td>38</td>
          <td>3</td>
          <td>14 sep</td>
          <td>14 sep</td>
          <td>18 sep</td>
          <td colspan="2">Groep 1: Bouwen spectrometer*</td>
          <td>—</td>
        </tr>

        <tr>
          <td>39</td>
          <td>4</td>
          <td>21 sep</td>
          <td>21 sep</td>
          <td>25 sep</td>
          <td colspan="2">Groep 1: Experimenteren spectrometer*</td>
          <td>—</td>
        </tr>

        <tr>
          <td>40</td>
          <td>5</td>
          <td>28 sep</td>
          <td>28 sep</td>
          <td>2 okt</td>
          <td colspan="2">Groep 2: Bouwen spectrometer*</td>
          <td>—</td>
        </tr>

        <tr>
          <td>41</td>
          <td>6</td>
          <td>5 okt</td>
          <td>5 okt</td>
          <td>9 okt</td>
          <td colspan="2">Groep 2: Experimenteren spectrometer*</td>
          <td>—</td>
        </tr>

        <tr class="vakantie">
          <td>42</td>
          <td>7</td>
          <td colspan="6"><strong>Herfstvakantie</strong></td>
        </tr>

        <tr>
          <td>43</td>
          <td>8</td>
          <td>19 okt</td>
          <td>19 okt</td>
          <td>23 okt</td>
          <td colspan="2">-</td>
          <td>—</td>
        </tr>

        <tr>
          <td>44</td>
          <td>9</td>
          <td>26 okt</td>
          <td>26 okt</td>
          <td>30 okt</td>
          <td colspan="2">-</td>
          <td>—</td>
        </tr>

        <tr class="tentamens">
          <td>45</td>
          <td>10</td>
          <td colspan="6"><strong>Tentamens</strong></td>
        </tr>
      </tbody>
    </table>

    <p class="rooster-footnote">
      * Studenten worden geacht alle bijeenkomsten bij te wonen.
    </p>

  </div>
</dialog>
## Week 1 — Python

In de eerste week richt je de programmeeromgeving in die je tijdens de practica gaat gebruiken. Je installeert **Miniforge** en **Visual Studio Code** en leert hoe je Python-code uitvoert vanuit zowel een Jupyter Notebook als een Python-script.

Aan het einde van deze week heb je een werkende Python-omgeving die je tijdens de rest van het studiejaar kunt gebruiken.

[Naar Python →](python.md)

---

## Week 2 — Lenzen en digitaal labjournaal

In het practicum **Lenzen** maak je kennis met de werkwijze tijdens de practica. Je onderzoekt experimenteel de lenzenformule en vergelijkt je metingen met de theoretische verwachting.

Daarnaast leer je werken met het **digitaal labjournaal**. Hierin leg je onder andere je meetplan, meetgegevens, analyse, figuren en conclusies vast.

[Naar het practicum Lenzen →](lenzen.md)

---

## Week 3 (of 5)— Spectrometer bouwen en kalibreren

In de derde week bouw je zelf een **transmissiespectrometer**. Met behulp van een spleet, optische componenten, een tralie en een camera wordt licht ruimtelijk gescheiden naar golflengte.

Vervolgens kalibreer je de spectrometer met bekende spectraallijnen, zodat posities op de detector kunnen worden omgerekend naar golflengtes.

[Naar Spectrometer – week 1 →](spectrometer.md#practicum-week-1)

---

## Week 4 (of 6)— Spectroscopie

In de vierde week gebruik je de zelfgebouwde spectrometer voor een kwantitatieve meting. Je onderzoekt de **absorptie en transmissie** van licht door een Cu(II)sulfaatoplossing en gebruikt een ijklijn om een onbekende concentratie te bepalen.

Hierbij combineer je de experimentele opstelling met data-analyse in Python.


[Naar Spectrometer – week 2 →](spectrometer.md#practicum-week-2)

---

<!-- ## Week 8 en 9 — Constante van Planck

In dit practicum staat de **constante van Planck** centraal. Groep 1 voert het practicum uit in week 8 en groep 2 in week 9.

[Naar het practicum Constante van Planck →](planck.md)

---

!!! voorbereiding "Voorbereiding"

    Bekijk vóór iedere practicumweek de bijbehorende pagina. Hier staat aangegeven welke voorbereiding je vóór aanvang van het practicum moet uitvoeren. -->