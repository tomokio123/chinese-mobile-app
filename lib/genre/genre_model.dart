import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'Genre.dart';

class GenreModel extends ChangeNotifier {
  List<Genre>? genres;

  void fetchGenreList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collectionGroup('genres').get();

    final List<Genre> genres = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // final String number = document.id;
      final String genresName = data['genresname'];
      final String genresId = data['genresid'];
      return Genre(genresName,genresId);
    }).toList();

    this.genres = genres;
    notifyListeners();
  }
}