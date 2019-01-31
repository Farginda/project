# Final Report - "GO FAST" - Farginda Muhammad (11320494)

## Description
<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-31%20om%2011.43.32.png" width="30%" height="30%"/>

De app _GO FAST_ laat gebruikers middels de timer hun aantal gevaste uren van hun _intermittent fasting_ bijhouden en vervolgens delen met andere gebruikers. Tijdens het vasten kunnen gebruikers ook alvast inspiratie opdoen van het voedsel die zij na het vasten kunnen nuttigen.

## Technical Design

<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-31%20om%2011.54.27.png" width="130%" height="130%"/>
<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-31%20om%2012.01.34.png" width="40%" height="40%"/>

Als de gebruiker de 'normale' weg binnen de app doorloopt, wordt het pad 1 t/m 5 bewandeld. Maakt de gebruiker ook gebruik van extra features, zoals de extra informatie over het onderwerp, of de _Food Inspo_ 👅 knop, dan ziet het pad er anders uit (zie screenshots hierboven).

### Classes
* Introduction Class
  * De Introduction Class is het beginscherm van de app waarmee de gebruiker kan beginnen door op de "GO!" knop te drukken.
* Hours Class
  * De Hours Class laat de gebruiker zijn/haar doel kiezen door gebruik te maken van een date(time)-picker, die vervolgens het aantal gekozen uren doorgeeft naar de volgende view.
* Timer Class
  * De Timer Class is wellicht de belangrijkste binnen de app, omdat de timer hier wordt weergegeven. Zodra de Timer View wordt getoond, begint de timer te lopen met het aantal gewenste uren. De timer blijft altijd doorlopen, ook wanneer de     andere features binnen de app worden gebruikt. De Timer Class bevat ook meerdere knoppen die een nieuwe view doorgeven.
* IF Info Class
  * Deze class geeft een aantal sites weer die meer informatie kunnen bieden over het onderwerp _Intermittent Fasting_. Deze sites kunnen geopend worden waarmee ze worden weergegeven in safari.
* Search API Class
  * De Search API Class bevat een searchbar waarmee de gebruiker namen van voedsel kan intypen, die vervolgens door de API request wordt opgehaald en getoond in de tableview.
* Food Detail Class
  * Deze Class toont de naam en een foto van de gekozen cell van de gebruiker.
* Finished Class
  * De Finished Class toont een 'congrats' tekst met de behaalde resultaten van de gebruiker. De gebruiker kan hier vervolgens zijn/haar naam intypen die wordt weergegeven in de volgende view.
* Compare Class
  * De laatste Class toont in een tableview de behaalde resultaten van de gebruikers.

## Challenges & Changes

Mijn app is volgens het begin design niet ontzettend veel veranderd. Ik heb echter wel keuzes moeten maken die de app technisch hebben veranderd.

#### Timer
Om te beginnen was het al een challenge voor mij om een normale en goedwerkende timer te maken. De timer heeft veel kleine bugs gehad, die uiteindelijk zijn verholpen. Gaandeweg het bouwen van de timer heb ik de pickerview veranderd naar een datepicker, omdat dit simpelweg makkelijker was om te implementeren met uren. Het lastige aan de timer was het correct meegeven van de ingevoerde waarde van de datepicker van de vorige view en het meegeven naar de volgende views.

#### API
De API verwerken in de app was voor mij de grootste challenge en hier ben ik de afgelopen weken ook het meest mee bezig geweest. Ten eerste ben ik een aantal keer veranderd van API source, omdat het achterhalen van de key en id ingewikkeld was, of de API deed het simpelweg niet. Ik ben hierna op de Food API van Nutritionix beland en hiermee verder gewerkt. Mijn doel was om de searchbar zo te implementeren dat gebruikers al het voedsel dat zij willen opzoeken kunnen vinden. Dit is uiteindelijk wel gelukt, maar niet precies zoals ik wilde. Nutritionix geeft namelijk twee lijsten: De een genaamd "common" en de andere "branded". De common lijst bevat alle producten die veel worden opgezocht. De branded lijst bevat producten van A-merken. Dit is de reden dat ik voor de common lijst ben gegaan. Dit had echter een nadeel, want deze lijst gaf weinig informatie en voedingswaarde over het product zelf. Ik wilde in de eerste instante de titel, voedingswaarde en foto van het gekozen product laten zien in de Food Detail view, maar omdat de common lijst naast de titel en foto geen belangrijke gegevens van het product meegeeft, toont de view nu alleen de naam en foto van het gekozen product. Dit is iets wat ik nog zou kunnen verbeteren door de andere lijst te implementeren die wel goede voedingswaarde en calorieen weergeeft.

#### SearchBar
De searchbar werkend krijgen was ook een grote challenge voor mij. De searchbar deed het een lange tijd niet, waardoor ik alles opnieuw heb moeten bouwen. Ik ben toen van een normale searchbar naar een searchbar + search display controller gegaan. Dit werd later weer een probleem omdat er verwarring werd veroorzaakt tussen de search display controller en de zelf ingebouwde tableview. Hierdoor heb ik de connectie van de searchbar naar de search display controller verwijderd, zodat er alleen een connectie bestaat met de tableview.

#### TableViews
Challenges heb ik ook gekregen door de implementaties van tableviews. Door de errors en challenges heb ik veel geleerd van tableviews op zich en de ingebouwde functies. De code

```
DispatchQueue.main.async {
 self.tableView.reloadData()
}
```
kan ik nu bijna dromen... 

#### Segues
De _prepare for segue_ methode was voor mijn app zeer belangrijk. Het correct meegeven van bepaalde waardes naar een volgende view met de juiste _identifier_ was ook een challenge op zich.

## Decisions

De keuzes die ik uiteindelijk heb gemaakt voor alle functies binnen mijn app, zijn keuzes voor het ontwikkelen van een mooie, goed-werkende en nette app. Zo had ik bijvoorbeeld mijn grootste verbeterpunt, namelijk binnenhalen van meer gegevens van de gekozen producten binnen de API, wel kunnen veranderd. Maar de reden dat ik dit niet heb gedaan is omdat ik dan in tijdsnood zou komen en nog tegen vele errors aan zou lopen die waarschijnlijk de hele functionaliteit van de API binnen mijn app zou verpesten. Dit is de reden dat ik het heb gelaten zoals het nu is, zodat de gebruiker wel een nette en werkende app krijgt. Had ik meer tijd gekregen, dan had ik zeer zeker beter gebruik gemaakt van de API.
