import 'package:chinese_app/question_choice/question_choice_page.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '成績一覧',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Container(
                    width: size.width * 0.82 ,
                    height: size.height * 0.35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          //ElevatedButtonの背景色を下で定義
                          primary: Color.fromRGBO(41, 60, 89, 1),
                        ),
                        child: Text(
                          'ResumePageは過去の問題の成績一覧を確認できるページ',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Container(
                    width: size.width * 0.82 ,
                    height: size.height * 0.35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          //ElevatedButton『style: ElevatedButton.styleFrom』はよく使うので、覚えておく！
                          //ElevatedButtonの背景色を下で定義
                          primary: Color.fromRGBO(41, 60, 89, 1),
                          elevation: 20,
                        ),
                        child: Text(
                          'おホッホッホ',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
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
    );
  }
}