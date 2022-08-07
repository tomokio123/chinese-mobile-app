import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddQuestionModel extends ChangeNotifier {
  String? title;
  //③onChangedから投げ込まれた値がここに入る。
  String? answer;
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;

  // ④下の addBook() メソッドが実行される。
  Future addQuestion() async {
    if (title == null || title == "") {// title == null or title == ""(空)　の時、
      throw 'タイトルが入力されていません';
    }

    if (choice1 == null || choice1!.isEmpty) { // 「== ""」　と　「!.isEmpty」　は同じ意味。
      throw '選択肢１が入力されていません';
    }
    if (choice2 == null || choice2!.isEmpty) { // 「== ""」　と　「!.isEmpty」　は同じ意味。
      throw '選択肢２が入力されていません';
    }
    if (choice3 == null || choice3!.isEmpty) { // 「== ""」　と　「!.isEmpty」　は同じ意味。
      throw '選択肢３が入力されていません';
    }
    if (choice4 == null || choice4!.isEmpty) { // 「== ""」　と　「!.isEmpty」　は同じ意味。
      throw '選択肢４が入力されていません';
    }

    //⑤上記のバリデーションを突破したら firebase にデータを　add　する！！！！
    // firestoreに追加！(add!!)。　　addがgetなら値を取得できる。
    await FirebaseFirestore.instance.collection('questions').add({
      'title': title,
      'answer': answer,
      'choice1': choice1,
      'choice2': choice2,
      'choice3': choice3,
      'choice4': choice4,
    });
    // await FirebaseFirestore.instance.collection('questions').doc('JtoC').set({
    //   'title': title,
    //   'answer': answer,
    //   'choice1': choice1,
    //   'choice2': choice2,
    //   'choice3': choice3,
    //   'choice4': choice4,
    // });//ドキュメントを指定もできる。
  }
}