import 'package:flutter/material.dart';
import 'package:chinese_app/question_page.dart';
// class LanguageChoicePageArguments {
//   int chosenNumber = 0;
//   LanguageChoicePageArguments(this.chosenNumber);//イニシャライザと呼ぶ
// }//データの受け渡し。まずは引数Arguments、(chosenNumber) を定義しよう。
// //this.chosenNumberはこの同じクラス内の変数chosenNumberを指定しましたよってこと。
class LanguageChoicePage extends StatefulWidget {
  @override
  State<LanguageChoicePage> createState() => _LanguageChoicePageState();
}
class _LanguageChoicePageState extends State<LanguageChoicePage> {
  void _questionPage(int languageNumber){
    print(languageNumber);
    if(languageNumber == 0) {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => QuestionPage()
          )
      );
    }
    if(languageNumber == 1){
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => QuestionPage()
          )
      );
    }
  }
  void _languageChoice(int languageNumber){
    int number = languageNumber;
    setState(() {
      if(number == 0) {
        _questionPage(0);
      }
      if(number == 1) {
        _questionPage(1);
      }
    });
  }
  //言語選択ページは特に値によって画面描画が変わらないので、StatelessWidget でいい、はず
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    Widget _ChoiceBox(int num, String language){
      int n = num;
      String lang = language;
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
        child: SizedBox(
          width: size.width * 0.82 ,
          height: size.height * 0.35,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _languageChoice(n),
              //0　日本語 → 中国語
              style: ElevatedButton.styleFrom(
                //ElevatedButtonの背景色を下で定義
                primary: Color.fromRGBO(41, 60, 89, 1),
                elevation: 40,
              ),
              child: Text(lang,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,//背景色
      appBar: AppBar(
        title: Text(
          '言語選択',
        ),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ChoiceBox(0,'日本語 → 中国語'),
                _ChoiceBox(1,'中国語 → 日本語')
              ],
            ),
          ),
        ),
      ),
    );
  }
}