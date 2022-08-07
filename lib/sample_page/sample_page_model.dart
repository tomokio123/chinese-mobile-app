import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chinese_app/sample_page/book.dart';
import 'package:flutter/cupertino.dart';

class SamplePageModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。　
  List<Book> books = [];

  Future<void> fetchBooks() async {
    //始めにfirestoreのbooksデータを取得し変数docsに変換する。
    final docs = await FirebaseFirestore.instance.collection('books').get();
    // この部分では、データ全体であるdocsの内の一つ分のデータであるdocをmap化し新しいリストを作成する。
    final books = docs.docs.map((doc) => Book(doc)).toList();
    // getter docs: docs(List<QueryDocumentSnapshot<T>>型)の
    // ドキュメント全て(3種類のフィールド)をリストにして取り出す。
    // map(): Listの各要素をBookに変換
    // toList(): Map()から返ってきたIterable→Listに変換する。

    // ↓変数booksを先ほど作成したListであるbooksに変換する。
    this.books = books;
    notifyListeners();//データの変更を通知するやつ。その後
    // ChangeNotifierProvider<SamplePageModel>で通知を検知する。
  }
}