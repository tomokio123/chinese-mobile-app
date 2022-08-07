import 'package:flutter/material.dart';

class QuestionPageModel extends ChangeNotifier {

  // provider + ChangeNotifier をモデルに書き込むことでStateless Widgetのときも
  // 外から変数を変更できるようになる。そうすることで可読性、メンテナンス性が上がる
  // 厳密にいうと、statefulの時は画面再描画が入ってしまいstateが変わらない部分も
  // 再描画されてしまうのでUI UXに悪いし
  //  これができれば任意の範囲だけ再描画・createできるようにもなる！！

}