import 'package:chinese_app/main.dart';
import 'package:chinese_app/question_choice/question_choice_page.dart';
import 'package:chinese_app/question_list/question.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Genre.dart';
import 'genre_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//この処理が終わったら
  await Firebase.initializeApp();//この処理に移動できる
  runApp(GenrePage());
}
class GenrePage extends StatefulWidget {
  @override
  State<GenrePage> createState() => _GenrePageState();
}
class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return ChangeNotifierProvider<GenreModel>(
        create: (_) => GenreModel()..fetchGenreList(),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(67, 84, 110, 1) ,
          //上の記述で画面全体の背景色が指定できる
          appBar: AppBar(
            title: Text(
              'ジャンル選択ページ',
            ),
            backgroundColor: Colors.yellow[700],
          ),
          body: Container(
            color: Colors.white,//背景色
            child: Consumer<GenreModel>(builder: (context, model, index) {
                final List<Genre>? genres = model.genres;
                if (genres == null) {
                  print('genres == null');
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      //SingleChildScrollViewで囲むとスクロール可能になる
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Column(
                            children: [
                              Container(
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
                                                builder: (context) => QuestionChoicePage(genres[index].genresid)
                                            ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        //ElevatedButtonの背景色を下で定義
                                        primary: Color.fromRGBO(41, 60, 89, 1),
                                        elevation: 15,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${genres[index].genresid}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '${genres[index].genresname}',
                                            style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
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