import 'package:flutter/material.dart';

// LikeModel erbt von ChangeNotifier, um Änderungen zu signalisieren.
// Dies ist notwendig, damit Provider weiß, wann es die Widgets neu aufbauen muss.
class LikeModel extends ChangeNotifier {
  final Map<String, bool> _likes = {};

  // Gibt zurück, ob ein Song geliked wurde.
  bool isLiked(String title) => _likes[title] ?? false;

  // Gibt die Gesamtzahl der gelikten Songs zurück.
  int get totalLikes => _likes.values.where((isLiked) => isLiked).length;

  // Ändert den Like-Status eines Songs.
  void toggleLike(String title) {
    _likes[title] = !isLiked(title);
    // Benachrichtigt alle Listener (z.B. Consumer-Widgets), dass sich der Status geändert hat.
    notifyListeners();
  }

  // Setzt alle Likes zurück.
  void resetLikes() {
    _likes.clear();
    // Benachrichtigt alle Listener, dass sich der Status geändert hat.
    notifyListeners();
  }
}
