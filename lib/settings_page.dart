import 'package:chinese_app/main.dart';
import 'package:flutter/material.dart';
import 'package:chinese_app/level_page.dart';
import 'package:chinese_app/question_page.dart';
import 'package:chinese_app/answer_page.dart';
import 'package:chinese_app/resume_page.dart';
import 'genre/genre_page.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _TapToNextPage(int num) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context){
          int n = num;
          if(n == 0){
            return AnswerPage();
          }if(n == 1){
            return GenrePage();
          }if(n == 2){
            return LevelPage();
          }if(n == 3){
            return QuestionPage();
          }if(n == 4){
            return ResumePage();
          }else{
            return HomeScreen();
          }
        }),
      );
    }
    Widget _ListDev(int i, String DevName) {
      String devName = DevName;
      int nextpageNumber = i;
      return ListTile(
          leading: Icon(Icons.phone),
          title: Text(devName),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            _TapToNextPage(nextpageNumber);
          }
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '詳細設定',
        ),
        backgroundColor: Color.fromRGBO(41, 60, 89, 1),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(//ListViewは元からはみ出てもスクロールできる！
          children: <Widget>[
            _ListDev(0,'AnswerPage'),
            _ListDev(1,'GenrePage'),
            _ListDev(2,'LevelPage'),
            _ListDev(3,'QuestionPage'),
            _ListDev(4,'ResumePage'),
          ],
        ),
      ),
    );
  }
}