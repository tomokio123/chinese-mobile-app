import 'package:chinese_app/question_list/question_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chinese_app/level_page.dart';
import 'package:chinese_app/question_page.dart';
import 'package:chinese_app/answer_page.dart';
import 'package:chinese_app/resume_page.dart';
import 'package:chinese_app/settings_page.dart';
import 'package:chinese_app/sample_page/sample_page.dart';
import 'package:chinese_app/first_page.dart';
import 'package:chinese_app/language_choice_page.dart';
import 'package:chinese_app/main_model.dart';
import 'package:provider/provider.dart';
import 'add_book/add_book_page.dart';
import 'add_question/add_question_page.dart';
import 'genre/genre_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();//この二行も大事。
  //appを立ち上げた時に必ず通るのはmain関数!
  //からのrunApp()関数を用意、中に　MaterialApp関数をとりあえず用意する。
  //そしてその中に　home: 最初に呼び出したいクラス名()  をかく！！
  runApp(MaterialApp(
    title: "App",
    home: FirstPage(),
    theme: ThemeData(
      fontFamily: 'YujiSyuku',
    ),)
  );//runApp

  String greetingObject = Greeting('よう','こそ');
  //greetingObjectオブジェクトにGreeting関数を突っ込む。
  print(greetingObject);//greetingObjectオブジェクト(オブジェクト=処理の塊)をprint。
}//main関数ここまで！

//以下でGreeting関数を定義。引数は(String greet1, String greet2)。
String Greeting(String greet1, String greet2){
  String greeting = greet1 + greet2;//引数で処理を実行。greetingに一旦投入しておく。
  // その結果をreturn　greeting　として返している。
  return greeting;
}// Greeting 関数を定義。　関数とは処理の塊のこと。
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //そもそも上の一行はbuildメソッド。(関数みたいなやつ)
    final Size size = MediaQuery.of(context).size;
    Icon returnButton(int n){
      if(n == 1){
        return const Icon(Icons.arrow_back);
      }
      if(n == 2){
        return const Icon(Icons.mood_rounded);
      }
      else{
        return const Icon(Icons.settings_applications);
      }
    }
    Widget _TopButtons(int buttonsNumber){
      int number = buttonsNumber;
      return GestureDetector(
        //ジェスチャーを検出するウィジェット。
        // null以外のコールバックに対応するジェスチャを認識しようとします。
        //つまり　→　タッチ/ボタン入力検出用途で利用　する！！
        child: returnButton(number),
        onTap: () {
          if(number == 1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstPage()),
            );
            print('Tapped Top_left in mainpage!!');
          }
          if(number == 2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResumePage()),
            );
            print('Tapped Top_center in mainpage!!');
          }
          if(number == 3){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
            print('Tapped Top_rihgt in mainpage!!');
          }
        },
      );
    }
    void _DoOnPressed (int num){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            int n = num;
            if(n == 0) {
              return GenrePage();
            }if(n == 1) {
              return LevelPage();
            }if(n == 2) {
              return AddQuestionPage();
            }if(n == 3) {
              return QuestionListPage();
            }if(n == 4) {
              return QuestionPage();
            }if(n == 5) {
              return AnswerPage();
            }if(n == 6) {
              return AddBookPage();
            }if(n == 7) {
              return ResumePage();
            }if(n == 8) {
              return SettingsPage();
            }if(n == 9) {
              return SamplePage();
            }if(n == 10) {
              return FirstPage();
            }if(n == 11) {
              return HomeScreen();
            }if(n == 12) {
              return LanguageChoicePage();
            }else{
              return HomeScreen();
            }
          },
        ),
      );
    }
    Widget _ButtonText(String text) {
      return Text(
        '$text',
        style: TextStyle(
          fontFamily: 'YujiSyuku',
          fontSize: 20,
          color: Colors.white,
        ),
      );
    }
    Widget _Buttons(buttonsName,buttonsNumber) {
      return Container(
        width: size.width * 0.82 ,
        height: size.height * 0.13,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ElevatedButton(
            onPressed:(){
              _DoOnPressed(buttonsNumber);
            },
            style: ElevatedButton.styleFrom(
              //ElevatedButtonの背景色を下で定義
              primary: Color.fromRGBO(41, 60, 89, 1),
              elevation: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ButtonText(buttonsName),
              ],
            ),
          ),
        ),
      );
    }
    Widget ReturnDev(int devNumber, String devPage){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: _Buttons('$devPage $devNumber',devNumber),
      );
    }
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      // この画面（main.dart)が作られたときに、MainModelもイニシャライズ(create)される。
      // 要するにこの画面が再描画される。
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // //以上の記述一行だけでNavigationのBack矢印が消せる。
          centerTitle: true,
          backgroundColor: Colors.yellow[700],
          //色指定　Color(0xFF(ffffff))みたいにすれば16進数で色指定できる。
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TopButtons(1),
              _TopButtons(2),//Icons.mood_rounded
              _TopButtons(3)//Icons.arrow_forward_sharp
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Consumer<MainModel>(  //MainModelクラスを参照
                builder: (context, model, child) {
              //Consumerで囲った部分が再描画される。
                return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Card(
                        //   color: Color.fromRGBO(213, 227, 91, 1),
                        //   child: Column(
                        //     children: [
                        //       Text(
                        //         '${model.name}\n'
                        //             '${model.age}',//格納した変数を $変数　とすると取り出せる
                        //         style: TextStyle(
                        //           fontSize: 30,
                        //         ),
                        //       ),
                        //       ElevatedButton(
                        //           onPressed:() {
                        //             model.changeName ();
                        //             //押すのをトリガーとして、modelのメソッドchangeName ()
                        //             //が呼ばれて元々のString name = 'tomoki'から、
                        //             //name = 'tomoking';に変更が適用(create・再描画)される。
                        //           },
                        //           child: Text(
                        //               'Tap here'
                        //           ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        ReturnDev(0,'ToGenrePage'),
                        ReturnDev(1,'ToLevelPage'),
                        ReturnDev(2,'ToAddQuestionPage'),
                        ReturnDev(3,'ToQuestionListPage'),
                        ReturnDev(4,'ToQuestionPage'),
                        ReturnDev(5,'ToAnswerPage'),
                        ReturnDev(6,'ToAddBookPage'),
                        ReturnDev(7,'ToResumePage'),
                        ReturnDev(8,'ToSettingPage'),
                        ReturnDev(9,'ToSamplePage'),
                        ReturnDev(10,'ToFirstPage'),
                        ReturnDev(11,'ToHomeScreen'),
                        ReturnDev(12,'ToLanguageChoicePage'),
                      ],
                    ),
                );
              }
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          backgroundColor: Color.fromRGBO(255,215,0,1),
          child: const Icon(
              Icons.settings,
          color: Color.fromRGBO(41, 60, 89, 1),),
        ),
      ),
    );
  }
}

