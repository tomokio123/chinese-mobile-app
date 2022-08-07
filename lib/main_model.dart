import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {

  // provider + ChangeNotifier をモデルに書き込むことでStateless Widgetのときも
  // 外から変数を変更できるようになる。そうすることで可読性、メンテナンス性が上がる
  // 厳密にいうと、statefulの時は画面再描画が入ってしまいstateが変わらない部分も
  // 再描画されてしまうのでUI UXに悪いし
  //  これができれば任意の範囲だけ再描画・createできるようにもなる！！

 String name = 'tomoki';// 変数を宣言した。
 int age = 20;

  void changeName () {
    name = 'tomoking'; // 名前の変更をする
    age = 21;
    notifyListeners();  //変更したことを通知するメソッド => notifyListeners
  }

}