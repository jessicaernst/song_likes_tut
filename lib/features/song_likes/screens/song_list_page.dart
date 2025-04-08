import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_likes_tut/features/song_likes/data/like_notifier.dart';
import 'package:song_likes_tut/features/song_likes/data/song.dart';
import 'package:song_likes_tut/features/song_likes/widgets/song_tile.dart';

class SongListPage extends StatelessWidget {
  SongListPage({super.key});

  final List<Song> songs = [
    Song(title: 'Dancehall Caballeros'),
    Song(title: 'Schüttel deinen Speck'),
    Song(title: 'Toxic'),
    Song(title: 'Hot in Herre'),
  ];

  @override
  Widget build(BuildContext context) {
    // Hier holen wir uns die Instanz von LikeModel, die wir in main.dart erstellt haben.
    // Provider.of<LikeModel>(context) sucht im Widget-Baum nach einem LikeModel und gibt es zurück.
    // Dies ermöglicht es uns, auf die Daten und Methoden von LikeModel zuzugreifen.
    final likeNotifier = Provider.of<LikeNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Songs & Likes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            // Hier greifen wir auf die Methode totalLikes in LikeModel zu, um die Gesamtzahl der Likes anzuzeigen.
            child: Text(
              'Gesamt-Likes: ${likeNotifier.totalLikes}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Ruft die Methode resetLikes() in LikeModel auf, um alle Likes zurückzusetzen.
              likeNotifier.resetLikes();
            },
            child: const Text('Likes zurücksetzen'),
          ),
          Expanded(
            child: ListView(
              children: songs.map((song) => SongTile(song: song)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
