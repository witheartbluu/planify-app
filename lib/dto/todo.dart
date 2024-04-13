class ToDo {
  late int? id;
  late String title;


  ToDo(this.id, this.title);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,

    };
    return map;
  }

  ToDo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];

  }
}
