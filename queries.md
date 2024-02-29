# Voorbeeld SQL Queries voor een Vragenlijst Applicatie

### Creëren van een Nieuwe Vragenlijst

1. **Toevoegen van een Nieuwe Vragenlijst**

    ```sql
    INSERT INTO questionnaire (title, description, manager_id) 
    VALUES ('Jaarlijkse Tevredenheidsenquête', 'Een enquête om de tevredenheid van onze teams te meten.', 1);
    ```

2. **Creëren van een Vragenlijstversie**

    Bij het toevoegen van een nieuwe vragenlijstversie, wordt ervan uitgegaan dat het systeem automatisch beheert welke versie actief is, gebaseerd op de uitnodigingslinks die voor die versie zijn gegenereerd.

    ```sql
    INSERT INTO questionnaire_version (questionnaire_id, version_number, notes) 
    VALUES (LAST_INSERT_ID(), 1, 'Eerste versie van de jaarlijkse tevredenheidsenquête.');
    ```

3. **Toevoegen van Vragen aan de Vragenlijst**

    Na het creëren van een vragenlijstversie, kunnen vragen worden toegevoegd. `LAST_INSERT_ID()` wordt gebruikt als voorbeeld en zou in praktijk worden vervangen door de specifieke `version_id` verkregen na het invoegen van de vragenlijstversie.

    ```sql
    INSERT INTO question (questionnaire_id, priority, text, version_id) 
    VALUES 
    (1, 1, 'Hoe tevreden ben je met je huidige project?', LAST_INSERT_ID()),
    (1, 2, 'Hoe beoordeel je de communicatie binnen je team?', LAST_INSERT_ID());
    ```

### Beheren van Uitnodigingslinks

4. **Genereren van Uitnodigingslinks voor een Vragenlijst**

    Het genereren van unieke uitnodigingslinks voor gebruikers om de vragenlijst in te vullen. De `version_id` moet overeenkomen met de actieve vragenlijstversie.

    ```sql
    INSERT INTO invitation_link (questionnaire_id, user_id, uniqueLink, isUsed, expiresAt, version_id) 
    VALUES 
    (1, 1, 'unieke_link_1', 0, '2024-12-31 23:59:59', 1),
    (1, 2, 'unieke_link_2', 0, '2024-12-31 23:59:59', 1);
    ```

### Frontend Functionaliteit

5. **Ophalen van Vragenlijst en Vragen voor Invullen**

    Wanneer een gebruiker een vragenlijst gaat invullen, moeten de relevante vragen worden opgehaald. Dit kan gedaan worden door de uitnodigingslink te valideren en vervolgens de vragen voor de gerelateerde vragenlijstversie op te halen.

    ```sql
    SELECT q.text 
    FROM question q
    JOIN invitation_link il ON q.version_id = il.version_id
    WHERE il.uniqueLink = 'unieke_link_1' AND il.isUsed = 0 AND il.expiresAt > CURRENT_TIMESTAMP()
    ORDER BY q.priority;
    ```

### Antwoorden Verzamelen

6. **Opslaan van Antwoorden**

    Wanneer een gebruiker antwoorden op een vragenlijst verstuurt, worden deze opgeslagen met de desbetreffende `question_id`, `user_id`, en `version_id`. 

    ```sql
    INSERT INTO answer (question_id, user_id, answerColor, comment, version_id) 
    VALUES 
    (1, 1, 'Green', 'Ik ben zeer tevreden met mijn huidige project.', 1),
    (2, 1, 'Yellow', 'De communicatie binnen mijn team kan verbeterd worden.', 1);
    ```

### Geavanceerde Functionaliteit

7. **Activeren en Deactiveren van Vragenlijstversies**

    Hoewel het activeren en deactiveren

 van vragenlijstversies automatisch wordt beheerd via het systeem, is het belangrijk om te weten hoe de status wordt bijgehouden. Het systeem gebruikt de aanwezigheid van uitnodigingslinks en hun `isUsed` en `expiresAt` statussen om te bepalen of een versie actief moet zijn.

```sql
-- Voorbeeld: Handmatige check (niet aanbevolen voor regulier gebruik)
SELECT version_id, COUNT(*) AS open_invitations
FROM invitation_link
WHERE version_id = 1 AND isUsed = 0 AND expiresAt > CURRENT_TIMESTAMP()
GROUP BY version_id;
```

Deze voorbeeldqueries bieden een solide basis voor zowel de administratieve taken op het dashboard als de interactie met de frontend voor het invullen van enquêtes. Voor een optimale implementatie is het essentieel om deze queries te integreren binnen de applicatielogica, rekening houdend met beveiliging, validatie, en gebruikerservaring.

## Meer voorbeelden

Laten we de voorbeeldqueries verbeteren en verfijnen voor gebruik in een vragenlijstapplicatie. Hieronder staan geoptimaliseerde queries die rekening houden met best practices voor databaseontwerp en -interactie, gericht op efficiëntie en effectiviteit.

### Creëren van een Nieuwe Vragenlijst met Versies en Vragen

#### 1. Toevoegen van een Nieuwe Vragenlijst en Versie in één Transactie

Het toevoegen van een nieuwe vragenlijst en de bijbehorende eerste versie kan efficiënter worden gemaakt door het gebruik van transacties. Dit zorgt voor dataconsistentie.

```sql
START TRANSACTION;

INSERT INTO questionnaire (title, description, manager_id) 
VALUES ('Jaarlijkse Tevredenheidsenquête', 'Een enquête om de tevredenheid van onze teams te meten.', 1);

INSERT INTO questionnaire_version (questionnaire_id, version_number, notes) 
VALUES (LAST_INSERT_ID(), 1, 'Eerste versie van de jaarlijkse tevredenheidsenquête.');

COMMIT;
```

#### 2. Toevoegen van Vragen aan de Vragenlijst

Hier wordt aangenomen dat de `version_id` bekend is en direct wordt gebruikt, wat realistischer is in een applicatieomgeving.

```sql
INSERT INTO question (questionnaire_id, priority, text, version_id) 
VALUES 
(1, 1, 'Hoe tevreden ben je met je huidige project?', 1),
(1, 2, 'Hoe beoordeel je de communicatie binnen je team?', 1);
```

### Beheren van Uitnodigingslinks

#### 3. Genereren van Uitnodigingslinks voor een Vragenlijst

Om de bruikbaarheid te verhogen, kan men overwegen een functie of procedure te implementeren die unieke links genereert.

```sql
INSERT INTO invitation_link (questionnaire_id, user_id, uniqueLink, isUsed, expiresAt, version_id) 
VALUES 
(1, 1, UUID(), 0, DATE_ADD(NOW(), INTERVAL 30 DAY), 1),
(1, 2, UUID(), 0, DATE_ADD(NOW(), INTERVAL 30 DAY), 1);
```

### Frontend Functionaliteit

#### 4. Ophalen van Vragen voor Invullen

Krijg tabel met unieke links en het aantal vragen per link.

```sql 
SELECT 
    il.uniqueLink,
    COUNT(q.id) AS questionCount
FROM 
    invitation_link il
LEFT JOIN 
    question q ON il.version_id = q.version_id
WHERE 
    il.isUsed = 0 
    AND il.expiresAt > CURRENT_TIMESTAMP()
GROUP BY 
    il.uniqueLink;
```

Ophalen van vragen voor een specifieke unieke link, gesorteerd op prioriteit.

```sql
SELECT q.id, q.text, q.priority
FROM question q
WHERE q.version_id = (
    SELECT version_id
    FROM invitation_link
    WHERE uniqueLink = 'unieke_link_1' AND isUsed = 0 AND expiresAt > CURRENT_TIMESTAMP()
)
ORDER BY q.priority;
```

### Antwoorden Verzamelen

#### 5. Opslaan van Antwoorden in Bulk

Het is efficiënter om meerdere antwoorden tegelijk op te slaan, indien de applicatielogica dit toestaat.

```sql
INSERT INTO answer (question_id, user_id, answerColor, comment, version_id) 
VALUES 
(1, 1, 'Green', 'Zeer tevreden met mijn huidige project.', 1),
(2, 1, 'Yellow', 'De communicatie binnen mijn team kan verbeterd worden.', 1);
```

