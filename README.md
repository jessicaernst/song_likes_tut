# song_likes_tut

Eine minimalistische Flutter-App zur Demonstration von einfachem State Management  
mit Provider.

Die App zeigt eine Liste von Songs, ermöglicht das Setzen von "Likes" per Herzsymbol  
und zählt die Gesamtanzahl aller Likes. Zusätzlich gibt es einen Button, um alle Likes zurückzusetzen.

---

## 🚀 Funktionen

- Anzeige einer Liste von Songs  
- Herzsymbol zum Liken/Entliken einzelner Songs  
- Anzeige der Gesamtanzahl aller Likes  
- Button zum Zurücksetzen aller Likes  
- Übersichtliche, wartbare Code-Struktur  

---

## 🗂 Projektstruktur

```
lib/
├── app.dart                      # App-Konfiguration und Routing (optional)
├── main.dart                     # Einstiegspunkt der App
├── features/
│   └── song_likes/               # Feature: Song Likes
│       ├── data/
│       │   └── like_model.dart           # Like-Modell (State-Logik)
│       ├── screens/
│       │   └── song_list_page.dart       # Hauptseite mit Song-Liste und Gesamt-Likes
│       └── widgets/
│           └── song_tile.dart            # Widget für einzelne Songs mit Like-Button
```
