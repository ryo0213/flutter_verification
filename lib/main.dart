import 'package:flutter/material.dart';
import 'package:flutter_verification/future_example.dart';
import 'package:flutter_verification/sync_processing_example.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '非同期処理のテスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '非同期処理のテスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                final docs = SyncProcessingExample.pickAllDocuments();
                print(docs);
                print('next....');
              },
              child: const Text('同期処理を実行する例'),
            ),
            ElevatedButton(
              onPressed: () {
                final docs = FutureExample.pickAllDocuments();
                print(docs);
                print('next....');
              },
              child: const Text('時間が掛かる関数の返り値の型をFutureとする例'),
            ),
            
            Text('・Futureクラスのthen関数を利用し、時間が掛かる関数の値処理が終わる前に次の処理実施'),
            Text('・then関数の引数として与えたコールバック関数は、時間が掛かる関数の値処理が終わった際に実行'),
            ElevatedButton(
              onPressed: () {
                final docs = FutureExample.pickAllDocuments();
                docs.then((value) => print(value));
                // print(docs);
                print('next....');
              },
              child: const Text('非同期処理：Futureクラスのthen関数を利用'),
            ),
          ],
        ),
      ),
    );
  }
}
