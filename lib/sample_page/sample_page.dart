import 'package:chinese_app/main.dart';
import 'package:chinese_app/sample_page/sample_page_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../add_book/add_book_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SamplePage());
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();
    return MaterialApp(
      home: ChangeNotifierProvider<SamplePageModel>(
        //↓このようにすることでBookListPageが回ったタイミングでfetchBooks（）がまわるようになる。
        create: (_) => SamplePageModel()..fetchBooks(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            // //以上の記述一行だけでNavigationのBack矢印が消せる。
            backgroundColor: Color.fromRGBO(41, 60, 89, 1),
            title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                //ジェスチャーを検出するウィジェット。
                // null以外のコールバックに対応するジェスチャを認識しようとします。
                //つまり　→　タッチ/ボタン入力検出用途で利用　する！！
                child: Icon(
                    Icons.logout),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
          ),
          body: Consumer<SamplePageModel>(
            builder: (context, model, child) {
              final books = model.books;//詳しくはノートにメモした
              if (books == null) {
                return CircularProgressIndicator();
                //CircularProgressIndicator();（これはwidgetの中の一つ）
                // とはたびたび使用される上のようなグルグルの事です。
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    //Vertical viewport was given unbounded height.のエラーが出てこれを記述した
                    //原因:Columnの中でListViewを使う場合、そのまま使うとListViewの大きさが定まらず,
                    //こののようなエラーが吐かれてしまう。
                    itemCount: books.length,
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
                            //color: Colors.lime,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(books[index].title,
                                style: TextStyle(
                                  fontSize: 22
                                ),),
                                Text(books[index].author,
                                  style: TextStyle(
                                      fontSize: 12
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // 画面遷移
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  //下から出てくる
                ),
              );
            },
            backgroundColor: Color.fromRGBO(40, 61, 89, 1),
            child: const Icon(Icons.navigation),
          ),
        ),
      ),
    );
  }
}