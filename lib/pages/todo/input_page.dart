import 'package:flutter/material.dart';
import 'list_store.dart';
import '../../../models/todo.dart';

class TodoInputPage extends StatefulWidget {
  final Todo? todo;

  const TodoInputPage({Key? key, this.todo}) : super(key: key);

  @override
  State<TodoInputPage> createState() => _TodoInputPageState();
}

class _TodoInputPageState extends State<TodoInputPage> {
  final TodoListStore _store = TodoListStore();

  late bool _isCreateTodo;
  late String _title;
  late String _detail;
  late String _category;
  late String _purpose;
  late bool _isDone;
  late String _createDate;
  late String _updateDate;

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

    _title = todo?.title ?? "";
    _detail = todo?.detail ?? "";
    _category = todo?.category ?? "";
    _purpose = todo?.purpose ?? "";
    _isDone = todo?.isDone ?? false;
    _createDate = todo?.createDate ?? "";
    _updateDate = todo?.updateDate ?? "";
    _isCreateTodo = todo == null;
  }

  /// 画面を作成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // アプリケーションバーに表示するタイトル
        title: Text(_isCreateTodo ? 'Todo追加' : 'Todo更新'),
      ),
      body: Container(
        // 全体のパディング
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText:  "カテゴリ",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
              controller: TextEditingController(text: _category),
              onChanged: (String value) {
                _category = value;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: "目的",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
              controller: TextEditingController(text: _purpose),
              onChanged: (String value) {
                _purpose = value;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: "やること",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
              controller: TextEditingController(text: _title),
              onChanged: (String value) {
                _title = value;
              },
            ),
            // 詳細のテキストフィールド
            // TextField(
            //   keyboardType: TextInputType.multiline,
            //   maxLines: null,
            //   minLines: 3,
            //   decoration: const InputDecoration(
            //     labelText: "詳細",
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.blue,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.blue,
            //       ),
            //     ),
            //   ),
            //   // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
            //   controller: TextEditingController(text: _detail),
            //   onChanged: (String value) {
            //     _detail = value;
            //   },
            // ),
            const SizedBox(height: 20),
            // 追加/更新ボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_isCreateTodo) {
                    // Todoを追加する
                    _store.add(_isDone, _title, _detail, _category, _purpose);
                  } else {
                    // Todoを更新する
                    _store.update(widget.todo!, _isDone, _title, _detail, _category, _purpose);
                  }
                  // Todoリスト画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text(
                  _isCreateTodo ? '追加' : '更新',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // キャンセルボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Todoリスト画面に戻る
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  "キャンセル",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // 作成日時のテキストラベル
            Text("作成日時 : $_createDate"),
            // 更新日時のテキストラベル
            Text("更新日時 : $_updateDate"),
          ],
        ),
      ),
    );
  }
}