# SquadHealth Database Ontwikkelaarsgids

Deze ontwikkelaarsgids biedt een overzicht van de SquadHealth-database, met aandacht voor de architectuur, het doel van de verschillende tabellen, de rol van triggers en opgeslagen procedures, en beste praktijken voor efficiënte en veilige interactie met de database.

## Overzicht van de Databasearchitectuur

De SquadHealth-database is ontworpen om het beheer van gezondheidscontrole-enquêtes binnen een organisatie te vergemakkelijken, waardoor het verzamelen en analyseren van reacties van verschillende teams (squads) mogelijk is om de algehele efficiëntie en tevredenheid te verbeteren.

### Belangrijke Tabellen

- **`company`**: Bevat details over bedrijven, zoals hun naam, locatie en logo. Deze tabel is essentieel voor het identificeren van verschillende organisaties die de SquadHealth-tool gebruiken.
- **`squad`**: Bevat informatie over verschillende squads binnen een bedrijf. Squads zijn in wezen teams binnen de organisatie.
- **`user`**: Bewaart informatie over gebruikers, inclusief hun rol (bijv. Manager, Ontwikkelaar), wat helpt bij het beheren van toegang en rechten binnen de applicatie.
- **`questionnaire`**: Beheert verschillende vragenlijsten die aan gebruikers worden gedistribueerd voor feedback over verschillende aspecten van hun werk en omgeving.
- **`questionnaire_version`**: Volgt verschillende versies van elke vragenlijst, waardoor de evolutie van de inhoud van de enquête in de loop van de tijd mogelijk is, terwijl een geschiedenis van wijzigingen wordt bijgehouden.
- **`question`**: Bewaart de vragen voor elke vragenlijst, waardoor een dynamische en flexibele enquêtestructuur mogelijk is.
- **`answer`**: Registreert de antwoorden die door gebruikers worden gegeven, waarbij hun feedback wordt vastgelegd in reactie op de gestelde vragen in de enquêtes.
- **`invitation_link`**: Beheert de uitnodigingslinks die naar gebruikers worden verzonden om toegang te krijgen tot de vragenlijsten, inclusief het bijhouden of de link is gebruikt en wanneer deze verloopt.

### Triggers

- **Activatie en Statusupdates**: Triggers in de database zijn voornamelijk gericht op het handhaven van de juiste status van vragenlijstversies (actief/inactief) op basis van bepaalde acties, zoals het aanmaken of verwijderen van uitnodigingslinks. Dit zorgt ervoor dat vragenlijsten alleen beschikbaar zijn wanneer dit relevant is en op de juiste wijze worden beheerd gedurende hun levenscyclus.

### Opgeslagen Procedures

- **`UpdateQuestionnaireVersionStatus`**: Een belangrijke opgeslagen procedure die de actieve status van vragenlijstversies bijwerkt op basis van de aanwezigheid van bijbehorende uitnodigingslinks. Deze procedure is cruciaal voor het automatiseren van het beheer van de beschikbaarheid van vragenlijsten.
