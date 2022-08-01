import 'package:flutter/material.dart';
import 'pages/todo//list_page.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリケーションのタイトル
      title: 'Todoリスト',
      // アプリケーションのテーマ
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // Todoリスト画面を生成しホーム画面とする
      home: const TodoListPage(),
    );
  }
}