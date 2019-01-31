# Final Report

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
