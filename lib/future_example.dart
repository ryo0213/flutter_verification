// 時間が掛かる関数の返り値の型をFutureとする例
class FutureExample {
  static Future<String> pickAllDocuments() {
    String docs = '';
    // 時間がかかる処理と想定
    for (int i = 0; i < 100000; ++i) {
      if (i == 99999) docs = 'Finish pickAllDocuments!';
    }
    return Future<String>.value(docs);
  }

}