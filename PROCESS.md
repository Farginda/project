## Day 3: 09-01-2019

Vandaag ben ik begonnen met het maken van een prototype van de app. Ik heb de (table)viewcontrollers aangemaakt en de bijbehorende connecties gelegd. Verder heb ik een ander soort Food API gevonden die voor mijn gevoel beter past bij mijn app en ook 'makkelijker' te gebruiken is. Verder ben ik erachter gekomen dat Swift geen ingebouwde Timer heeft in de Library. Na online onderzoek heb ik wel een manier gevonden om een eigen Timer te maken in Swift.

## Day 4: 10-01-2019

Vandaag heb ik mijn prototype een beetje aangepast en afgemaakt. Daarnaast heb ik mijn API verder uitgezocht, aangezien dit niet een normale URL heeft maar werkt met _curl_. Tot slot heb ik een plan gemaakt voor het maken van een timer in XCode.

<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-09%20om%2015.32.15.png" width="130%" height="130%"/>

## Day 5: 11-01-2019

Vandaag ben ik begonnen aan het maken van de timer. De timer werkt, maar ik moet nog de _userinfo_ verwerken. De timer kan lopen en resetten, maar er kan nog niet een bepaalde tijd worden ingesteld. Verder heb ik een nieuwe _TableViewController_ gemaakt voor het verlenen van extra informatie over _intermittent fasting_. Hierbij krijg ik nog een error die ik nog niet kan verwerken.

<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-11%20om%2014.09.48.png" width="30%" height="30%"/>

<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-11%20om%2014.10.22.png" width="130%" height="130%"/>

## Day 6: 14-01-2019

Vandaag heb ik de _PickerView_ veranderd naar een _DatePickerView_, aangezien ik dit wil gebruiken voor het instellen van de tijd. Met de _DatePickerView_ kan dit makkelijker worden ingesteld. De gebruiker kan hiermee het aantal gewenste uren (en kwartieren) vaststellen, waarmee de timer kan worden gestart. Waar ik vandaag nog in de knoop mee zit, is dat de gekozen _userinfo_ door middel van een _prepare for segue_ doorgegeven moet worden aan de volgende _view_.

Daarnaast is het een vervelend probleem dat ik online informatie tegenkom waarbij er een oudere versie van Xcode wordt gebruikt. Het is is lastig te vinden hoe ik dit in mijn huidige versie van Xcode kan veranderen.

## Day 7: 15-01-2019

Vandaag heb ik geprobeerd om de timer verder uit te breiden. Daarnaast heb ik mijn Food API veranderd naar een andere link, omdat mijn vorige API ingewikkeld in gebruik was. Verder heb ik lang gewacht op hulp (3+ uur), die ik uiteindelijk niet heb gekregen. Ik heb dus een aantal vragen waar ik nog steeds mee zit en hulp bij nodig heb.

## Dag 8: 16-01-2019

Vandaag heb ik de timer zo goed mogelijk lopend gekregen. Er zit echter alleen nog een bug bij het meegeven van de _userinput_, want er komen steeds een aantal seconden bovenop de gekozen uren bij. Verder ben ik bezig geweest de API werkend krijgen, maar daar zit ik ook nog vast op bepaalde plekken. De Food API heeft namelijk bij een request een header nodig. Verder ben ik begonnen aan de 'scores' _tableview_, waarbij de rester API wordt gebruikt. 

## Day 9: 17-01-2019

Vandaag heb ik verdergewerkt aan de API en de viewcontrollers. Ik heb de layout van de tableviewcontroller zo goed mogelijk gemaakt. Het probleem waar ik nu nog tegenaan loop is dat de data van de API niet wordt weergegeven in de tableview. Ik heb de API request ook wat veranderd en een andere struct gemaakt, maar nog zonder succes. Daarnaast heb ik de navigatie binnen de app een beetje veranderd voor een betere gebruikservaring. 

## Day 10: 18-01-2019

Vandaag heb ik verder gewerkt aan de API functie. Hierbij heb ik mijn hele _FoodModel_ veranderd, omdat mijn eerste ingeving in de API niet juist was. Ik heb het gevoel dat de API functie bijna werkt, alleen nog kleine bugs hier en daar! Daarnaast heb ik de navigatie beter werkend gemaakt. Tot slot heb ik gewerkt aan de _compareTableView_, waarbij gebruikers hun behaalde resultaten kunnen vergelijken.

## Day 11: 21-01-2019

Vandaag heb ik gewerkt aan een aantal bugs van de API. De API wordt nu wel geprint in de terminal, maar nog niet in de app. Dit komt door een crash bij het tikken van de searchbar. Hier heb ik met iemand van de staff heel lang aan gezeten, maar nog steeds zonder resultaat. Verder werkt de database voor de scores nu goed en is dit zichtbaar in de app. Er is ruimte voor veel verbetering, dus daar ga ik komende dagen aan werken.

## Day 12: 22-01-2019

Vandaag heb ik de hele dag aan de design van de app gewerkt, waarbij ik alle views een bepaalde thema en kleur heb gegeven. Daarnaast heb ik geprobeerd om zoveel mogelijk bugs te fixen, zodat ik morgen bij de assistentie kan werken aan een goed werkende API. 

<img src="https://github.com/Farginda/project/blob/master/doc/Schermafbeelding%202019-01-22%20om%2022.28.27.png" width="130%" height="130%"/>

## Day 13: 23-01-2019

Vandaag heb ik de hele dag gewerkt aan de searchbar. Deze werkt nog steeds niet goed, maar wel beter dan eerst. Verder heb ik een aantal nieuwe classes aangemaakt die hierbij hebben geholpen. Ik heb verder gewerkt aan de API. De uitkomsten van mijn API verschijnen wel in mijn terminal maar nog niet correct in de app.

## Day 14: 24-01-2019

Hackathon 😁

## Day 15: 25-01-2019

Vandaag heb ik verder gewerkt aan alle bugs in mijn app. Een aantal heb ik kunnen oplossen en een aantal niet. De searchbar werkt nu bijna en crasht niet meer. Ik heb de manier van mijn GET request van de api veranderd, omdat de invoer van de gebruiker ook in de query moet komen. De API moet nu nog geladen worden in de tableview, waarbij de gebruiker al het voedsel in de api zou kunnen zoeken.

## Day 16: 28-01-2019

Vandaag heb ik eindelijk de API werkend gekregen in mijn terminal. Ik stuit nu alleen nog op een error waardoor de lijst niet wordt getoond in mijn app. Verder heb ik middels de _unwindtosegue_ methode een manier gemaakt dat de timer altijd door blijft lopen, ook wanneer andere viewcontrollers worden geopend.

## Day 17: 29-01-2019

Na heel veel bugs hier en daar heb ik vandaag eindelijk de searchbar en tableview werkend gekregen! Het enige waar ik nu nog aan moet werken is het doorgeven van de juiste gegevens naar de volgende viewcontroller.

## Day 18: 30-01-2019

Vandaag heb ik eindelijk de app afgemaakt en volledig werkend gekregen. Ik heb kleine verbeteringen aangebracht zowel aan de app design als in de code. Ik heb de overbodige files op de repository verwijderd. Tot slot heb ik nog waar nodig comments toegevoegd in de code.
