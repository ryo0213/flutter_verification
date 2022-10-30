import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_verification/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens("app", (WidgetTester tester) async {
    // デバイスの画面サイズ
    final size = Size(415, 896);

    // 第一引数はどのWidgetをビルドするのか指定、どのサイズにビルドするかがsurfaceSize
    await tester.pumpWidgetBuilder(MyApp(), surfaceSize: size);

    // マスターのスクリーンショットと同じかテストする。第二引数は生成されるスクリーンショットのファイル名
    await screenMatchesGolden(tester, "myApp");
  });

}
