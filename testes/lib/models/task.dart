class Task {
  int id;
  String title;
  String description;
  String tempoprevisto;
  String tempototal;
  bool isDone;

  Task({
    this.id,
    this.title,
    this.description,
    this.tempoprevisto,
    this.tempototal,
    this.isDone = false,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        tempoprevisto: json["tempoprevisto"],
        tempototal: json["tempototal"],
        isDone: json["isDone"] == 1,
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "description": description,
      "tempoprevisto": tempoprevisto,
      "tempototal": tempototal,
      "isDone": isDone ? 1 : 0
    };

    if (id != null) map["id"] = id;

    return map;
  }
}
