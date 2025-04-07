import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_likes_tut/features/song_likes/data/like_model.dart';
import 'package:song_likes_tut/features/song_likes/data/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    // Consumer<LikeModel> ist ein Widget, das auf Änderungen in LikeModel hört.
    // Es baut sich neu auf, wenn notifyListeners() in LikeModel aufgerufen wird.
    return Consumer<LikeModel>(
      // Der Builder wird jedes Mal aufgerufen, wenn sich LikeModel ändert.
      builder: (context, likeModel, child) {
        // Hier greifen wir auf die Methode isLiked() in LikeModel zu, um zu prüfen, ob der Song geliked wurde.
        final isLiked = likeModel.isLiked(song.title);

        return ListTile(
          title: Text(song.title),
          trailing: IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
            ),
            onPressed: () {
              // Ruft die Methode toggleLike() in LikeModel auf, um den Like-Status des Songs zu ändern.
              likeModel.toggleLike(song.title);
            },
          ),
        );
      },
    );
  }
}
