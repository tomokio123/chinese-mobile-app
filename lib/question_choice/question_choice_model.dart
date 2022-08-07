import 'package:chinese_app/question_choice/Question_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class KindModel extends ChangeNotifier {
  List<Kind>? kinds;

  void fetchKindList() async {
    // final QuerySnapshot snapshot = await
    // FirebaseFirestore.instance.collection('genres')
    //     .doc('JcKMwDV3zEsXoetAWecw').collection('kinds').get();
    //3.23 ここまで。
    final QuerySnapshot snapshot = await
    FirebaseFirestore.instance.collection('genres').doc('JcKMwDV3zEsXoetAWecw').collection('kinds').get();

    final List<Kind> kinds = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // final String number = document.id;
      final String kindsName = data['kindsname'];
      final String kindsId = data['kindsid'];
      return Kind(kindsName,kindsId);
    }).toList();

    this.kinds = kinds;
    notifyListeners();
  }
}