import 'package:chinese_app/language_choice_page.dart';
import 'package:chinese_app/question_choice/question_choice_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Question_choice.dart';
class QuestionChoicePage extends StatelessWidget {
  QuestionChoicePage(String genresid);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return ChangeNotifierProvider<KindModel>(
        create: (_) => KindModel()..fetchKindList(),
        child: Scaffold(
          backgroundColor: Colors.white,//背景色
          appBar: AppBar(
            title: Text(
              '問題選択ページ',
            ),
            backgroundColor: Colors.yellow[700],
          ),
          body: Container(
            color: Colors.white,//背景色
            child: Consumer<KindModel>(builder: (context, model, index) {
              final List<Kind>? kinds = model.kinds;
              if (kinds == null) {
                return Center(
                    child: CircularProgressIndicator());
              }
                return ListView.builder(
                    itemCount: kinds.length,
                    itemBuilder: (context, index)  {
                    return SingleChildScrollView(
                      //SingleChildScrollViewで囲むとスクロール可能になる
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.82 ,
                                height: size.height * 0.20,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) => LanguageChoicePage()
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        //ElevatedButtonの背景色を下で定義
                                        primary: Color.fromRGBO(41, 60, 89, 1),
                                        elevation: 15,
                                      ),
                                      child: Text(
                                            ' ${kinds[index].kindsname}',
                                        //3.22ここまでできた。
                                        style: TextStyle(
                                          fontSize: 30,
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
                    );
                  }
                );
              }
            ),
          ),
        ),
    );
  }
}