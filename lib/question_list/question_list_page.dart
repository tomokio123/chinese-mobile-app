import 'package:chinese_app/question_list/question.dart';
import 'package:chinese_app/question_list/question_list_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../add_question/add_question_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuestionListPage());
}

class QuestionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionListModel>(
      create: (_) => QuestionListModel()..fetchQuestionList(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(40, 61, 89, 1),
          title: Text('Question一覧'),
        ),
        body: Center(
          child: Consumer<QuestionListModel>(builder: (context, model, child) {
            final List<Question>? choices = model.choices;

            if (choices == null) {
              return CircularProgressIndicator();
            }
            return Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      //以下の一行がないとスクロールしても戻っちゃう！
                      physics: const NeverScrollableScrollPhysics(),
                      //Vertical viewport was given unbounded height.のエラーが出てこれを記述した
                      //原因:Columnの中でListViewを使う場合、そのまま使うとListViewの大きさが定まらず,
                      //こののようなエラーが吐かれてしまう。
                      itemCount: choices.length,
                      itemBuilder: (context, index) {//indexは下で[インデックス番号]として使える.
                        return Slidable(
                          // dismissibleを使う場合は必須
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                            // ActionPaneの出現アニメーション（必須）
                            motion: const DrawerMotion(),
                            // 最後までスワイプしたときにこのSlidableを消す（keyが必須）
                            dismissible: DismissiblePane(onDismissed: () {}),
                            // 出てくるWidgetを指定（必須）
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  //deletePageに遷移
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          // 右から出てくる
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                autoClose: false,
                                onPressed: null,
                                // onPressed: (context) async {
                                //   final bool? added = await Navigator.push(
                                //   //editPageに遷移
                                //   context,
                                //     MaterialPageRoute(
                                //       builder: (context) => EditBookPage(),
                                //     ),
                                //   );
                                //   if (added != null && added) {
                                //     final snackBar = SnackBar(
                                //       backgroundColor: Colors.greenAccent,
                                //       content: Text('本を編集しました'),
                                //     );
                                //     ScaffoldMessenger.of(context)
                                //     .showSnackBar(snackBar);
                                //   }
                                // },//onPressedここまで
                                backgroundColor: const Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                            ],
                          ),// 左から出てくる
                          //####################################################
                          child: ListTile(
                            //ここにSlidableを入れるとキモくなる。
                            title: Container(
                              color: Colors.lime,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text('問題番号${index + 1}',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),),
                                  ),
                                  Center(
                                    child: Text(choices[index].title,
                                      style: TextStyle(
                                          fontSize: 22
                                      ),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(choices[index].choice1,
                                        style: TextStyle(
                                            fontSize: 12
                                        ),),
                                      Text(choices[index].choice2,
                                        style: TextStyle(
                                            fontSize: 12
                                        ),),
                                      Text(choices[index].choice3,
                                        style: TextStyle(
                                            fontSize: 12
                                        ),),
                                      Text(choices[index].choice4,
                                        style: TextStyle(
                                            fontSize: 12
                                        ),),
                                    ],
                                  ),
                                  Center(
                                    child: Text(choices[index].answer,
                                      style: TextStyle(
                                          fontSize: 18
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        floatingActionButton: Consumer<QuestionListModel>(
            builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              // 画面遷移
              final bool? added = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuestionPage(),
                  fullscreenDialog: true,
                ),
              );

              if (added != null && added) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('問題を追加しました'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              model.fetchQuestionList();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(40, 61, 89, 1),
          );
        }),
      ),
    );
  }

  Future showConfirmDialog(
      BuildContext context,
      Question choice,
      QuestionListModel model,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("削除の確認"),
          content: Text("『${choice.title}』を削除しますか？"),
          actions: [
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("はい"),
              // onPressed: () async {
              //   // // modelで削除
              //   // await model.delete(book);
              //   // Navigator.pop(context);
              //   // final snackBar = SnackBar(
              //   //   backgroundColor: Colors.red,
              //   //   content: Text('${book.title}を削除しました'),
              //   // );
              //   // model.fetchBookList();
              //   // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // },
              onPressed: null,
            ),
          ],
        );
      },
    );
  }
}
