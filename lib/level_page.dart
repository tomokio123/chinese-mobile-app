import 'package:flutter/material.dart';
import 'package:chinese_app/question_page.dart';
class LevelPage extends StatelessWidget {
  const LevelPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        title: Text(
          'LevelPage',
        ),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        child: SingleChildScrollView(
          //SingleChildScrollViewで囲むとスクロール可能になる
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.82 ,
                    height: size.height * 0.20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => QuestionPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          //ElevatedButtonの背景色を下で定義
                          primary: Color.fromRGBO(41, 60, 89, 1),
                        ),
                        child: Text(
                          'TO_LevelPage',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}