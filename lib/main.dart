import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_likes_tut/app.dart';
import 'package:song_likes_tut/features/song_likes/data/like_notifier.dart';

void main() {
  runApp(
    /// ChangeNotifierProvider stellt eine Instanz von LikeNotifier für die gesamte App zur Verfügung.
    /// create: (_) => LikeNotifier() erzeugt diese Instanz beim Start.
    /// child: App() ist das Wurzel-Widget, das den bereitgestellten State konsumiert.

    /// 🧠 Wichtig: Der BuildContext muss hier NICHT mitgegeben werden!
    /// Du kannst ihn problemlos durch einen Platzhalter (_) ersetzen –
    /// denn im create-Callback ist der Kontext noch nicht vollständig initialisiert
    /// und nicht geeignet für Theme, Navigator, Provider.of(), etc.

    /// ❌ Wann sollte man KEINEN BuildContext übergeben?
    /// Auch wenn es technisch möglich ist, solltest du es vermeiden,
    /// dem Notifier im Konstruktor einen BuildContext mitzugeben.
    /// Der Kontext im create-Callback:
    /// • ist noch nicht stabil (Tree ist im Aufbau)
    /// • kann keine anderen Provider zuverlässig lesen
    /// • gibt dir keinen Zugriff auf Theme, MediaQuery, Localizations etc.
    /// • koppelt deine Logik-Klasse hart ans UI – das macht sie schwer testbar & wiederverwendbar

    /// ✅ Wann braucht ein Notifier überhaupt Daten beim Erstellen?
    /// Wenn er auf externe Abhängigkeiten angewiesen ist (z. B. User, Config),
    /// dann solltest du diese sauber übergeben – aber NICHT per Context.
    /// Dafür gibt es zwei bewährte Wege:

    /// 🔹 Variante A – ProxyProvider (mehrere Provider kombinieren):
    /*
    ChangeNotifierProvider(create: (_) => LikeNotifier()),
    ProxyProvider<AuthNotifier, LikeNotifier>(
      update: (_, auth, likeNotifier) => likeNotifier!..setUser(auth.user),
    ),
    */

    /// 🔹 Variante B – Direkte Übergabe beim Erstellen:
    /*
    ChangeNotifierProvider(
      create: (_) => LikeNotifier(config: AppConfig.instance),
    ),
    */

    /// ⚠️ Ausnahmefall – Kontext nur zur einmaligen Wert-Ermittlung:
    /// Nur dann akzeptabel, wenn du z. B. die aktuelle Locale auslesen willst
    /// und sie sofort (einmalig) verwendest – nicht speicherst:
    /*
    ChangeNotifierProvider(
      create: (context) {
        final locale = Localizations.localeOf(context);
        return TranslationNotifier(locale);
      },
    ),
    */

    /// Auch hier gilt: bitte sparsam.
    /// Lokalisierte Strings gehören ins UI (Widgets), nicht in den Notifier.
    /// Sonst verlierst du Trennung von Zuständigkeiten und Flexibilität.

    /// 📉 Was sind die konkreten Folgen, wenn du den Kontext inflationär im Provider weitergibst?

    /// | Verhalten                              | Folge                                         | Bewertung     |
    /// |----------------------------------------|-----------------------------------------------|---------------|
    /// | `context` im create: übergeben         | Keine garantierte Stabilität des Kontextes    | ⚠️  Riskant   |
    /// | Provider.of() im Konstruktor verwenden | Kann crashen oder fehlschlagen                | ❌ Verboten   |
    /// | Kontextabhängigkeit im Notifier        | UI-Kopplung, keine Wiederverwendbarkeit       | ⚠️ Schlechte Praxis |
    /// | Kein Kontext, nur Parameter            | Klar, testbar, modular                        | ✅ Best Practice |

    /// ✅ Fazit:
    /// State-Logik (z. B. Notifier) sollte kontextfrei sein.
    /// Kontextbasierte Funktionen (z. B. Lokalisierung, Navigator) gehören ins Widget-UI.
    /// Trennung von Logik und Darstellung = wartbare & saubere App-Architektur.
    ChangeNotifierProvider(create: (_) => LikeNotifier(), child: const App()),
  );
}
