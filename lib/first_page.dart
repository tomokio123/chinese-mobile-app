import 'package:flutter/material.dart';
import 'package:chinese_app/main.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ElevatedButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        style: ElevatedButton.styleFrom(
          //ElevatedButtonの背景色を下で定義
          primary: Colors.white,
          elevation: 40,
        ),
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: size.width * 0.62 ,
                    child: Image.asset('assets/images/2da20841315d8861e8e49e697a514919_t.jpeg')),
              ],
            )
        )
        ),
      );
  }
}