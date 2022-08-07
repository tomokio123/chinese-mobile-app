import 'package:chinese_app/question_list/question.dart';
import 'package:chinese_app/question_list/question_list_model.dart';
import 'package:flutter/material.dart';
import 'package:chinese_app/result_page.dart';
import 'package:provider/provider.dart';
class QuestionPage extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}
class _QuestionState extends State<QuestionPage> {
    // //問題番号管理
      int questionsNumber = 0;
    // // //正解数管理
      int numberOfCorrectAnswer = 0;
    // // //選択肢管理
      int choicesNumber = 0;

      int answersNumber = 0;
      @override
    Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
      //上記の一行でサイズの割合指定ができる！size.width ってやつ。
      return ChangeNotifierProvider<QuestionListModel>(
        create: (_) => QuestionListModel()..fetchQuestionList(),
        // この画面（main.dart)が作られたときに、MainModelもイニシャライズ(create)される。
        // 要するにこの画面が再描画される。
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              '問題ページ',
            ),
            backgroundColor: Color.fromRGBO(41, 60, 89, 1),
          ),
          body: Center(
            // Center > Container だと背景は文字のところだけ。
            // Center < Container だと背景は全体にかかる。
            child: Consumer<QuestionListModel>(builder: (context, model, child) {
              final List<Question>? choices = model.choices;
              if (choices == null) {
                print('nullやで');
                return CircularProgressIndicator();
              }
              void _GoToNextPage(){
                //結果画面に遷移
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            numberOfCorrectAnswer: numberOfCorrectAnswer,
                            questionsNumber: questionsNumber)
                    )
                );
              }
              void _PressedDo1(){
                String correctAnswer = choices[questionsNumber].answer;
                //正解だった場合、正解数に１をたす
                if(correctAnswer == choices[questionsNumber].choice1) {
                  numberOfCorrectAnswer++;
                  print(numberOfCorrectAnswer);
                }
                //問題数が１０に達しない場合は問題数に１をたす
                if (questionsNumber + 1 < choices.length) {
                  setState(() {
                    questionsNumber++;
                  });
                }
                else {
                  //結果画面に遷移
                  _GoToNextPage();
                }
              }
              Widget _ButtonBox1() {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 0,
                  ),
                  child: Container(
                    color: Color.fromRGBO(41, 60, 89, 1),
                    width: size.width * 0.75 ,
                    child: ElevatedButton(
                      onPressed: (){
                        _PressedDo1();
                      },
                      style: ElevatedButton.styleFrom(
                        //ElevatedButtonの背景色を下で定義
                        primary: Color.fromRGBO(41, 60, 89, 1),
                        elevation: 8,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Text(
                            '${choices[questionsNumber].choice1}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        height: size.height * 0.30,
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '問題番号${questionsNumber + 1}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                //color: Colors.lightBlueAccent,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                        child: Text(
                                          // '${questionsTexts[questionsNumber]}',
                                          '${choices[questionsNumber].title}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _ButtonBox1(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: Container(
                        color: Color.fromRGBO(41, 60, 89, 1),
                        width: size.width * 0.75 ,
                        child: ElevatedButton(
                          onPressed: (){
                            String correctAnswer = choices[questionsNumber].answer;
                            //正解だった場合、正解数に１をたす
                            if(correctAnswer == choices[questionsNumber].choice2) {
                              numberOfCorrectAnswer++;
                              print(numberOfCorrectAnswer);
                            }
                            //問題数が１０に達しない場合は問題数に１をたす
                            if (questionsNumber + 1 < choices.length) {
                              setState(() {
                                questionsNumber++;
                              });
                            }
                            else {
                              _GoToNextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            //ElevatedButtonの背景色を下で定義
                            primary: Color.fromRGBO(41, 60, 89, 1),
                            elevation: 8,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Text(
                                '${choices[questionsNumber].choice2}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: Container(
                        color: Color.fromRGBO(41, 60, 89, 1),
                        width: size.width * 0.75 ,
                        child: ElevatedButton(
                          onPressed: (){
                            String correctAnswer = choices[questionsNumber].answer;
                            //正解だった場合、正解数に１をたす
                            if(correctAnswer == choices[questionsNumber].choice3) {
                              numberOfCorrectAnswer++;
                              print(numberOfCorrectAnswer);
                            }
                            //問題数が１０に達しない場合は問題数に１をたす
                            if (questionsNumber + 1 < choices.length) {
                              setState(() {
                                questionsNumber++;
                              });
                            }
                            else {
                              //結果画面に遷移
                              _GoToNextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            //ElevatedButtonの背景色を下で定義
                            primary: Color.fromRGBO(41, 60, 89, 1),
                            elevation: 8,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Text(
                                '${choices[questionsNumber].choice3}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: Container(
                        color: Color.fromRGBO(41, 60, 89, 1),
                        width: size.width * 0.75 ,
                        child: ElevatedButton(
                          onPressed: (){
                            String correctAnswer = choices[questionsNumber].answer;
                            //正解だった場合、正解数に１をたす
                            if(correctAnswer == choices[questionsNumber].choice4) {
                              numberOfCorrectAnswer++;
                              print(numberOfCorrectAnswer);
                            }
                            //問題数が１０に達しない場合は問題数に１をたす
                            if (questionsNumber + 1 < choices.length) {
                              setState(() {
                                questionsNumber++;
                              });
                            }
                            else {
                              //結果画面に遷移
                              _GoToNextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            //ElevatedButtonの背景色を下で定義
                            primary: Color.fromRGBO(41, 60, 89, 1),
                            elevation: 8,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Text(
                                '${choices[questionsNumber].choice4}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      );
    }
  }
