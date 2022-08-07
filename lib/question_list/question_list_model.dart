import 'package:chinese_app/question_list/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class QuestionListModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。　
  // List<Book> books = [];

  // Future<void> fetchBooks() async {
  //   // //始めにfirestoreのbooksデータを取得し変数docsに変換する。
  //   // final docs = await FirebaseFirestore.instance.collection('books').get();
  //   // // この部分では、データ全体であるdocsの内の一つ分のデータであるdocをmap化し新しいリストを作成する。
  //   // final books = docs.docs.map((doc) => Book(doc)).toList();
  //   // // getter docs: docs(List<QueryDocumentSnapshot<T>>型)の
  //   // // ドキュメント全て(3種類のフィールド)をリストにして取り出す。
  //   // // map(): Listの各要素をBookに変換
  //   // // toList(): Map()から返ってきたIterable→Listに変換する。
  //   //
  //   // // ↓変数booksを先ほど作成したListであるbooksに変換する。
  //   // this.books = books;
  //   // notifyListeners();//データの変更を通知するやつ。その後
  //   // // ChangeNotifierProvider<SamplePageModel>で通知を検知する。
  // }
  List<Question>? choices;

  void fetchQuestionList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collectionGroup('questions').get();

    final List<Question> choices = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // final String number = document.id;
      final String title = data['title'];
      final String answer = data['answer'];
      final String choice1 = data['choice1'];
      final String choice2 = data['choice2'];
      final String choice3 = data['choice3'];
      final String choice4 = data['choice4'];
      //final String number = data['number'];
      return Question(title, answer, choice1, choice2, choice3, choice4);
    }).toList();

    this.choices = choices;
    notifyListeners();
  }
}