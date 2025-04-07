import 'package:flutter/material.dart';
import 'package:song_likes_tut/features/song_likes/screens/song_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Likes Tut',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SongListPage(),
    );
  }
}
