import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_likes_tut/app.dart';
import 'package:song_likes_tut/features/song_likes/data/like_model.dart';

void main() {
  runApp(
    // ChangeNotifierProvider stellt eine Instanz von LikeModel für die gesamte App zur Verfügung.
    // create: (_) => LikeModel() erstellt eine neue Instanz von LikeModel.
    // child: App() ist die App, die mit dem LikeModel versorgt wird.
    // Der BuildContext muss hier nicht mitgegeben werden und kann mit dem Platzhalter _ ersetzt werden
    // wenn die App größer werden würde und man die likes an vielen Stellen brauchen würde dann würde man da den Context reingeben
    ChangeNotifierProvider(create: (_) => LikeModel(), child: const App()),
  );
}
