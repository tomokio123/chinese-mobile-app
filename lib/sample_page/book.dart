import 'package:cloud_firestore/cloud_firestore.dart';

// firestoreのドキュメントを扱う(データを格納する)クラスBookを作る。
class Book {

  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  Book(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    title = doc['title'];
    author = doc['author'];
  }
  // Bookで扱うフィールドを定義しておく。
  String title = 'something';//null,safety問題。とりあえず'something'初期値設定した
  String author = 'anyone';
}
