// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chinese_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HomeScreen());
    //check対象のクラスを引数にわたす。今はHomeScreen()
    //自動的な Widget の再生成がテスト実行環境では行われません
    //なのでテストコードの中で明示的に Widget 再生成の指示を出す必要があり、それがこの pump()です。

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    //find()は文字やアイコンなどを元に該当する Widget を特定する Finder として機能します。
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
