class TodoModel {

  String? todo_title;
  String? todo_desc;

  TodoModel({this.todo_title, this.todo_desc});

  factory TodoModel.fromMap(map) {
    return TodoModel(
      todo_title: map['todo_title'],
      todo_desc: map['todo_desc'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todo_title': todo_title,
      'todo_desc': todo_desc,
    };
  }
}
