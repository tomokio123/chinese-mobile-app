import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  //③onChangedから投げ込まれた値がここに入る。
  String? author;

  // ④下の addBook() メソッドが実行される。
  Future addBook() async {
    if (title == null || title == "") {// title == null or title == ""(空)　の時、
      throw 'タイトルが入力されていません';
    }

    if (author == null || author!.isEmpty) { // 「== ""」　と　「!.isEmpty」　は同じ意味。
      throw '著者が入力されていません';
    }

    //⑤上記のバリデーションを突破したら firebase にデータを　add　する！！！！
    // firestoreに追加！(add!!)。　　addがgetなら値を取得できる。
    await FirebaseFirestore.instance.collection('books').add({
      'title': title,
      'author': author,
    });
  }
}