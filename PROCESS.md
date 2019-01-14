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
