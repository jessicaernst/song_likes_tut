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
│       │   ├── like_model.dart           # Like-Modell (State-Logik)
│       │   └── song.dart                 # Song-Modell (Datenmodell)
│       ├── screens/
│       │   └── song_list_page.dart       # Hauptseite mit Song-Liste und Gesamt-Likes
│       └── widgets/
│           └── song_tile.dart            # Widget für einzelne Songs mit Like-Button
```


---

## 💡 Provider im Überblick

Diese App verwendet das `Provider`-Paket für das State Management. Hier sind die wichtigsten Konzepte, die du in diesem Projekt sehen wirst:

1.  **`ChangeNotifier` (`like_model.dart`)**:
    *   Die `LikeModel`-Klasse erweitert `ChangeNotifier`. Das bedeutet, dass sie Änderungen an ihrem internen Zustand "melden" kann.
    *   Wenn sich der Zustand ändert (z.B. ein Song wird geliked), ruft `LikeModel` die Methode `notifyListeners()` auf.

2.  **`ChangeNotifierProvider` (`main.dart`)**:
    *   `ChangeNotifierProvider` ist ein Widget, das eine Instanz von `LikeModel` im Widget-Baum bereitstellt.
    *   `create: (_) => LikeModel()` erstellt eine neue Instanz von `LikeModel`.
    *   Alle Widgets unterhalb von `ChangeNotifierProvider` können auf diese Instanz zugreifen.

3.  **`Provider.of<LikeModel>(context)` (`song_list_page.dart`)**:
    *   Mit `Provider.of<LikeModel>(context)` kann man auf die Instanz von `LikeModel` zugreifen, die von `ChangeNotifierProvider` bereitgestellt wird.
    *   So kann man auf die Daten und Methoden von `LikeModel` zugreifen (z.B. `likeModel.totalLikes`).

4.  **`Consumer<LikeModel>` (`song_tile.dart`)**:
    *   `Consumer<LikeModel>` ist ein Widget, das auf Änderungen in `LikeModel` "hört".
    *   Wenn `notifyListeners()` in `LikeModel` aufgerufen wird, baut sich der `Consumer` neu auf.
    *   Der `builder` des `Consumer` bekommt die aktuelle Instanz von `LikeModel` als Parameter.
    *   So kann man die UI basierend auf dem aktuellen Zustand von `LikeModel` aktualisieren.

5. **Zusammengefasst**
    * `ChangeNotifier` ist die Klasse die sich ändert.
    * `ChangeNotifierProvider` stellt die Klasse zur verfügung.
    * `Provider.of` greift auf die Klasse zu.
    * `Consumer` hört auf die Änderungen der Klasse.

**Zusätzliche Hinweise:**

*   `Provider` macht es einfach, Daten und Zustand zwischen verschiedenen Widgets zu teilen.
*   `notifyListeners()` ist der Schlüssel, um die UI zu aktualisieren, wenn sich der Zustand ändert.

---
