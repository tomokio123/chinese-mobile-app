import 'package:chinese_app/add_book/add_book_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AddBookPage());
}

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();
    return ChangeNotifierProvider<AddBookModel>(
      //値の変更があった時ChangeNotifierProvider<AddBookModel>で
      //囲まれた部分を再描画しないといけないからこれは必須。
      create: (_) => AddBookModel(),
      // この画面（main.dart)が作られたときに、AddBookModelもイニシャライズ(create)される。
      // 要するにこの画面が再描画される。　　イニシャライズ＝初期化(再描画)　の意味！
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
          backgroundColor: Color.fromRGBO(40, 61, 89, 1),
        ),
        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: '本のタイトル',
                    ),
                    onChanged: (text) {
                      //①onChangedは親(TextField)ウィジェットの変更があった際に呼び出されるメソッド
                      //②下記が実行される。
                      model.title = text;
                      //上記の意味：textをmodel.title(<AddBookModel>の変数title)に投げ込む。
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '本の著者',
                    ),
                    onChanged: (text) {
                      model.author = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // 追加の処理
                      try {
                        await model.addBook();
                        Navigator.of(context).pop(true);
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      //ElevatedButtonの背景色を下で定義
                      primary: Color.fromRGBO(40, 61, 89, 1),
                      elevation: 15,
                    ),
                    child: Text('追加する'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}