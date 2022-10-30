import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_verification/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens("app", (WidgetTester tester) async {
    // 複数の解像度でスクリーンショットをビルドする
    await tester.pumpWidgetBuilder(MyApp());

    await multiScreenGolden(
        tester,
        'myApp',
        devices: [
          // 配列で複数解像度を追加していく
          const Device(
            name: '360*640(16:9)',
            size: Size(360, 640),
          ),
          const Device(
            name: '360*780(19.5:9)',
            size: Size(360, 780),
          ),
          const Device(
            name: '360*800(20:9)',
            size: Size(360, 800),
          ),
        ],
    );

    // マスターのスクリーンショットと現在のスクリーンショットと同じかテストする。第二引数は生成されるスクリーンショットのファイル名
    await screenMatchesGolden(tester, "myApp");
  });

}
