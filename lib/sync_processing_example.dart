
// 通常の同期処理
class SyncProcessingExample {

  static String pickAllDocuments() {
    String docs = '';
    // 時間がかかる処理と想定
    for (int i = 0; i < 100000; ++i) {
      if (i == 99999) docs = 'Finish pickAllDocuments!';
    }
    return docs;
  }

}