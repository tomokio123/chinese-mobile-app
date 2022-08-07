import 'package:chinese_app/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  int numberOfCorrectAnswer = 0;
  int questionsNumber = 0;

  ResultPage({this.numberOfCorrectAnswer = 0,this.questionsNumber = 0});

  String? PorigonWords (){
    if(numberOfCorrectAnswer == 0){
      return 'unkoman';
    }
    if(numberOfCorrectAnswer >= 1 && numberOfCorrectAnswer  <=3){
      return 'unko';
    }
    if(numberOfCorrectAnswer >= 4 && numberOfCorrectAnswer <=6){
      return 'normal';
    }
    if(numberOfCorrectAnswer >= 7 && numberOfCorrectAnswer <=9){
      return 'good';
    }
    if(numberOfCorrectAnswer == 10){
      return 'Great!';
    }
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //以上の記述一行だけでNavigationのBack矢印が消せる。
        title: Text(
          'ResultPage',
        ),
        backgroundColor: Color.fromRGBO(41, 60, 89, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.teal,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      '${questionsNumber + 1}問中\n'
                          '$numberOfCorrectAnswer問\n正解っす',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 2,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: ElevatedButton(
                  child: Text(
                    'button to HomeScreen',
                    style: TextStyle(
                      color: Color.fromRGBO(41, 60, 89, 1)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()
                        ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    //ElevatedButtonの背景色を下で定義
                    primary: Colors.yellow,
                    elevation: 8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              // child: PorigonWords();
              child: Text('comment'),
            ),
          ],
        ),
      ),
    );
  }
}