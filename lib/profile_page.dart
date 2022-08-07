import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  //言語選択ページは特に値によって画面描画が変わらないので、StatelessWidget でいい、はず
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //上記の一行でサイズの割合指定ができる！size.width ってやつ。
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 84, 110, 1),//背景色
      appBar: AppBar(
        title: Text(
          'ProfilePage',
        ),
        backgroundColor: Color.fromRGBO(41, 60, 89, 1),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white54,
            child: Center(
              child: Text('Profile1'),
            ),
          ),
          Container(
            color: Colors.red,
            child: Center(
              child: Text('Profile2'),
            ),
          )
        ],
      ),
    );
  }
}