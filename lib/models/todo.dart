///
/// [説明] Todoモデル
///

class Todo {
  late int id;
  late String title;
  late String detail;
  late String category;
  late String purpose;
  late bool isDone;
  late String createDate;
  late String updateDate;

  Todo(
      this.id,
      this.title,
      this.detail,
      this.category,
      this.purpose,
      this.isDone,
      this.createDate,
      this.updateDate,
      );

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'category': category,
      'purpose': purpose,
      'isDone': isDone,
      'createDate': createDate,
      'updateDate': updateDate
    };
  }

  /// MapをTodoモデルに変換する(読込時に使用)
  Todo.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    category = json['category'];
    purpose = json['purpose'];
    isDone = json['isDone'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
  }
}