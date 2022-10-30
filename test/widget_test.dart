import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_verification/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens("app", (WidgetTester tester) async {
    // 配列で複数解像度を追加していく
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletLandscape,
        Device.tabletPortrait,
        Device(name: 'phone_test', size: Size(500, 500)),

      ])

      // どのWidgetでテストをするか指定する
      ..addScenario(
          widget: MyApp(),
          name: "最初のページ",
      );

    // 複数の解像度でスクリーンショットをビルドする
    await tester.pumpDeviceBuilder(builder);

    // マスターのスクリーンショットと現在のスクリーンショットと同じかテストする。第二引数は生成されるスクリーンショットのファイル名
    await screenMatchesGolden(tester, "myApp");
  });

}
