# Ghost Net Fishing

Prototypische Webanwendung zum Melden und Bergen von Geisternetzen.

Entwickelt im Rahmen der Fallstudie im Kurs **IPWA02-01 - Programmierung von industriellen Informationssystemen mit Java EE**

## Technologie-Stack

- Java 21
- Spring Boot
- Spring Data JPA + Hibernate
- MySQL 8.4
- Thymeleaf

## Voraussetzungen

- Java Development Kit (JDK), Version 21
- MySQL (Version 8.4 oder höher)
- Maven (im Projekt über den Maven-Wrapper bereits enthalten)

## Installation

**1. Projekt klonen**

```bash
git clone https://github.com/daniel7be/ghostnetfishing.git
cd ghostnetfishing
```

**2. Datenbank einrichten**

Der enthaltene Dump legt die Datenbank automatisch an:

```bash
mysql -u root -p < ghostnetfishing_dump.sql
```

**3. Datenbankverbindung anpassen**

In `src/main/resources/application.properties` das Passwort der lokalen MySQL-Installation eintragen:

spring.datasource.username=root

spring.datasource.password=[LOKALES-MYSQL-PASSWORT]

**4. Anwendung starten**

```bash
./mvnw spring-boot:run
```

Die Anwendung ist anschließend unter http://localhost:8080 erreichbar.

## Projektstruktur

src/main/java/de/iu/ghostnetfishing/

├── controller/GeisternetzController

├── model/Geisternetz, Person, Status

├── repository/GeisternetzRepository, PersonRepository

└── GhostnetfishingApplication.java

src/main/resources/

├── templates/melden.html, netze.html, bergung.html

└── application.properties

## Umgesetzte Anforderungen

1. Geisternetze melden (anonym oder namentlich)
2. Für die Bergung eines Netzes eintragen
3. Offene Bergungen anzeigen
4. Netze als geborgen melden
5. Netze als verschollen melden (nur nicht-anonym)
