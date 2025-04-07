import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_likes_tut/app.dart';
import 'package:song_likes_tut/features/song_likes/data/like_model.dart';

void main() {
  runApp(
    // ChangeNotifierProvider stellt eine Instanz von LikeModel für die gesamte App zur Verfügung.
    // create: (_) => LikeModel() erstellt eine neue Instanz von LikeModel.
    // child: App() ist die App, die mit dem LikeModel versorgt wird.
    ChangeNotifierProvider(create: (_) => LikeModel(), child: const App()),
  );
}
